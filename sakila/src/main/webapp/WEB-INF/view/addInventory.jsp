<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
    crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
    integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
    crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
    crossorigin="anonymous"></script>
 
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
<title>ADD INVENTORY</title>
</head>
<body>
    <div class="container">
        <h1>ADD INVENTORY</h1>
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
            <div>
                <input class="btn btn-default" id="addButton" type="button" value="재고추가" /> 
                <button class="btn btn-default" type="button" onclick='history.back()'>뒤로가기</button>
                <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getInventoryList">글목록</a>
            </div>
        </form>
    </div>
</body>
</html>