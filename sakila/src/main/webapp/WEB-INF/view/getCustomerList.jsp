<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>getFilmList</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
</head>
<body>
<div class="container">
    <h1>getFilmList</h1>
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/inc/navigation.jsp"></jsp:include>
	
	<form action = "${pageContext.request.contextPath}/admin/getCustomerList" method="get"> 


		<select name = "storeId">
			<option value = "">지점선택</option>
			<c:if test="${storeId == 1}">
				<option value = "1" selected="selected">store 1</option>
			</c:if>
			<c:if test="${storeId != 1}">
				<option value = "1">store 1</option>
			</c:if>
			<c:if test="${storeId == 2}">
				<option value = "2" selected="selected">store 2</option>
			</c:if>
			<c:if test="${storeId != 2}">
				<option value = "2">store 2</option>
			</c:if>
		</select>
		<c:if test="${serchWord != null and serchWord != ''}">
			<input name="searchWord" type="hidden" >
		</c:if>
		
		<label for="searchWord">이름검색 :</label> 
        <input name="searchWord" type="text" value="${searchWord}">
        
        <button type="submit">조회</button>
	</form>
	
	
    <table class="table table-striped">
        <thead>
            <tr>
                <th>customerId</th>
                <th>store</th>
                <th>name</th>
                <th>email</th>
                <th>status</th>
                <th>blackList</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="c" items="${CustomerList}">
                <tr>
                	<td>${c.customerId}</td>
                	<c:if test="${c.storeId == 1}">
                		<td>store 1</td>
                	</c:if>
                	<c:if test="${c.storeId == 2}">
                		<td>store 2</td>
                	</c:if>
                	<td><a href ="${pageContext.request.contextPath}/admin/getCustomerOne?currentPage=${currentPage}&storeId=${storeId}&searchWord=${searchWord}&customerId=${c.customerId}">${c.name}</a></td>
                	<td>${c.email}</td>
                	<td>${c.active}</td>
               		<c:if test="${c.delayCount > 15}">
               			<td style="color:red">BLACK CONSUMER</td>
               		</c:if>
               		<c:if test="${!(c.delayCount > 15)}">
               			<td>&nbsp;</td>
               		</c:if>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div>
        <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/addCustomer">고객추가</a>
    </div>
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/admin/getCustomerList?currentPage=${currentPage-1}&storeId=${storeId}&searchWord=${searchWord}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/admin/getCustomerList?currentPage=${currentPage+1}&storeId=${storeId}&searchWord=${searchWord}">다음</a></li>
        </c:if>
    </ul>
</div>
</body>
</html>