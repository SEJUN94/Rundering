<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--HEADER-->
<header>

	<nav class="inner">

		<div class="sub-menu">
			<ul class="menu">
				<li><a href="<%=request.getContextPath()%>/login.do">Sign In</a></li>
				<li><a href="<%=request.getContextPath()%>/3agree.do">Sign Up</a></li>
			</ul>
			<div class="search">
				<input type="text" /> <span class="material-icons">search</span>
			</div>
		</div>

		<a href="<%=request.getContextPath()%>/home.do" class="logo"> <img
			src="<%=request.getContextPath()%>/resources/images/Rundering.png"
			alt="Rundreing" />
		</a>


		<div id="menu">
			<ul>
				<li><a href="<%=request.getContextPath()%>/introduce.do">회사소개</a></li>
				<li><a href="#">이용 안내</a>
					<ul>
						<li><a href="<%=request.getContextPath()%>/guide/howuse.do">이용방법</a></li>
						<li><a href="<%=request.getContextPath()%>/guide/price.do">가격안내</a></li>
						<li><a href="<%=request.getContextPath()%>/guide/area.do">서비스 지역</a></li>
					</ul></li>
				<li><a href="<%=request.getContextPath()%>/order.do">세탁주문</a></li>
				<li><a href="#">고객 센터</a>
					<ul>
						<li><a href="<%=request.getContextPath()%>/customercenter/faq.do">자주묻는 질문</a></li>
						<li><a href="<%=request.getContextPath()%>/customercenter/question/board.do">문의사항</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
</header>