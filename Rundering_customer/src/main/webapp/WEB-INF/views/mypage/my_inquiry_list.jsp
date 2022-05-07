<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="faqList" value="${dataMap.faqList }" />

<head>
<style>
.outer {
	display: flex;
	justify-content: center;
}

th, td {
	text-align: center;
}

.no {
	width: 10%;
}

.category {
	width: 15%
}

.title {
	width: 22%;
}

.writer {
	width: 18%;
}

.date {
	width: 25%;
}

.yn {
	width: 10%;
}

#peter {
	width: 200px;
	height: 450px;
	list-style-type:none;
	margin:0;
	padding:0;
	border:solid 1px #f3f3f3;
	background-color:#f3f3f3;
}
aside ul li a{
	color:#000000;
	font-size:1.1em;
}
li h1{
}
	
</style>
</head>

<body>

<div class="row">
	<aside style="padding-top:100px;">
			<ul id="peter" style="">
				<li style="margin-top:15px; padding-bottom:15px;border-bottom:solid 1px lightgray;">
					<h1 style="font-size:1.5em;text-align:center;">마이페이지</h1>
				</li>
				<li onclick="location.href='<%=request.getContextPath()%>/mypage'"
					style="cursor: pointer; margin-top:30px; margin-bottom:15px; margin-left:30px;"><a>회원 정보 수정</a></li>
				<li onclick="location.href='<%=request.getContextPath()%>/mypage/myaddress'"
					style="cursor: pointer; margin-top:15px; margin-bottom:15px; margin-left:30px;"><a>주소 관리</a></li>
				<li style="margin-top:15px; margin-bottom:15px; margin-left:30px;"><a>주문 내역</a>
					<ul>
						<li style="margin-top:10px; margin-bottom:5px;padding-left:20px;"><a>진행중인 세탁물</a></li>
						<li style="margin-top:10px; margin-bottom:5px;padding-left:20px;"><a>배송 완료된 세탁</a></li>
						<li style="margin-top:10px; margin-bottom:5px;padding-left:20px;"><a>결제 내역</a></li>
						<li style="margin-top:10px; margin-bottom:5px;padding-left:20px;"><a>취소 내역</a></li>
					</ul>
				</li>
				<li onclick="location.href='<%=request.getContextPath()%>/mypage/myinquiry/list'"
					style="cursor: pointer; margin-top:10px; margin-bottom:15px; margin-left:30px;"><a>문의 내역</a></li>
				<li onclick="location.href='<%=request.getContextPath()%>/mypage/secedeform'"
					style="cursor: pointer; margin-top:10px; margin-bottom:15px; margin-left:30px;"><a>회원 탈퇴</a></li>
			</ul>
	</aside>

	<div style="width: 60%; display: flex; flex-direction: column; margin-left: 50px; margin-top:30px;">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>문의내역</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item active">문의내역</li>
							<li class="breadcrumb-item"><a href="#">마이페이지</a></li>
						</ol>
					</div>
				</div>
			</div>
		<hr style="border: 1px solid rgb(170, 167, 167);">
		</section>


	<div class="col-12">
		<div class="card">

			<div class="card-body table-responsive p-0">
				<table class="table table-hover text-nowrap">
					<thead>
						<tr>
							<th class="no">번호</th>
							<th class="category">카테고리</th>
							<th class="title">제목</th>
							<th class="date">문의일</th>
						</tr>
					</thead>
					<c:if test="${empty faqList }">
						<tr>
							<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
						</tr>
					</c:if>
					<c:forEach items="${faqList }" var="faq">
						<tr	onclick="OpenWindow('detail?from=list&faqno=${faq.faqno }','상세보기',900,700);">
							<td class="no">${faq.faqno }</td>
							<td class="category">${faq.setbukdoorclcode }</td>
							<td class="title">${faq.question }</td>
							<td class="date"><fmt:formatDate value="${faq.registDate }" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

		<div class="card-footer" style="font-size: 0.9em">
			<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
		</div>
	</div>
</div>
</div>
</body>