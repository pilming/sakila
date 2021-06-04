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
        </tbody>
    </table>
    	<div>
		    <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getCustomerList?currentPage=${currentPage}&searchWord=${searchWord}&storeId=${storeId}">글목록</a>	
    	</div>
</div>
</body>
</html>