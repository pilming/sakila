<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>getInventoryOne</title>
<!-- bootstrap�� ����ϱ� ���� CDN�ּ� -->
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
    <h1>getInventoryOne</h1>
     <hr>
     <h3>${title}_inventory</h3>
     <table class="table">
     	<thead>
     		<tr>
     			<th>store</th>
     			<th>inventoryId</th>
     			<th>state</th>
     			<th>delete</th>
     		</tr>
     	</thead>
         <tbody>
         	<!-- ������ �����ֱ����ؼ� ���� -->
         	<c:forEach var = "i" items = "${inventoryInfoList}">
         		<c:if test="${i.storeId == 1}">
		         	<tr>		
         				<td>store1</td>
	         			
		         		<td>${i.inventoryId}</td>
		         		
	         			<c:if test="${i.rentable.equals('T')}">
	         				<td>�뿩����</td>
	         			</c:if>
	         			<c:if test="${i.rentable.equals('F')}">
	         				<td>�뿩�Ұ���</td>
	         			</c:if>
	         			
		         		<c:if test="${i.rentable.equals('T')}">
	         				<td><a href ="${pageContext.request.contextPath}/admin/removeInventory?filmId=${filmId}&inventoryId=${i.inventoryId}&title=${title}"><button type = "button" class="btn btn-default">����</button></a></td>
	         			</c:if>
	         			<c:if test="${i.rentable.equals('F')}">
	         				<td>���� �뿩��</td>
	         			</c:if>
		         	</tr>
	         	</c:if>
         	</c:forEach>
         	<c:forEach var = "i" items = "${inventoryInfoList}">
	         	<c:if test="${i.storeId == 2}">
		         	<tr>
	       				<td>store2</td>
	         			
		         		<td>${i.inventoryId}</td>
		         		
	         			<c:if test="${i.rentable.equals('T')}">
	         				<td>�뿩����</td>
	         			</c:if>
	         			<c:if test="${i.rentable.equals('F')}">
	         				<td>�뿩�Ұ���</td>
	         			</c:if>
	         			
		         		<c:if test="${i.rentable.equals('T')}">
	         				<td><a href ="${pageContext.request.contextPath}/admin/removeInventory?filmId=${filmId}&inventoryId=${i.inventoryId}&title=${title}"><button type = "button" class="btn btn-default">����</button></a></td>
	         			</c:if>
	         			<c:if test="${i.rentable.equals('F')}">
	         				<td>���� �뿩��</td>
	         			</c:if>
		         	</tr>
	         	</c:if>
         	</c:forEach>
        </tbody>
    </table>
    <div>
   		<a class="btn btn-default" href="${pageContext.request.contextPath}/admin/addInventory?filmId=${filmId}&title=${title}">����߰�</a>
		<button class="btn btn-default" type="button" onclick='history.back()'>��Ϻ���</button>
   	</div>
	
</div>
</body>
</html>