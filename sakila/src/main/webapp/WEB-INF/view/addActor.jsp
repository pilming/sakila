<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
	<title>ACTOR VIEW(spring mvc 방식)</title>
	<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
    $(document).ready(function() {
        $('#addButton').click(function() {
			if ($('#firstName').val().length < 4) {
                alert('firstName는 3자이상 이어야 합니다');
                $('#firstName').focus();
            } else if ($('#lastName').val().length < 4) {
                alert('lastName는 3자이상 이어야 합니다');
                $('#lastName').focus();
            } else {
                $('#addForm').submit();
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
                            <h1>addActor</h1>
                        </div>
                    </div>
                    <div class="container">
				        <form id="addForm" action="${pageContext.request.contextPath}/admin/addActor" method="post">
				            <div class="form-group">
				                <label for="firstName">firstName :</label> 
				                <input class="form-control" name="firstName" id="firstName" type="text" />
				            </div>
							<div class="form-group">
				                <label for="lastName">lastName :</label> 
				                <input class="form-control" name="lastName" id="lastName" type="text" />
				            </div>
				            <br>
				            <div>
				                <input class="btn btn-secondary" id="addButton" type="button" value="배우추가" /> 
				                <input class="btn btn-secondary" type="reset" value="초기화" /> 
				                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/getActorList">글목록</a>
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