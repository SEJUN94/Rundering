<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="frequentlyList" value="${dataMap.frequentlyList }" />

<head>
<style>
.content-header{
	padding : 10px 25px;
	padding-bottom: 1px;
}
</style>
</head>
<body>

	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>자주 묻는 질문(FAQ)</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item active">FAQ</li>
						<li class="breadcrumb-item"><a href="#">Home</a></li>
					</ol>
				</div>
			</div>
		</div>
	</section>
	
	<div class="card-body">
		<div class="col-12" id="accordion">
			<c:forEach items="${frequentlyList }" var="faq">
					<div class="card card-default card-outline">
						<a class="d-block w-100 collapsed" data-toggle="collapse"
							href="#abc${faq.faqno }" aria-expanded="false">
							<div class="card-header">
								<div class="row">
									<div class="col-sm-8">
										<h4 class="card-title w-100" style="color: black;">${faq.question }
										</h4>
									</div>
								</div>
							</div>
						</a>
						<div id="abc${faq.faqno }" class="collapse"
							data-parent="#accordion" style="">
							<div class="card-body">
								${faq.answer } <br>
								<%-- <div class="row">
									<div class="col-sm-10"></div>
									<div class="col-sm-2">
										<button type="button" id="modifyBtn" class="btn btn-light"
											style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;"
											onclick="modify_go('${faq.faqno}');">수정</button>
										<button type="button" id="removeBtn" class="btn btn-danger"
											style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;"
											onclick="remove_go('${faq.faqno}');">삭제</button>
									</div>
								</div> --%>
							</div>
						</div>
					</div>
			</c:forEach>
		</div>
	</div>

	<section class="content-footer">
		<!-- 추가문의 -->
		<div class="row">
			<div class="col-12 mt-3 text-center">
				<p class="lead">
					<a href="<%=request.getContextPath()%>/question/list">Contact
						us, if you found not the right anwser or you have a other
						question?</a><br />
				</p>
			</div>
		</div>
	</section>

</body>