<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>프로젝트 목록</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
</head>
<div class="container">
    <h1>프로젝트 목록</h1>
    <table class="table">
		<thead>
			<tr>
				<th>프로젝트 명</th>
				<th>기간</th>
				<th>기술<th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<a href="/sakila">sakila(DVD대여점)</a>
				</td>
				<td>
					2개월
				</td>
				<td>
					Java Spring MVC, MariaDB, AWS
				</td>
			</tr>
			<tr>
				<td>
					<a href="http://www.jaehyeon.space/mall_admin/index.jsp">mall_admin(쇼핑몰 관리자 페이지)</a>
				</td>
				<td>
					1개월
				</td>
				<td>
					Java JSP, MariaDB, AWS
				</td>
			</tr>
			<tr>
				<td>
					<a href="https://lookupbl.run.goorm.io/">lookupBL(B/L조회 서비스)</a>
				</td>
				<td>
					2주
				</td>
				<td>
					Java JSP, MariaDB, Cloud IDE
				</td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>