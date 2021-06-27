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
	<title>ACTOR VIEW(spring mvc 방식)</title>
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
                            <h1>getActorOne</h1>
                        </div>
                    </div>
                    <div class="container">
				     <table class="table table-hover">
				         <tbody>
							<tr>
				                   <td>actorId</td>
				                   <td>${actorOneInfoList[0].actorId}</td>
				            </tr>
				            <tr>
				                   <td>name</td>
				                   <td>${actorOneInfoList[0].name}</td>
				            </tr>
				     </table>
				     <h3>출연영화</h3>
				     <table class="table table-hover">
				            <tr>
				            	<td>
						       		<c:set var="category" value=""/>
									<c:forEach var="a" items ="${actorOneInfoList}">
										<c:if test="${category eq a.category}">
											<span>,&nbsp;</span><a href ="${pageContext.request.contextPath}/admin/getFilmOne?filmId=${a.filmId}">${a.title}</a> 
										</c:if>
										
										<c:if test="${!(category eq a.category)}">
											</td>
											<td></td>
											</tr>
											<tr>
												<td>${a.category}</td>
												<td></td>
											</tr>
											<tr>
											<td>
											<a href ="${pageContext.request.contextPath}/admin/getFilmOne?filmId=${a.filmId}">${a.title}</a> 
											<c:set var="category" value="${a.category}"/>
										</c:if>
									</c:forEach>
								<td>
							</tr>
				        </tbody>
				    </table>
				    	<div>
						    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/getActorList">배우목록</a>	
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
