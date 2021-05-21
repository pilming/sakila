<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>StaffOne</title>
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
    <h1>상세보기</h1>
     <table class="table table-striped">
         <tbody>
             <tr>
                <td>ID :</td>
                <td>${staffMap.ID}</td>
               </tr>
            <tr>
                   <td>NAME :</td>
                   <td>${staffMap.name}</td>
            </tr>
            <tr>
                   <td>ADDRESS :</td>
                   <td>${staffMap.address}</td>
            </tr>
            <tr>
                   <td>ZIPCODE :</td>
                   <td>${staffMap.zipcode}</td>
            </tr>
            <tr>
                   <td>PHONE :</td>
                   <td>${staffMap.phone}</td>
            </tr>
            <tr>
                   <td>CITY :</td>
                   <td>${staffMap.city}</td>
            </tr>
            <tr>
                   <td>COUNTRY :</td>
                   <td>${staffMap.country}</td>
            </tr>
            <tr>
                   <td>SID :</td>
                   <td>${staffMap.SID}</td>
            </tr>
        </tbody>
    </table>
    <div>
		    <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getStaffList">목록보기</a>	
    </div>
</div>
</body>
</html>