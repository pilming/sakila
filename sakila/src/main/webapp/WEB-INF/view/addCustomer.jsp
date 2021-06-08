<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	/* $(document).ready(function() {
	    $('#addButton').click(function() {
			if ($('#storId').val() == '') {
	            alert('storId를 선택해야됩니다.');
	            $('#storId').focus();
	        } else {
	            $('#addForm').submit();
	        }
	    });
	}); */
</script>
<title>addCustomer</title>
</head>
<body>
   <div class="container">
      <h1>add customer</h1>
      <form method="post" action="${pageContext.request.contextPath}/admin/addCustomer" id="addCustomer">
         <table class="table table-hover">
            <tr>
            	<td>store</td>
            	<td class="form-group">
	                <select name ="storeId" id = "storId" class="form-control">
	                	<option value="">선택</option>
	                	<option value="1">store1</option>
	                	<option value="2">store2</option>
	                </select>
            	</td>
            </tr>
            <tr>
               <td>firstName</td>
               <td>
                  <input type="text" name="firstName" id="firstName" class="form-control">
               </td>
            </tr>
			 <tr>
               <td>lastName</td>
               <td>
                  <input type="text" name="lastName" id="lastName" class="form-control">
               </td>
            </tr>
             <tr>
               <td>email</td>
               <td>
                  <input type="text" name="email" id="email" class="form-control">
               </td>
            </tr>
             <tr>
               <td>address</td>
               <td>
                  <input type="text" name="address" id="address" class="form-control">
               </td>
            </tr>
             <tr>
               <td>address2</td>
               <td>
                  <input type="text" name="address2" id="address2" class="form-control">
               </td>
            </tr>
             <tr>
               <td>district</td>
               <td>
                  <input type="text" name="district" id="district" class="form-control">
               </td>
            </tr>
            <!-- 주소데이터 가져와서 드랍다운으로 제공 -->
            <tr>
            	<td>city</td>
            	<td>
	                <select name="cityId" id ="cityId" class="form-control">
	                	<option value="">선택</option>
		                <c:forEach var="c" items="${cityList}">
                			<option value="${c.cityId}">${c.city}</option>
		                </c:forEach>
	                </select>
            	</td>
            </tr>
             <tr>
               <td>postalCode</td>
               <td>
                  <input type="text" name="postalCode" id="postalCode" class="form-control">
               </td>
            </tr>
             <tr>
               <td>phone</td>
               <td>
                  <input type="text" name="phone" id="phone" class="form-control">
               </td>
            </tr>
         </table>
         
         <button id="btn" class="btn btn-default">등록</button>
         <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getCustomerList">고객목록</a>
      </form>
      
   </div>
</body>
</html>