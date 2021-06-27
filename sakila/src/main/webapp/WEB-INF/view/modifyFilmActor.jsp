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
	<title>FILM VIEW(spring mvc ���)</title>
	<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('#modifyButton').click(function() {
        	$('#modifyForm').submit();
        	/*
			if ($('#firstName').val().length < 4) {
                alert('firstName�� 3���̻� �̾�� �մϴ�');
                $('#firstName').focus();
            } else if ($('#lastName').val().length < 4) {
                alert('lastName�� 3���̻� �̾�� �մϴ�');
                $('#lastName').focus();
            } else {
            	$('#addForm').submit();
            }
        	*/
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
                            <h1>modifyFilmActor</h1>
                        </div>
                    </div>
                    <div class="container">
					    <h1>modifyFilmActor</h1>
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
					        <form id="modifyForm" action="${pageContext.request.contextPath}/admin/modifyFilmActor" method="post">
					        	<input type = "hidden" name = "filmId" value = "${filmId}">
					        	<table>
					        		<tr>
					        			<c:set var="i" value="0" />
					        			<c:set var="alphabet" value="A" />
					        			<c:forEach var="a" items = "${actorList}">
					        				<!-- ���� �ѹ��� �����. -->
					        				<c:if test="${i == 0 }">
					        					<td><h4>${a.name.substring(0,1)}</h4></td>
					        					</tr><tr>
					        				</c:if>
					        				<!-- üũ���ΰ˻� -->
						                	<c:if test="${a.checked eq 'T'}">
						                		<c:set var="tempAlphabet" value="${a.name.substring(0,1)}" />
						                		<!-- ���ĺ��˻� �������� ���ĺ����� �����Ҷ�-->
									    		<c:if test="${alphabet == tempAlphabet}">
									    			<c:set var="i" value="${i+1}" />
										    		<td>
						                				<input type="checkbox"  name="actorId" value="${a.actorId}" checked="checked" >${a.name}
						                			</td>
									    		</c:if>     
						                		<!-- ���ĺ��˻� ù���ڰ� �ٸ��� �ٹٲ� ���ְ� ���ĺ� ����, i �ʱ�ȭ �� �ٲ� ���ĺ�������-->
						                		<c:if test="${alphabet != tempAlphabet}">
						                			</tr><tr>
										    		<c:set var="alphabet" value="${tempAlphabet}" />
										    		<c:set var="i" value="1" />
										    		<td><h4>${alphabet}</h4></td>
					        						</tr><tr>
										    		<td>
						                				<input type="checkbox" name="actorId" value="${a.actorId}" checked="checked">${a.name}
						                			</td>
						                		</c:if>
						                		           		
						                	</c:if>
						                	
						                	<!-- üũ���ΰ˻� -->
						                	<c:if test="${!(a.checked eq 'T')}">
						                		<c:set var="tempAlphabet" value="${a.name.substring(0,1)}" />
						                		<!-- ���ĺ��˻� �������� ���ĺ����� �����Ҷ�-->
									    		<c:if test="${alphabet == tempAlphabet}">
									    			<c:set var="i" value="${i+1}" />
										    		<td>
							                			<input type="checkbox" name="actorId" value="${a.actorId}">${a.name}
							                		</td>
									    		</c:if>
						                		<!-- ���ĺ��˻� ù���ڰ� �ٸ��� �ٹٲ� ���ְ� ���ĺ� ����, i �ʱ�ȭ �� �ٲ� ���ĺ�������-->
						                		<c:if test="${alphabet != tempAlphabet}">
										    		</tr><tr>
										    		<c:set var="alphabet" value="${tempAlphabet}" />
										    		<c:set var="i" value="1" />
										    		<td><h4>${alphabet}</h4></td>
					        						</tr><tr>
										    		<td>
							                			<input type="checkbox" name="actorId" value="${a.actorId}">${a.name}
							                		</td>
									    		</c:if>
									    		
						                	</c:if>
						                	<!-- �����˻� -->
						                	<c:if test="${i%6 == 0}">
									    		</tr><tr>
									    	</c:if>
					                	</c:forEach>
					        		</tr>
					        	</table>
					            <div>
					                <input class="btn btn-secondary" id="modifyButton" type="button" value="������" /> 
					                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/getFilmOne?filmId=${filmId}">�ڷΰ���</a>
					                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/getFilmList">�۸��</a>
					            </div>
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