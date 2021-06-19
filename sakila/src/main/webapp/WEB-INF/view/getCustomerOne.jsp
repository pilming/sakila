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
		$('#rentalTable').show();
		console.log('rentalBtn clicked!');
		
		$.ajax({
			type:'get',
			url:'${pageContext.request.contextPath}/filmTitle',
			success: function(jsonData) {
				$('#film').append('<option value="">선택</option>');
				$(jsonData).each(function(index, item) {
					$('#film').append(
						'<option value="'+item.filmId+'">'+item.title+'</option>'
					);
				});
			}
		});
		
		$('#film').change(function(){
			console.log('inventory목록');
			$('#inventory').empty();
			$('#inventory').append('<option value="">선택</option>');
			if($('#film').val() != '') {
				$.ajax({
					type:'get',
					url:'${pageContext.request.contextPath}/inventory',
					data:{filmId : $('#film').val()},
					success: function(jsonData) {
						$(jsonData).each(function(index, item) {
							$('#inventory').append(
								'<option  value="'+item+'">'+item+'</option>'
							);
						});
					}
				});
			}

		});
    });
	
	$('#rentalSubmitBtn').click(function() {    	
    	if($('#film').val() == '') {
    		alert('대여 할 film을 선택하세요');
    		$('#film').focus();
    	} else if ($('#store').val() == '') {
    		alert('대여 할 store를 선택하세요');
    		$('#store').focus();
        } else if ($('#inventory').val() == '') {
        	alert('대여 할 inventory를 선택하세요');
    		$('#inventory').focus();
        } else if ($('#staff').val() == '') {
        	alert('대여 할 staff를 선택하세요');
    		$('#staff').focus();
        }else {
            $('#rentalSubmitBtn').submit();
        }
    });
	
	$('.returnBtn').click(function() {    	
		$('#paramZone').empty();
		var btn = $(this);
		var tr = btn.parent().parent();
		var rentalId = tr.children().eq(0);
		var filmId = tr.children().eq(1);
		
		$('#paramZone').append('<input type = "hidden" name ="rentalId" value ="'+rentalId.text()+'">');
		$('#paramZone').append('<input type = "hidden" name ="filmId" value ="'+filmId.text()+'">');
    });
});

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
   	<form action ="${pageContext.request.contextPath}/admin/addRental" method="post" id ="rentalForm">
   		<input type ="hidden" name = "customerId" value = "${customerOne.customerId}">
   		<input type ="hidden" name = "currentPage" value = "${currentPage}">
   		<input type ="hidden" name = "searchWord" value = "${searchWord}">
   		<input type ="hidden" name = "storeId" value = "${storeId}">
   		<table class="table" id ="rentalTable" style="display: none;">
	   		<thead>
	   			<tr>
	   				<th>Film</th>
	   				<th>Inventory</th>
	   				<th>Rental</th>
	   			</tr>
	   		</thead>
	   		<tbody>
	   			<tr>
	   				<td>
	   					<select name="rentalFilmId" id="film" class="form-control">
	   					</select>
	   				</td>
	   				<td>
	   					<select name="rentalInventoryId" id="inventory" class="form-control">
	   						<option>선택</option>
	   					</select>
	   				</td>
	   				<td>
	   					<button id="rentalSubmitBtn" class="btn btn-default">대여완료</button>
	   				</td>
	   			</tr>
	   		</tbody>
	   	</table>
   	</form>
  
    <br>
    <h3>RecentRentalHistory (최근 20건)</h3>
    <form action="${pageContext.request.contextPath}/admin/addReturnDate" method="post" id ="RecentRentalHistoryForm">
    	<input type ="hidden" name = "customerId" value = "${customerOne.customerId}">
   		<input type ="hidden" name = "currentPage" value = "${currentPage}">
   		<input type ="hidden" name = "searchWord" value = "${searchWord}">
   		<input type ="hidden" name = "storeId" value = "${storeId}">
    	<div id = "paramZone"></div>
	    <table class="table">
			<thead>
				<tr>
					<th>rental Id</th>
					<th>Film ID</th>
					<th>Film Title</th>
					<th>Store</th>
					<th>Inventory Id</th>
					<th>State</th>
					<th>Rate Amount</th>
					<th>Return</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var = "h" items = "${customerOneRentalHistory}">
					<tr>
						<td>${h.rentalId}</td>
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
						<td>${h.rateAmount}</td>
						<c:if test="${h.state == '대여중'}">
	                		<td><button class="btn btn-default returnBtn">반납</button></td>
	                	</c:if>
	                	<c:if test="${!(h.state == '대여중')}">
	                		<td>&nbsp;</td>
	                	</c:if>
					</tr>
				</c:forEach>
				
			
			</tbody>
	    </table>
    </form>
    
    	
</div>
</body>
</html>