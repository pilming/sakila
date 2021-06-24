<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<br>
<br>
<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
        <div class="nav">
            <a class="nav-link" href="${pageContext.request.contextPath}/">
                <div class="sb-nav-link-icon"><i class="fas fa-chart-area me-1"></i></div>
                HOME
            </a>
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/getStaffList">
                <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
                직원 목록
            </a>
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/getFilmList">
                <div class="sb-nav-link-icon"><i class="fas fa-film"></i></div>
                영화 목록
            </a>
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/getActorList">
                <div class="sb-nav-link-icon"><i class="fas fa-user-secret"></i></div>
                배우 목록
            </a>
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/getInventoryList">
                <div class="sb-nav-link-icon"><i class="fas fa-boxes"></i></div>
                영화별 재고 목록
            </a>
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/getCustomerList">
                <div class="sb-nav-link-icon"><i class="fas fa-hands-helping"></i></div>
                고객목록
            </a>
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/getBoardList">
                <div class="sb-nav-link-icon"><i class="far fa-calendar"></i></div>
                게시판
            </a>
            <a class="nav-link" href="${pageContext.request.contextPath}/admin/logout">
                <div class="sb-nav-link-icon"></div>
                로그아웃
            </a>
        </div>
    </div>
</nav>

