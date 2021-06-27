<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
    $(document).ready(function() {
        $('#addButton').click(function() {
        	
        	let ck = false;
        	
        	let boardfile = $('.boardfile'); //배열
			
        	for(let item of boardfile) {
				if($(item).val() == '') {
					ck = true;
					break;
				}
			}

        	if(ck) { //if(ck ==true)
        		alert('첨부되지 않은 파일이 있습니다.');
        	} else if ($('#boardPw').val().length < 4) {
                alert('boardPw는 4자이상 이어야 합니다');
                $('#boardPw').focus();
            } else if ($('#boardTitle').val() == '') {
                alert('boardTitle을 입력하세요');
                $('#boardTitle').focus();
            } else if ($('#boardContent').val() == '') {
                alert('boardContent을 입력하세요');
                $('#boardContent').focus();
            } else if ($('#staffId').val() == '') {
                alert('staffId을 입력하세요');
                $('#staffId').focus();
            } else {
                $('#addForm').submit();
            }
        });
      	//#inputFile에 <input type = "file"> 마지막에 추가
        $('#addFileBtn').click(function() {
        	console.log('addFileBtn clicked!');
        	$('#inputFile').append('<input type = "file" name = "boardfile" class = "boardfile">');
        });
        
        //#inputFile에 <input type = "file"> 마지막 태그를 삭제
		$('#delFileBtn').click(function() {
			console.log('delFileBtn clicked!');
			$('#inputFile').children().last().remove();
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
                            <h1>addBoard</h1>
                        </div>
                    </div>
                    <div class="container">
			        <form id="addForm" action="${pageContext.request.contextPath}/admin/addBoard" method="post" enctype="multipart/form-data">
			        	<div>
			        		<div>
			        			<button id = "addFileBtn" type = "button" class="btn btn-secondary">파일추가</button>
			        			<button id = "delFileBtn" type = "button" class="btn btn-secondary">파일삭제</button>
			        		</div>
			        		<div id = "inputFile">
			        		</div>
			        	</div>
			            <div class="form-group">
			                <label for="boardPw">boardPw :</label> 
			                <input class="form-control" name="board.boardPw" id="boardPw" type="password" />
			            </div>
			            <div class="form-group">
			                <label for="boardPw">boardTitle :</label> 
			                <input class="form-control" name="board.boardTitle" id="boardTitle" type="text" />
			            </div>
			            <div class="form-group">
			                <label for="boardContent">boardContent :</label>
			                <textarea class="form-control" name="board.boardContent" id="boardContent"
			                    rows="5" cols="50"></textarea>
			            </div>
			            <div class="form-group">
			                <label for="staffId">staffId :</label> 
			                <input class="form-control" name="board.staffId" id="staffId" type="text" />
			            </div>
			            <br>
			            <div>
			                <input class="btn btn-secondary" id="addButton" type="button" value="글입력" /> 
			                <input class="btn btn-secondary" type="reset" value="초기화" /> 
			                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/getBoardList">글목록</a>
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