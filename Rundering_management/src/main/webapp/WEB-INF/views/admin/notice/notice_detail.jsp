<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
<!--이쁜 알럽트창 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>


	<div class="col-md-12" style="padding:30px;">
		<div class="card card-secondary card-outline">
			<div class="card-header">
				<h3 class="card-title">공지사항</h3>
			</div>
			<div class="card-body p-0">
				<div class="mailbox-read-info">
					<h5>${ notice.title}</h5>

				</div>
				<div class="mailbox-read-message">
					<p>${ notice.content}</p>


				</div>
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
			
			
			<div class="card-footer">
				<div class="float-right">
					<!--    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal-lg">댓글작성 </button> -->
					<button type="button" class="btn btn-warning" onclick="modify_go('${notice.noticeno}');">수정</button>
					<button type="button" class="btn btn-danger" onclick="remove_go('${notice.noticeno}');">삭제</button>
					<button type="button" class="btn btn-primary" onclick="CloseWindow();">닫기</button>
				</div>
			</div>
		</div>
	

	<!-- Reply content -->
	<section class="content container-fluid p-0">
		<!-- reply component start -->
		<div class="row">
			<div class="col-md-12">
				<div class="card card-info">
				<div class="card-body" style="padding-top: 10px; padding-bottom: 0px;" >
						
						<input	class="form-control" type="text" placeholder="댓글을 입력해주세요"
							id="replyContent" style="display: inline;width: 88%;"> 
						<button type="button" class="btn btn-sm btn-primary float-right" id="replyAddBtn"
							onclick="registReply();" style="margin: auto;">댓글 등록</button><br />
						
					</div>
					<div class="card-body" style="padding-top: 10px;">

						<div class="timeline" style="margin: 5px;">
						</div>
						<div id="replyListTag" style="padding-bottom: 10px;">
							<div id="replyHandler">
								
							</div>
						</div>
						<div id="cardfooter">
							
						</div>
						


					</div>
				</div>

			</div>
			<!-- end col-md-12 -->
		</div>
		<!-- end row -->
	</section>
	</div>



	<!-- modal -->
	<div class="modal fade" id="modal-modify" style="display: none;"
			aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">수정</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="request" id="replyForm">
							<input type="text" class="form-control" name="replyContent"	id="replyModifyContent" >
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="modifyBtn" data-replyno onclick="replyModify()">작성</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	<%@ include file="./noticeReply.jsp" %>

	<script>
		function modify_go(noticeno) {
			location.href = "modifyForm?noticeno=" + noticeno;
		}

		function remove_go(noticeno) {
			location.href = "remove?noticeno=" + noticeno;
		}

		
		<c:if test="${from eq 'modify' }">
			Swal.fire({
				icon: 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
				title: '수정되었습니다.'
			});

		</c:if>
	
		<c:if test="${from eq 'remove' }">
			Swal.fire({
				icon: 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
				title: '삭제되었습니다.'
			});
	
			window.opener.parent.location.reload(true);
			window.close();
	
		</c:if>
	</script>

</body>
