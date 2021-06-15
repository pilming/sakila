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
	// setup edit
	let x = []
	let y = []
	$.ajax({
	    url:'/salesByCategory',
	    type:'get',
	    success:function(json){
	       // json -----> data.lebels, data.data
	       $(json).each(function(index, item){ // 0번째 item  {"ration":"G", "cnt": 178}
	          x.push(item.category);
	          y.push(item.sales);
	       });
	    }
	 });
	console.log(x);
	console.log(y);
	$(document).ready(function() {
		$('#btn').click(function () {
			$('#loginForm').submit();
		});	
	   
		   // setup
		   let data = {
		     labels: x,
		     datasets: [{
		       label: 'Sales By Film Category',
		       data: y,
		       backgroundColor: [
		         'rgba(255, 99, 132, 0.2)',
		         'rgba(255, 159, 64, 0.2)',
		         'rgba(255, 205, 86, 0.2)',
		         'rgba(75, 192, 192, 0.2)',
		         'rgba(54, 162, 235, 0.2)'
		       ],
		       borderColor: [
		         'rgb(255, 99, 132)',
		         'rgb(255, 159, 64)',
		         'rgb(255, 205, 86)',
		         'rgb(75, 192, 192)',
		         'rgb(54, 162, 235)'
		       ],
		       borderWidth: 1
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
		       }
		     },
		   };
		   // 차트를 그리는 코드
		   $('#chartBtn').click(function(){
		      var myChart = new Chart(document.getElementById('myChart'), config);
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
		<a href="${pageContext.request.contextPath}/admin/getBoardList">게시판</a>
		<a href="${pageContext.request.contextPath}/admin/getStaffList">직원목록</a>
		<a href="${pageContext.request.contextPath}/admin/getFilmList">영화목록</a>
		<a href="${pageContext.request.contextPath}/admin/getActorList">배우목록</a>
		<a href="${pageContext.request.contextPath}/admin/getInventoryList">영화별재고목록</a>
		<a href="${pageContext.request.contextPath}/admin/logout">로그아웃</a>
	</c:if>
	
	<button id="chartBtn">매출보기</button>
	<div style="width: 800px; height: 800px;">
	  <canvas id="myChart"></canvas>
	</div>
	
</body>
</html>