<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
	<title>CUSTOMER VIEW(spring mvc 방식)</title>
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
                            <h1>addCustomer</h1>
                        </div>
                    </div>
                    <div class="container">
				      <form method="post" action="${pageContext.request.contextPath}/admin/addCustomer" id="addCustomer">
				         <table class="table table-hover">
				            <tr>
				            	<td>store</td>
				            	<td class="form-group">
					                <select name ="storeId" id = "storId" class="form-control">
					                	<option value="">선택</option>
					                	<option value="1">store1</option>
					                	<option value="2">store2</option>
					                </select>
				            	</td>
				            </tr>
				            <tr>
				               <td>firstName</td>
				               <td>
				                  <input type="text" name="firstName" id="firstName" class="form-control">
				               </td>
				            </tr>
							 <tr>
				               <td>lastName</td>
				               <td>
				                  <input type="text" name="lastName" id="lastName" class="form-control">
				               </td>
				            </tr>
				             <tr>
				               <td>email</td>
				               <td>
				                  <input type="text" name="email" id="email" class="form-control">
				               </td>
				            </tr>
				             <tr>
				               <td>address</td>
				               <td>
				                  <input type="text" name="address" id="address" class="form-control">
				               </td>
				            </tr>
				             <tr>
				               <td>address2</td>
				               <td>
				                  <input type="text" name="address2" id="address2" class="form-control">
				               </td>
				            </tr>
				             <tr>
				               <td>district</td>
				               <td>
				                  <input type="text" name="district" id="district" class="form-control">
				               </td>
				            </tr>
				            <!-- 주소데이터 가져와서 드랍다운으로 제공 -->
				            <tr>
				            	<td>city</td>
				            	<td>
					                <select name="cityId" id ="cityId" class="form-control">
					                	<option value="">선택</option>
						                <c:forEach var="c" items="${cityList}">
				                			<option value="${c.cityId}">${c.city}</option>
						                </c:forEach>
					                </select>
				            	</td>
				            </tr>
				             <tr>
				               <td>postalCode</td>
				               <td>
				                  <input type="text" name="postalCode" id="postalCode" class="form-control">
				               </td>
				            </tr>
				             <tr>
				               <td>phone</td>
				               <td>
				                  <input type="text" name="phone" id="phone" class="form-control">
				               </td>
				            </tr>
				         </table>
				         
				         <button id="btn" class="btn btn-secondary">등록</button>
				         <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/getCustomerList">고객목록</a>
				      </form>
				      
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
