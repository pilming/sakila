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
    <title>직원 목록</title>
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
                        <h1 class="mt-4">직원 목록</h1>
                        <div class="card mb-4">
                            <div class="card-body">
                                Sakila 직원 목록입니다.
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-users"></i>
                                STAFF LIST
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>staff ID</th>
							                <th>staff name</th>
							                <th>staff address</th>
							                <th>staff zipCode</th>
							                <th>staff phone</th>
							                <th>staff city</th>
							                <th>staff country</th>
							                <th>staff SID</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>staff ID</th>
							                <th>staff name</th>
							                <th>staff address</th>
							                <th>staff zipCode</th>
							                <th>staff phone</th>
							                <th>staff city</th>
							                <th>staff country</th>
							                <th>staff SID</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
							            <c:forEach var="s" items="${staffViewList}">
							                <tr>
							                	<td>${s.id}</td>
							                    <td>${s.name}</td>
							                    <td>${s.address}</td>
							                    <td>${s.zipCode}</td>
							                    <td>${s.phone}</td>
							                    <td>${s.city}</td>
							                    <td>${s.country}</td>
							                    <td>${s.SID}</td>
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