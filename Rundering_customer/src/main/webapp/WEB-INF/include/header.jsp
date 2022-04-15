<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!--HEADER-->
<header>
	<nav class="inner">

		<div class="sub-menu">
			<ul class="menu">
				<li><a href="<%=request.getContextPath()%>/login/form">로그인</a></li>
				<li><a href="<%=request.getContextPath()%>/logout">로그아웃</a></li>
				<li><a href="<%=request.getContextPath()%>/3agree">회원가입</a></li>
			</ul>
		</div>

		<a href="<%=request.getContextPath()%>/home" class="logo"> <img
			src="<%=request.getContextPath()%>/resources/images/Rundering.png"
			alt="Rundreing" />
		</a>


		<div id="menu">
			<ul>
				<li><a href="<%=request.getContextPath()%>/introduce">회사소개</a></li>
				<li><a href="#">이용안내</a>
					<ul>
						<li><a href="<%=request.getContextPath()%>/guide/howuse">이용방법</a></li>
						<li><a href="<%=request.getContextPath()%>/guide/price">가격안내</a></li>
						<li><a href="<%=request.getContextPath()%>/guide/area">서비스지역</a></li>
					</ul></li>
				<li><a href="<%=request.getContextPath()%>/order">세탁주문</a></li>
				<li><a href="#">고객센터</a>
					<ul>
						<li><a href="<%=request.getContextPath()%>/customercenter/faq">자주묻는질문</a></li>
						<li><a href="<%=request.getContextPath()%>/customercenter/question/board">문의사항</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
</header>