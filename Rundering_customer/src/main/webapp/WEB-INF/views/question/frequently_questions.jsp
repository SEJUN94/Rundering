<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELlgnored="false"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="frequentlyList" value="${dataMap.frequentlyList }" />
<%
	request.setCharacterEncoding("UTF-8");
%>

<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/board.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/faq.css">	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$('div.question).hide();
		$("div.fcontent").click(function(){
			$(this).next().slideToggle(1000);
		});
	</script>
	
	<style>
		.question:hover{
			cursor: pointer;
		}
		.fcontent{
			display: none;
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

	<section class="content">
		<div class="row">
			<div style="margin-top: 100;">
				<c:forEach items="${frequentlyList }" var="faq">
					<input type="radio" name="accordion" id="answer${faq. }"
				</c:forEach>
			</div>
			
			
		</div>

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