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
         if ($('#username').val().length < 3){
        	 alert('username는 3자이상 이어야 합니다');
        	 $('#username').focus();
         } else if ($('#commentContent').val().length < 10) {
             alert('commentContent는 10자이상 이어야 합니다');
             $('#commentContent').focus();
         } else {
             $('#commentForm').submit();
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
                            <h1>getBoardOne</h1>
                        </div>
                    </div>
                    <div class="container">
					     <table class="table table-hover">
					         <tbody>
					             <tr>
					                <td>board_id</td>
					                <td>${boardMap.boardId}</td>
					               </tr>
					            <tr>
					                   <td>board_title</td>
					                   <td>${boardMap.boardTitle}</td>
					            </tr>
					            <tr>
					                   <td>board_content</td>
					                   <td>${boardMap.boardContent}</td>
					            </tr>
					            <tr>
					                   <td>username</td>
					                   <td>${boardMap.username}</td>
					            </tr>
					            <tr>
					                   <td>insert_date</td>
					                   <td>${boardMap.insertDate}</td>
					            </tr>
					            <tr>
					                   <td>boardfile</td>
					                   <td>
					                   		<div>
					                   			<a href="${pageContext.request.contextPath}/admin/addBoardfile?boardId=${boardMap.boardId}"><button class="btn btn-secondary" type = "button">파일추가</button></a>
					                   		</div>
					                   		
					                   		<!-- 보드파일을 출력하는 반복문 코드 구현 -->
					                   		<c:forEach var="f" items="${boardfileList}">
												<div>
													<a href="/resource/${f.boardfileName}">
														${f.boardfileName}
													</a>
													<a href="${pageContext.request.contextPath}/admin/removeBoardfile?boardfileId=${f.boardfileId}&boardId=${f.boardId}&boardfileName=${f.boardfileName}"><button type="button" class="btn btn-secondary">파일삭제</button></a>
													
												</div>
											</c:forEach>
					                   		
					                   </td>
					            </tr>
					        </tbody>
					    </table>
					    	<div>
					    		<a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/modifyBoard?boardId=${boardMap.boardId}">수정</a>
							    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/removeBoard?boardId=${boardMap.boardId}">삭제</a>
							    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/getBoardList">글목록</a>	
					    	</div>
						<!-- 댓글 목록 -->
						<br>
						<div>
							<form action="${pageContext.request.contextPath}/admin/addComment" id= "commentForm" method = "post">
								<input type = "hidden" name = "boardId" value="${boardMap.boardId}">
								<div class="form-group">
								  <label for="usr">userName:</label>
								  <input type="text" id = "username"  name = "username" class="form-control" id="usr">
								</div>
								<div class="form-group">
									<label for="comment">Comment:</label>
									<textarea class="form-control" id="commentContent" name="commentContent" rows="3" cols="80"></textarea>
								</div>
								
								<div><button class="btn btn-secondary" id="btn" type="button">댓글추가</button></div>
							</form>
							<br>
							<table class="table">
								<c:forEach var="c" items="${commentList}">
									<tr>
										<td>${c.commentContent}</td>
										<td>${c.username}</td>
										<td>${c.insertDate}</td>
										<td><a href="${pageContext.request.contextPath}/admin/removeComment?commentId=${c.commentId}&boardId=${c.boardId}"><button type="button" class="btn btn-default">삭제</button></a></td>
									</tr>
								</c:forEach>
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