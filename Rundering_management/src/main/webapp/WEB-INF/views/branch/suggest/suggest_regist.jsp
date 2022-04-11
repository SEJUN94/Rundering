<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<body>
	<div class="col-md-12">
		<div class="card card-primary card-outline">
			<div class="card-header">
				<h3 class="card-title"> <strong>건의사항 작성</strong></h3>
			</div>
			<form action="" method="post">
				<div class="card-body p-0">
					<div class="mailbox-read-info">
						<p style="font-size: 1.3em; margin-bottom: 0;">&nbsp;제목</p>
						<input type="text" name="title" class="form-control "
							style="border: none;">
					</div>
					<div class="mailbox-read-message">
						<textarea name="content" id="" cols="30" rows="10"
							class="form-control" style="border: none; resize: none;"></textarea>
					</div>
				</div>
			</form>
			<div class="card-footer bg-white">
				<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
					<li><span class="mailbox-attachment-icon"><i
							class="far fa-file-pdf"></i></span>
						<div class="mailbox-attachment-info">
							<a href="#" class="mailbox-attachment-name"><i
								class="fas fa-paperclip"></i> Sep2014-report.pdf</a> <span
								class="mailbox-attachment-size clearfix mt-1"> <span>1,245
									KB</span> <a href="#" class="btn btn-default btn-sm float-right"><i
									class="fas fa-cloud-download-alt"></i></a>
							</span>
						</div>
					</li>
				</ul>
			</div>
			<div class="card-footer">
				<div class="float-right">
					<button type="button" class="btn btn-primary">뒤로가기</button>
					<button type="button" class="btn btn-primary">저장</button>
				</div>
			</div>
		</div>
	</div>
</body>
