<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
	<title>INVENTORY VIEW(spring mvc 방식)</title>
	<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <jsp:include page="/WEB-INF/inc/navBar.jsp"></jsp:include>
    </nav>
    <div id="layoutSidenav">
    	<div id="layoutSidenav_nav">
        	<jsp:include page="/WEB-INF/inc/sideNavBar.jsp"></jsp:include>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                	<br>
                    <div class="card mb-4">
                        <div class="card-body">
                            <h1>getInventoryOne</h1>
                        </div>
                    </div>
                    <div class="container">
				     <h3>${title}_inventory</h3>
				     <table class="table table-hover">
				     	<thead>
				     		<tr>
				     			<th>store</th>
				     			<th>inventoryId</th>
				     			<th>state</th>
				     			<th>delete</th>
				     		</tr>
				     	</thead>
				         <tbody>
				         	<!-- 스토어별로 보여주기위해서 나눔 -->
				         	<c:forEach var = "i" items = "${inventoryInfoList}">
				         		<c:if test="${i.storeId == 1}">
						         	<tr>		
				         				<td>store1</td>
					         			
						         		<td>${i.inventoryId}</td>
						         		
					         			<c:if test="${i.rentable.equals('T')}">
					         				<td>대여가능</td>
					         			</c:if>
					         			<c:if test="${i.rentable.equals('F')}">
					         				<td>대여불가능</td>
					         			</c:if>
					         			
						         		<c:if test="${i.rentable.equals('T')}">
					         				<td>
					         					<button type = "button" class="btn btn-secondary" disabled="disabled">삭제</button>
					         					<!-- 외래키 이슈료 삭제 비활성화
					         					<a href ="${pageContext.request.contextPath}/admin/removeInventory?filmId=${filmId}&inventoryId=${i.inventoryId}&title=${title}" ></a> -->
					         				</td>
					         			</c:if>
					         			<c:if test="${i.rentable.equals('F')}">
					         				<td>현재 대여중</td>
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
					         				<td>대여가능</td>
					         			</c:if>
					         			<c:if test="${i.rentable.equals('F')}">
					         				<td>대여불가능</td>
					         			</c:if>
					         			
						         		<c:if test="${i.rentable.equals('T')}">
					         				<td>
					         					<button type = "button" class="btn btn-secondary" disabled="disabled">삭제</button>
					         					<!-- 외래키 이슈로 삭제 비활성화 -->
					         					<!--<a href ="${pageContext.request.contextPath}/admin/removeInventory?filmId=${filmId}&inventoryId=${i.inventoryId}&title=${title}"></a>-->
					         				</td>
					         			</c:if>
					         			<c:if test="${i.rentable.equals('F')}">
					         				<td>현재 대여중</td>
					         			</c:if>
						         	</tr>
					         	</c:if>
				         	</c:forEach>
				        </tbody>
				    </table>
				    <div>
				   		<a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/addInventory?filmId=${filmId}&title=${title}">재고추가</a>
						<button class="btn btn-secondary" type="button" onclick='history.back()'>목록보기</button>
				   	</div>
					
				</div>
                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Choi Jae Hyeon 2021</div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/js/datatables-simple-demo.js"></script>
</body>
</html>
