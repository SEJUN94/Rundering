<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<body class="sidebar-mini layout-boxed">

<nav class="main-header navbar navbar-expand navbar-white navbar-light" id="navbar">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
	</ul>


		<!-- Right navbar links -->
		<ul class="navbar-nav ml-auto">
			<li class="nav-item dropdown">
			<a class="nav-link" data-toggle="dropdown" href="#" aria-expanded="false"> 
				<i class="far fa-bell"></i> 
				<span class="badge badge-warning navbar-badge">15</span>
			</a>
				<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" style="left: inherit; right: 0px;">
					<span class="dropdown-item dropdown-header">읽지 않은 알림 개</span>
					<div class="dropdown-divider"></div>
					<a href="#" class="dropdown-item">
						<i class="fas fa-bullhorn mr-2"></i>
						 새 공지사항 <span class="float-right text-muted text-sm">3 mins</span>
					</a>
					<div class="dropdown-divider"></div>
					<a href="#" class="dropdown-item"> 
						<i class="fas fa-tools mr-2"></i>
						 새 AS요청 <span class="float-right text-muted text-sm">12 hours</span>
					</a>
					<div class="dropdown-divider"></div>
					<a href="#" class="dropdown-item"> 
						<i class="fas fa-comment-dots mr-2"></i>
						 새 건의사항 <span class="float-right text-muted text-sm">2 days</span>
					</a>
					<div class="dropdown-divider"></div>
					<a href="#" class="dropdown-item"> 
						<i class="fas fa-building mr-2"></i>
						 새 지점신청 <span class="float-right text-muted text-sm">2 days</span>
					</a>
					<div class="dropdown-divider"></div>
					<a href="#" class="dropdown-item"> 
						<i class="fas fa-tasks mr-2"></i>
						 세탁주문 지점할당 <span class="float-right text-muted text-sm">2 days</span>
					</a>
					<div class="dropdown-divider"></div>
					<a href="#" class="dropdown-item dropdown-footer">모두 읽음 처리</a>
				</div></li>

			<li class="nav-item"><a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">${loginMember.getName() }</a></li>
			<li class="nav-item"><button type="button" class="btn btn-block btn-sm btn-outline-secondary" id="logoutbtn"
									onclick="location.href='<%=request.getContextPath() %>/common/logout';" >LOGOUT</button></li>

		</ul>
	</nav>

</body>