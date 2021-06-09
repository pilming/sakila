<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>getCustomerOne</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#rentalBtn').click(function() {
		console.log('rentalBtn clicked!');
		$.ajax({
			type:'get',
			url:'/filmTitle',
			success: function(jsonData) {
				$(jsonData).each(function(index, item) {
					$('#film').append(
						'<option value="'+item.filmId+'">'+item.title+'</option>'
					);
				});
			}
		});
		$('#film').change(function(){
			console.log('store목록');
			$('#store').empty();
			$('#store').append(
					'<option value="1">store1</option>'+
					'<option value="2">store2</option>'	
			);
		});
		$('#store').change(function(){
			console.log('inventory목록');
			$.ajax({
				type:'get',
				url:'/filmTitle',
				success: function(jsonData) {
					$(jsonData).each(function(index, item) {
						$('#film').append(
							'<option value="'+item.filmId+'">'+item.title+'</option>'
						);
					});
				}
			});
		});
    });
});
	
	/*
	
	
	$('#city').change(function(){
		console.log('address 목록');
		$.ajax({
			type:'get',
			url:'/address',
			data:{cityId : $('#city').val()},
			success: function(jsonData) {
				$('#address').empty();
				$(jsonData).each(function(index, item) {
					$('#address').append(
						'<option value="'+item.addressId+'">'+item.address+'</option>'
					);
				});
			}
		}); // address 목록을 받아와서 address select 태그안에 option태그를 추가
	}); */

</script>
</head>
<body>
<div class="container">
    <h1>getCustomerOne</h1>
     <table class="table">
         <tbody>
			<tr>
                   <td>customerId :</td>
                   <td>${customerOne.customerId}</td>
            </tr>
            <tr>
                   <td>store :</td>
                   <c:if test="${customerOne.storeId == 1}">
                		<td>store 1</td>
                	</c:if>
                	<c:if test="${customerOne.storeId == 2}">
                		<td>store 2</td>
                	</c:if>
            </tr>
            <tr>
                   <td>name :</td>
                   <td>${customerOne.name}</td>
            </tr>
            <tr>
                   <td>email :</td>
                   <td>${customerOne.email}</td>
            </tr>
            <tr>
                   <td>address :</td>
                   <td>${customerOne.address}</td>
            </tr>
            <tr>
                   <td>district :</td>
                   <td>${customerOne.district}</td>
            </tr>
            <tr>
                   <td>active :</td>
                   <td>${customerOne.active}</td>
            </tr>
            <tr>
                   <td>createDate :</td>
                   <td>${customerOne.createDate}</td>
            </tr>
            <tr>
                   <td>blackList :</td>
                   <c:if test="${customerOne.delayCount > 15}">
               			<td style="color:red">BLACK CONSUMER</td>
               		</c:if>
               		<c:if test="${!(customerOne.delayCount > 15)}">
               			<td>&nbsp;</td>
               		</c:if>
            </tr>
            <tr>
                   <td>paymentTotal :</td>
                   <c:if test="${customerOnePayment != null}">
               			<td>$${customerOnePayment}</td>
               		</c:if>
               		<c:if test="${!(customerOnePayment != null)}">
               			<td>&nbsp;</td>
               		</c:if>
                   
            </tr>
        </tbody>
    </table>
    <div>
	    <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getCustomerList?currentPage=${currentPage}&searchWord=${searchWord}&storeId=${storeId}">고객목록</a>	
	    <a class="btn btn-default" id = "rentalBtn">대여</a>
   	</div>
   	<div id ="rentalZone">
   		<select name="filmId" id="film"></select>
		<select name="storeId" id="store"></select>
		<select name="inventoryId" id="inventory"></select>
   	</div>
    <br>
    <h3>RecentRentalHistory (최근 20건)</h3>
     <table class="table">
		<thead>
			<tr>
				<th>Film ID</th>
				<th>Film Title</th>
				<th>Store</th>
				<th>Inventory Id</th>
				<th>State</th>
				<th>Return</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var = "h" items = "${customerOneRentalHistory}">
				<tr>
					<td>${h.filmId}</td>
					<td>${h.title}</td>
					<c:if test="${h.storeId == 1}">
                		<td>store 1</td>
                	</c:if>
                	<c:if test="${h.storeId == 2}">
                		<td>store 2</td>
                	</c:if>
					<td>${h.inventoryId}</td>
					<td>${h.state}</td>
					<c:if test="${h.state == '대여중'}">
                		<td><button>반납</button></td>
                	</c:if>
                	<c:if test="${!(h.state == '대여중')}">
                		<td>&nbsp;</td>
                	</c:if>
				</tr>
			</c:forEach>
			
		
		</tbody>
    </table>
    	
</div>
</body>
</html>