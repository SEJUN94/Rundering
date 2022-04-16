<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="loginUser" value="${loginUser}" />


<!--HEADER-->
<header>

	<nav class="inner">
		<c:if test="${empty loginUser }">
			<div class="sub-menu">
				<ul class="menu">
					<li><a href="<%=request.getContextPath()%>/login/form">Sign In</a></li>
					<li><a href="<%=request.getContextPath()%>/logout">logout</a></li>
					<li><a href="<%=request.getContextPath()%>/3agree">Sign Up</a></li>
				</ul>
				<div class="search">
					<input type="text" /> <span class="material-icons">search</span>
				</div>
			</div>
		</c:if>
		
		<c:if test="${!empty loginUser }">
			<div class="sub-menu">
				<ul class="menu">
					<li><h2 style="padding:8px 16px;font-weight:600;">${loginUser.getName() }님</h2></li>
					<li><a href="<%=request.getContextPath()%>/mypage">마이페이지</a></li>
					<li><a href="<%=request.getContextPath()%>/logout">logout</a></li>
				</ul>
				<div class="search">
					<input type="text" /> <span class="material-icons">search</span>
				</div>
			</div>
		</c:if>

		<a href="<%=request.getContextPath()%>/home" class="logo"> <img
			src="<%=request.getContextPath()%>/resources/images/Rundering.png"
			alt="Rundreing" />
		</a>


		<div id="menu">
			<ul>
				<li><a href="<%=request.getContextPath()%>/introduce">회사소개</a></li>
				<li><a href="#">이용 안내</a>
					<ul>
						<li><a href="<%=request.getContextPath()%>/guide/howuse">이용방법</a></li>
						<li><a href="<%=request.getContextPath()%>/guide/price/list">가격안내</a></li>
						<li><a href="<%=request.getContextPath()%>/guide/area">서비스 지역</a></li>
					</ul></li>
				<li><a href="<%=request.getContextPath()%>/order.do">세탁주문</a></li>
				<li><a href="#">고객 센터</a>
					<ul>
						<li><a href="<%=request.getContextPath()%>/customercenter/faq">자주묻는 질문</a></li>
						<li><a href="<%=request.getContextPath()%>/customercenter/question/board">문의사항</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
</header>