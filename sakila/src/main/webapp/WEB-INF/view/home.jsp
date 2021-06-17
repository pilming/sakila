<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
	
	$(document).ready(function() {
		$('#btn').click(function () {
			$('#loginForm').submit();
		});	
	   
		//////////////////////////////////////////////// 카테고리별 매출
		let category = []
		let categorySales = []
		$.ajax({
		    url:'/salesByCategory',
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
					                text: '카테고리별 매출',
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
		    url:'/monthlyTotal',
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
					                text: '월별 매출',
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
<body>
	<h1>Home</h1>
	<!-- 로그오프 일때 -->
	<c:if test="${loginStaff == null}">
		<form id = "loginForm" action="${pageContext.request.contextPath}/login" method="post">
			<div>email :</div>
			<div><input type = "text" id = "email" name = "email" value="Mike.Hillyer@sakilastaff.com"></div>
			<div>password :</div>
			<div><input type = "password" id="password" name = "password" value ="1234"></div>
			<div>
				<button id = "btn" type = "button">로그인</button>
			</div>
			
		</form>
	</c:if>
	
	<!-- 로그온 일때 -->
	<c:if test="${loginStaff != null}">
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/inc/navigation.jsp"></jsp:include>
		<a href="${pageContext.request.contextPath}/admin/logout">로그아웃</a>
		<div style="width: 800px; height: 800px;">
			<div>
				<canvas id="categorySalesChart"></canvas>
			</div>
		  <div>
		  	<canvas id="monthSalesChart"></canvas>
		  </div>
		</div>
	</c:if>
	
	
</body>
</html>