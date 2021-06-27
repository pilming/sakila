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
	<title>FILM VIEW(spring mvc 방식)</title>
	<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('#btn').click(function() {
			if ($('#title').val().length < 4) {
                alert('title은 3자이상 이어야 합니다');
                $('#title').focus();
            } else {
                $('#addFilmForm').submit();
            }
        });
    });
</script>
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
                            <h1>addFilm</h1>
                        </div>
                    </div>
                    <div class="container">
				      <form method="post" action="${pageContext.request.contextPath}/admin/addFilm" id="addFilmForm">
				         <table class="table table-hover">
				            <tr>
				               <td>title</td>
				               <td>
				                  <input type="text" name="film.title" id="title" class="form-control">
				               </td>
				            </tr>
				            <tr>
				               <td>category</td>
				               <td>
				                  <select name="category.categoryId" id ="categoryId" class="form-control">
				                     <c:forEach var="c" items="${categoryList}">
				                        <option value="${c.categoryId}">${c.name}</option>
				                     </c:forEach>
				                  </select>
				               </td>
				            </tr>
				            <tr>
				               <td>description</td>
				               <td>
				                  <textarea rows="5" cols="100" name="film.description" id="description" class="form-control"></textarea>
				               </td>
				            </tr>
				            <tr>
				               <td>releaseYear</td>
				               <td>
				                  <input type="text" name="film.releaseYear" id="releaseYear" class="form-control">
				               </td>
				            </tr>
				            <tr>
				               <td>language</td>
				               <td>
				                  <select name="film.languageId" id ="language" class="form-control">
				                     <c:forEach var="lang" items="${languageList}">
				                        <option value="${lang.languageId}">${lang.name}</option>
				                     </c:forEach>
				                  </select>
				               </td>
				            </tr>
				            <tr>
				               <td>originalLanguage</td>
				               <td>
				                  <select name="film.originalLanguageId" id ="originalLanguage" class="form-control">
				                     <option value="">======</option>
				                     <c:forEach var="lang" items="${languageList}">
				                        <option value="${lang.languageId}">${lang.name}</option>
				                     </c:forEach>
				                  </select>
				               </td>
				            </tr>
				            <tr>
				               <td>rentalDuration</td>
				               <td>
				                  <input type="text" name="film.rentalDuration" id="rentalDuration" class="form-control">               
				               </td>
				            </tr>
				            <tr>
				               <td>rentalRate</td>
				               <td>
				                  <input type="text" name="film.rentalRate" id="rentalRate" class="form-control">
				               </td>
				            </tr>
				            <tr>
				               <td>length</td>
				               <td>
				                  <input type="text" name="film.length" id="length" class="form-control">
				               </td>
				            </tr>
				            <tr>
				               <td>replacementCost</td>
				               <td>
				                  <input type="text" name="film.replacementCost" id="replacementCost" class="form-control">
				               </td>
				            </tr>
				            <tr>
				               <td>rating</td>
				               <td>
				                  <select name="film.rating" id ="rating" class="form-control">
				                     <option value="G">G</option>
				                     <option value="PG">PG</option>
				                     <option value="PG-13">PG-13</option>
				                     <option value="R">R</option>
				                     <option value="NC-17">NC-17</option>
				                  </select>
				               </td>
				            </tr>
				            <tr>
				               <td>specialFeatures</td>
				               <td>
				                  <input type="checkbox" name="specialFeatures" value="Trailers">Trailers&nbsp;
				                  <input type="checkbox" name="specialFeatures" value="Commentaries">Commentaries&nbsp;
				                  <input type="checkbox" name="specialFeatures" value="Deleted Scenes">Deleted Scenes&nbsp;
				                  <input type="checkbox" name="specialFeatures" value="Behind the Scenes">Behind the Scenes
				               </td>
				            </tr>
				         </table>
				         
				         <button id="btn" class="btn btn-secondary">등록</button>
				         <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/getFilmList">영화목록</a>
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