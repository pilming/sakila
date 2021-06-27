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
	<title>BOARD VIEW(spring mvc 방식)</title>
	<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
   $(document).ready(function(){
      console.log("document ready!");
      $('#btn').click(function(){
         console.log("btn click!");
         if ($('#boardPw').val().length < 4) {
             alert('boardPw는 4자이상 이어야 합니다');
             $('#boardPw').focus();
         } else if ($('#boardTitle').val() == '') {
             alert('boardTitle을 입력하세요');
             $('#boardTitle').focus();
         } else if ($('#boardContent').val() == '') {
             alert('boardContent을 입력하세요');
             $('#boardContent').focus();
         } else {
        	 $('#modifyForm').submit();
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
                            <h1>modifyBoard</h1>
                        </div>
                    </div>
                    <div class="container">
					    <form action="${pageContext.request.contextPath}/admin/modifyBoard" id="modifyForm" method="post">
					    	
							<div class="form-group">
							    <label for="boardId">boardId :</label> 
							    <input class="form-control" name="boardId" id="boardId" type="text" readonly="readonly" value="${boardMap.boardId}" />
							</div>
							<div class="form-group">
							    <label for="boardTitle">boardTitle :</label> 
							    <input class="form-control" name="boardTitle" id="boardTitle" type="text" value="${boardMap.boardTitle}"/>
							</div>
							<div class="form-group">
							    <label for="boardPw">boardPw :</label> 
							    <input class="form-control" name="boardPw" id="boardPw" type="password" />
							</div>
							<div class="form-group">
							    <label for="boardContent">boardContent :</label>
							    <textarea class="form-control" name="boardContent" id="boardContent"
							        rows="5" cols="50">${boardMap.boardContent}</textarea>
							</div>
							<div class="form-group">
							    <label for="userName">userName :</label> 
							    <input class="form-control" type="text" value = "${boardMap.username}" readonly="readonly"/>
							</div>
							<div class="form-group">
							    <label for="insertDate">insertDate :</label> 
							    <input class="form-control" type="text" value = "${boardMap.insertDate}" readonly="readonly"/>
							</div>
									
					       <button class="btn btn-secondary" id="btn" type="button">수정</button>
					        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/getBoardOne?boardId=${boardMap.boardId}">돌아가기</a>
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