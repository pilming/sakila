<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
	<title>INVENTORY VIEW(spring mvc 방식)</title>
	<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('#addButton').click(function() {
			if ($('#storId').val() == '') {
                alert('storId를 선택해야됩니다.');
                $('#storId').focus();
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
                            <h1>addInventory</h1>
                        </div>
                    </div>
                    <div class="container">
				        <form id="addForm" action="${pageContext.request.contextPath}/admin/addInventory" method="post">
				        	<input type = "hidden" name ="filmId" value="${filmId}">
				            <div class="form-group">
				                <label for="title">title :</label> 
				                <input class="form-control" name="title" type="text" readonly="readonly" value="${title}"/>
				            </div>
							<div class="form-group">
				                <label for="storId">storId :</label> 
				                <select name ="storeId" id = "storId" class="form-control">
				                	<option value="">선택</option>
				                	<option value="1">store1</option>
				                	<option value="2">store2</option>
				                </select>
				            </div>
				            <br>
				            <div>
				                <input class="btn btn-secondary" id="addButton" type="button" value="재고추가" /> 
				                <button class="btn btn-secondary" type="button" onclick='history.back()'>뒤로가기</button>
				                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/getInventoryList">글목록</a>
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