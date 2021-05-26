<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ADD FILM ACTOR</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('#addButton').click(function() {
        	$('#addForm').submit();
        	/*
			if ($('#firstName').val().length < 4) {
                alert('firstName는 3자이상 이어야 합니다');
                $('#firstName').focus();
            } else if ($('#lastName').val().length < 4) {
                alert('lastName는 3자이상 이어야 합니다');
                $('#lastName').focus();
            } else {
            	$('#addForm').submit();
            }
        	*/
        });
    });
</script>
</head>
<body>
<div class="container">
    <h1>ADD FILM ACTOR</h1>
     <table class="table">
         <tbody>
			<tr>
                   <td>filmId :</td>
                   <td>${filmOne.filmId}</td>
            </tr>
            <tr>
                   <td>title :</td>
                   <td>${filmOne.title}</td>
            </tr>
            <tr>
                   <td>description :</td>
                   <td>${filmOne.description}</td>
            </tr>
            <tr>
                   <td>releaseYear :</td>
                   <td>${filmOne.releaseYear}</td>
            </tr>
            <tr>
                   <td>language :</td>
                   <td>${filmOne.language}</td>
            </tr>
            <tr>
                   <td>originalLaguageId :</td>
                   <td>${filmOne.originalLaguageId}</td>
            </tr>
            <tr>
                   <td>rentalDuration :</td>
                   <td>${filmOne.rentalDuration}</td>
            </tr>
            <tr>
                   <td>rentalRate :</td>
                   <td>${filmOne.rentalRate}</td>
            </tr>
            <tr>
                   <td>length :</td>
                   <td>${filmOne.length}</td>
            </tr>
            <tr>
                   <td>replacementCost :</td>
                   <td>${filmOne.replacementCost}</td>
            </tr>
            <tr>
                   <td>rating :</td>
                   <td>${filmOne.rating}</td>
            </tr>
            <tr>
                   <td>specialFeatures :</td>
                   <td>${filmOne.specialFeatures}</td>
            </tr>
            <tr>
                   <td>actors :</td>    
                   <td>${filmOne.actors}</td>
            </tr>
			<tr>
                   <td>lastUpdate :</td>
                   <td>${filmOne.lastUpdate}</td>
            </tr>
          </tbody>
    </table>
    	<h4>ACTOR LIST</h4>
        <form id="addForm" action="${pageContext.request.contextPath}/admin/addFilmActor" method="post">
        	<input type = "hidden" name = "filmId" value = "${filmId}">
        	<table class="table">
        		<tr>
        			<c:set var="i" value="0" />
        			<c:set var="alphabet" value="A" />
        			<c:forEach var="a" items = "${actorList}">
        				<!-- 최초 한번만 실행됨. -->
        				<c:if test="${i == 0 }">
        					<td>${fn:substring(a.first_name,0,1)}</td>
        					</tr><tr>
        				</c:if>
        				<!-- 체크여부검사 -->
	                	<c:if test="${a.checked eq 'T'}">
	                		<c:set var="tempAlphabet" value="${fn:substring(a.first_name,0,1)}" />
	                		<!-- 알파벳검사 첫글자가 다르면 줄바꿈 해주고 첫글자 적어줌-->
	                		<c:if test="${alphabet != tempAlphabet}">
	                			</tr><tr>
					    		<c:set var="alphabet" value="${tempAlphabet}" />
					    		<c:set var="i" value="1" />
					    		<td>${alphabet}</td>
        						</tr><tr>
					    		<td>
	                				<input type="checkbox" value="${a.first_name} ${a.last_name}" checked="checked" disabled="disabled">${a.first_name} ${a.last_name}
	                			</td>
	                		</c:if>
	                		<!-- 알파벳검사 -->
				    		<c:if test="${alphabet == tempAlphabet}">
				    			<c:set var="i" value="${i+1}" />
					    		<td>
	                				<input type="checkbox" value="${a.first_name} ${a.last_name}" checked="checked" disabled="disabled">${a.first_name} ${a.last_name}
	                			</td>
				    		</c:if>                		
	                	</c:if>
	                	
	                	<!-- 체크여부검사 -->
	                	<c:if test="${!(a.checked eq 'T')}">
	                		<c:set var="tempAlphabet" value="${fn:substring(a.first_name,0,1)}" />
	                		<!-- 알파벳검사 -->
	                		<c:if test="${alphabet != tempAlphabet}">
					    		</tr><tr>
					    		<c:set var="alphabet" value="${tempAlphabet}" />
					    		<c:set var="i" value="1" />
					    		<td>${alphabet}</td>
        						</tr><tr>
					    		<td>
		                			<input type="checkbox" name="actor" value="${a.first_name} ${a.last_name}">${a.first_name} ${a.last_name}
		                		</td>
				    		</c:if>
				    		<!-- 알파벳검사 -->
				    		<c:if test="${alphabet == tempAlphabet}">
				    			<c:set var="i" value="${i+1}" />
					    		<td>
		                			<input type="checkbox" name="actor" value="${a.first_name} ${a.last_name}">${a.first_name} ${a.last_name}
		                		</td>
				    		</c:if>
	                	</c:if>
	                	<!-- 갯수검사 -->
	                	<c:if test="${i%5 == 0}">
				    		</tr><tr>
				    	</c:if>
                	</c:forEach>
        		</tr>
        	</table>
            <div>
                <input class="btn btn-default" id="addButton" type="button" value="배우추가" /> 
                <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getFilmList">글목록</a>
            </div>
        </form>
	
</div>
</body>
</html>



</head>
<body>
    
</body>
</html>