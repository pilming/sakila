<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>getInventoryList</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
</head>
<div class="container">
    <h1>getInventoryList</h1>
    <jsp:include page="/WEB-INF/inc/navigation.jsp"></jsp:include>
    <table class="table">
		<thead>
			<tr>
				<th>Film ID</th>
				<th>Film Title</th>
				<th>Store</th>
				<th>총 수량</th>
				<th>대여 중</th>
				<th>대여 가능 수량</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" begin="${beginRow}" end="${rowPerPage-1}">
				<tr>
					<c:if test="${list[i].filmId==list[i-1].filmId}">
						<c:if test="${list[i].storeId == 1}">
	                		<td>store 1</td>
	                	</c:if>
	                	<c:if test="${list[i].storeId == 2}">
	                		<td>store 2</td>
	                	</c:if>
						<td>${list[i].total}</td>
						<td>${notStockCnt[i]}</td>
						<td>${stockCnt[i]}</td>
					</c:if>
				</tr>
				<tr>
					<c:if test="${list[i].filmId!=list[i-1].filmId}">
						<td rowspan="2">${list[i].filmId}</td>
						<td rowspan="2"><a href="${pageContext.request.contextPath}/admin/getInventoryOne?filmId=${list[i].filmId}&title=${list[i].title}">${list[i].title}</a></td>
						<c:if test="${list[i].storeId == 1}">
	                		<td>store 1</td>
	                	</c:if>
	                	<c:if test="${list[i].storeId == 2}">
	                		<td>store 2</td>
	                	</c:if>
						<td>${list[i].total}</td>
						<td>${notStockCnt[i]}</td>
						<td>${stockCnt[i]}</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
  
    <!-- 검색어 입력창 -->
    <form action="${pageContext.request.contextPath}/admin/getInventoryList" method="get">
        <label for="searchWord">검색어(이름) :</label> 
        <input name="searchWord" type="text">
        <button type="submit">검색</button>
    </form>
    
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a></li>
        </c:if>
    </ul>
</div>
</body>
</html>