<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>getActorOne</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <h1>getActorOne</h1>
     <table class="table">
         <tbody>
			<tr>
                   <td>actorId :</td>
                   <td>${actorOneInfoList[0].actorId}</td>
            </tr>
            <tr>
                   <td>name :</td>
                   <td>${actorOneInfoList[0].name}</td>
            </tr>
            <tr>
            	<td>출연영화</td>
            	<td></td>
            </tr>
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
		    <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getActorList">배우목록</a>	
    	</div>
	
</div>
</body>
</html>