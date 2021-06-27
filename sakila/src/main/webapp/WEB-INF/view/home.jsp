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
    <title>HOME</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
	$(document).ready(function() {
		/*
		$('#btn').click(function () {
			$('#loginForm').submit();
		});	
	   */
		//////////////////////////////////////////////// 카테고리별 매출
		let category = []
		let categorySales = []
		$.ajax({
		    url:'${pageContext.request.contextPath}/salesByCategory',
		    type:'get',
		    success:function(json){
		       // json -----> data.lebels, data.data
		       $(json).each(function(index, item){
		    	   category.push(item.category);
		    	   categorySales.push(item.sales);
		       });
		       
		       let data = {
					     labels: category,
					     datasets: [{
					       label: 'Sales By Film Category',
					       data: categorySales,
					       borderColor: 'rgb(255, 99, 132)',
						   backgroundColor: 'rgb(255,182,193)'
					     }]
					   };
					   
					   // config
					   const config = {
					     type: 'bar',
					     data: data,
					     options: {
					       scales: {
					         y: {
					           beginAtZero: true
					         }
					       },
					       plugins: {
					            title: {
					                display: true,
					                padding: {
					                    top: 10,
					                    bottom: 30
					                }
					            }
					        }
					     },
					   };
					   // 차트를 그리는 코드
					  var myChart = new Chart(document.getElementById('categorySalesChart'), config);
		    }		 	
		 });
		////////////////////////////////////////////////월별 매출
		let month = []
		let monthlySales = []
		$.ajax({
		    url:'${pageContext.request.contextPath}/monthlyTotal',
		    type:'get',
		    success:function(json){
		       // json -----> data.lebels, data.data
		       $(json).each(function(index, item){
		    	   month.push(item.month);
		    	   monthlySales.push(item.total);
		       });
		       
		       let data = {
					     labels: month,
					     datasets: [{
					       label: 'Monthly Total',
					       data: monthlySales,
					       borderColor: 'rgb(255, 99, 132)',
						   backgroundColor: 'rgb(255,182,193)'
					     }]
					   };
					   
					   // config
					   const config = {
					     type: 'bar',
					     data: data,
					     options: {
					       scales: {
					         y: {
					           beginAtZero: true
					         }
					       },
					       plugins: {
					            title: {
					                display: true,
					                padding: {
					                    top: 10,
					                    bottom: 30
					                }
					            }
					        }
					     },
					   };
					   // 차트를 그리는 코드
					  var monthSalesChart = new Chart(document.getElementById('monthSalesChart'), config);
		    }		 	
		 });
		   
		   
	});
</script>
</head>
<body class="sb-nav-fixed bg-light">
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
                		<c:if test="${loginStaff == null}">
							<div class="container">
		                        <div class="row justify-content-center">
		                            <div class="col-lg-5">
		                                <div class="card shadow-lg border-0 rounded-lg mt-10">
		                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
		                                    <div class="card-body">
		                                        <form action="${pageContext.request.contextPath}/login" method="post">
		                                            <div class="form-floating mb-3">
		                                                <input class="form-control" id="inputEmail" type="email" name = "email" value="Mike.Hillyer@sakilastaff.com" />
		                                                <label for="inputEmail">Email address</label>
		                                            </div>
		                                            <div class="form-floating mb-3">
		                                                <input class="form-control" id="inputPassword" type="password" name = "password" value ="1234" />
		                                                <label for="inputPassword">Password</label>
		                                            </div>
		                                            <div class="align-items-center justify-content-between mt-4 mb-0 text-center">
		                                                <button class="btn btn-primary" type = "submit">로그인</button>
		                                            </div>
		                                        </form>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
						</c:if>
						
						<!-- 로그온 일때 -->
						<c:if test="${loginStaff != null}">
							<h1 class="mt-4">HOME</h1>
							<div class="card mb-4">
	                            <div class="card-body">
	                                ${loginStaff.username}님 반갑습니다.
	                            </div>
	                        </div>
	                        <div class="card mb-4">
	                            <div class="card-header">
	                                <i class="fas fa-chart-area me-1"></i>
	                                카테고리별 매출
	                            </div>
	                            <div class="card-body"><canvas id="categorySalesChart" width="100%" height="30"></canvas></div>
	                        </div>
	                        <div class="card mb-4">
	                            <div class="card-header">
	                                <i class="fas fa-chart-area me-1"></i>
	                                월별 매출
	                            </div>
	                            <div class="card-body"><canvas id="monthSalesChart" width="100%" height="30"></canvas></div>
	                        </div>
						</c:if>
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