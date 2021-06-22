<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>재고 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
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
                        <h1 class="mt-4">재고 목록</h1>
                        <div class="card mb-4">
                            <div class="card-body">
                                Sakila 재고 목록입니다.
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-boxes"></i>
                                INVENTORY LIST
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
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
                                    <tfoot>
                                        <tr>
                                            <th>Film ID</th>
											<th>Film Title</th>
											<th>Store</th>
											<th>총 수량</th>
											<th>대여 중</th>
											<th>대여 가능 수량</th>
                                        </tr>
                                    </tfoot>
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