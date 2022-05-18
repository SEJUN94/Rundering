<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="faqorderno" value="${faq.orderno }" />
<c:set var="faqanswer" value="${faq.answer }" />

<head>
<!--이쁜 알럽트창 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">

</head>

<title>상세 보기</title>

<body>
	<!-- Main content -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6"></div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="list.do"> <i
								class="fa fa-dashboard"></i>문의사항
						</a></li>
						<li class="breadcrumb-item active">상세보기</li>
					</ol>
				</div>
			</div>
		</div>
	</section>
	
	<!-- Main content -->
	<section class="content container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-10" style="max-width: 960px;">
				<div class="card card-outline card-info">
					<div class="card-header">
						<h3 class="card-title p-1">상세보기</h3>
					</div>
					<!--end card-header  -->
					<div class="card-body pad col-12">
						<div class="form-group">
							<div class="row">
								<div class="col">
									<label for="question"> 제 목</label> <input type="text" id="question"
										readonly name='question' class="form-control"
										value="${faq.question }">
								</div>
								<div class="col">
									<c:choose>
										<c:when test="${not empty faqorderno }">
											<label for="orderno">주문번호</label>
											<input type="text" id="orderno"
												readonly name='orderno' class="form-control"
												value="${faq.orderno }" onclick="window.open('<%=request.getContextPath()%>/admin/laundryorder/detail.do?orderNo=${faq.orderno }', '주문 상세', 'width=800, height=900');"
									style="cursor: pointer;">								
										</c:when> 
										<c:when test="${empty faqorderno }">						
										</c:when>							
									</c:choose>
								</div>							
							</div>
						</div>
						<div class="form-group ">
							<div class="row">
								<div class="col">
									<label for="writer">요청자 <input type="text" id="writer"
										readonly name="writer" class="form-control"
										value="${faq.writer }"></label>
								</div>
								<div class="col">
									<label for="setbukdoorclcode">카테고리 <input type="text"
										id="setbukdoorclcode" readonly name="setbukdoorclcode"
										class="form-control"
										value="<c:choose>
												<c:when test="${faq.setbukdoorclcode == 'OR'}">주문문의</c:when>
												<c:when test="${faq.setbukdoorclcode == 'US'}">이용문의</c:when>
												<c:when test="${faq.setbukdoorclcode == 'ET'}">기타문의</c:when>
											   </c:choose>"></label>
								</div>
								<div class="col">
									<label for="registDate">등록일 <input type="text"
										id="registDate" readonly name="registDate"
										class="form-control" value="${faq.registDate }"></label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="fcontent">문의 내용</label>
							<div class="pt-2">${faq.fcontent }</div>
						</div>
						<div class="card-footer bg-white p-3">
							<ul class="mailbox-attachments align-items-stretch clearfix" style="display: inline-grid;">
							 <c:forEach items="${attachList }" var="attach">
								<li style="border: none;width: fit-content;"><div class="mailbox-attachment-info" style="margin: auto; border:1px solid lightgray;">
										<a href="<%=request.getContextPath()%>/file/filedownload?atchFileNo=${attach.atchFileNo}&saveFileNm=${attach.saveFileNm }" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i>&nbsp;&nbsp;${attach.fileNm }</a>
									</div>
								</li>
								</c:forEach>
							</ul>
						</div>
						<div class="form-group">
							<c:choose>
								<c:when test="${not empty faqanswer }">
									<label for="answer">문의 답변</label>
									<div class="pt-2">${faq.answer }</div>									
								</c:when> 
								<c:when test="${empty faqanswer }">						
								</c:when>							
							</c:choose>
						</div>
					</div>
					<!--end card-body  -->					
					<div class="card-footer">
						<div class="float-right">
							<button type="button" class="btn btn-warning" id="replyBtn" 
								onclick="reply_go('${faq.faqno}');">답변하기</button>
							&nbsp;&nbsp;
							<button type="button" class="btn btn-primary" id="cancelBtn"
								onclick="CloseWindow();">닫기</button>
						</div>
					</div>
					<!--end card-footer  -->
				</div>
				<!-- end card -->
			</div>
			<!-- end col-md-12 -->
		</div>
		<!-- end row -->
	</section>
	<!-- /.content -->
	
	<!-- 알림 sweetalert2 -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/sweetalert2/sweetalert2.all.min.js"></script>
	
	<script>
		function reply_go(faqno) {
			location.href = "replyForm?faqno=" + faqno;
		}
		<c:if test="${from eq 'reply' }">
		Swal.fire({
			icon : 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
			title : '등록되었습니다.'
		});
		</c:if>
	</script>
</body>