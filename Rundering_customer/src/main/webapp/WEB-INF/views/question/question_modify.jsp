<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="orderList" value="${dataMap.orderList }" />

<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote.min.css">
<!--이쁜 알럽트창 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>
</head>

<title>문의 수정</title>

<body>
	<!-- Main content -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6">
					<h1></h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="list.do"> <i
								class="fa fa-dashboard"></i>문의 하기
						</a></li>
						<li class="breadcrumb-item active">수정</li>
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
						<h3 class="card-title p-1">수정하기</h3>
					</div>
					<!--end card-header  -->
					<div class="card-body pb-0">
						<form action="<%=request.getContextPath()%>/question/modify" method="post" role="modifyForm" name="modifyForm" enctype="multipart/form-data">
							<input type="hidden" name="faqno" value="${faq.faqno }" />
							<div class="form-group">
								<label for="question">제 목</label> <input type="text" id="question"
									name='question' class="form-control" value="${faq.question }">
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col">
										<label for="writer">요청자 <input type="text"
											id="writer" readonly name="writer"
											class="form-control" value="${faq.writer }"></label>
									</div>
									<div class=" col">
										<label for="setbukdoorclcode">카테고리
											구분</label> <select id="setbukdoorclcode" name="setbukdoorclcode"
											class="form-control">
											<option value="US">이용 문의</option>
											<option value="OR">주문 문의</option>
											<option value="ET">기타 문의</option>
										</select>
									</div>
									<div class="col">
										<label for="registDate">등록일 <input type="text"
											id="registDate" readonly name="registDate"
											class="form-control" value="${faq.registDate }"></label>
									</div>
									<div class="col">
										<label for="secretyn">공개여부</label>
										<div class="form-group">
											<div style="margin-left: 10px; margin-top: 10px; font-size: large;">
												<input type="radio" name="secretyn" id="secretyn" value="N" ${faq.secretyn eq 'N' ? 'checked':'' }/>
												공개 &nbsp;&nbsp;
												<input type="radio" name="secretyn" id="secretyn" value="Y" ${faq.secretyn eq 'Y' ? 'checked':'' }/>
												비공개
											</div>
										</div>
									</div>
								</div>								
								<label for="fcontent">내 용</label>
								<div class="form-group">
									<textarea style="border: none; height: 100px; resize: none;"
										class="textarea" rows="25" cols="50" id="fcontent" name="fcontent">${fn:escapeXml(faq.fcontent)}</textarea>
								</div>
								<div class="form-group">								
								<div class="card mt-2">
									<div class="card-header">
										<h5 style="display:inline;line-height:40px;">첨부파일 : </h5>&nbsp;&nbsp;
										<button class="btn btn-xs btn-primary mb-" onclick="addFile_go();"	type="button" id="addFileBtn" style="background-color: #7b9acc; border: #7b9acc;">Add File</button>
									</div>						
									<div class="card-footer fileInput">
										<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
											
											 <c:forEach items="${attachList }" var="attach">
											<li class="attach-item m-0 thumb${attach.atchFileNo }${attach.atchFileSeq }" file-name="${attach.fileNm }" target-ano="${attach.atchFileNo },${attach.atchFileSeq }" style="border: none;"><div class="mailbox-attachment-info" style="margin: auto; border:1px solid lightgray;">
													<a href="<%=request.getContextPath()%>/file/filedownload?atchFileNo=${attach.atchFileNo}&saveFileNm=${attach.saveFileNm }" name="attachedFile" attach-fileName="${attach.fileNm }" attach-no="${attach.atchFileNo }" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i>&nbsp;&nbsp;${attach.fileNm }</a>
													<button type="button" onclick="removeFile_go('thumb${attach.atchFileNo}${attach.atchFileSeq }'); return false;" style="border:0;outline:0;" class="badge bg-red">X</button>	
												</div>
											</li>
											</c:forEach>
										</ul>
										<br/>														
									</div>
								</div>
							</div>
							</div>
						</form>
					</div>
					<!--end card-body  -->
					<div class="card-footer">
						<div class="float-right">
							<button type="button" class="btn btn-primary" id="modifyBtn"
								onclick="modifyPOST_go();">수정</button>
							&nbsp;&nbsp;
							<button type="button" class="btn btn-warning" id="cancelBtn"
								onclick="history.go(-1);">취소</button>
						</div>
					</div>
					<!--end card-footer  -->
				</div>
				<!-- end card -->
			</div>
			<!-- end col-md-12 -->
		</div>
		</div>
		<!-- end row -->
	</section>
	<!-- /.content -->

	<script>
	window.onload=function(){
		summernote_go($('textarea[name="fcontent"]'), '<%=request.getContextPath()%>');
	}
	
	function modifyPOST_go(){
		 $("form[role='modifyForm']")
		 var form = document.modifyForm;
		 if (form.secretyn.value == "") {
			 Swal.fire({
					icon: 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
					title: '공개여부를 선택하세요.',
			 });	
				return;
			}
			form.submit();
	 }
	</script>
	
	 <script>
    	function removeFile_go(className){
    		var li = $('li.'+className);
    		if(!confirm(li.attr("file-name")+"을 정말 삭제하시겠습니까?")){
    			return;
    		}    			
    		li.remove();
    		
    		var input=$('<input>').attr({"type":"hidden",
				 "name":"deleteFile",
				 "value":li.attr("target-ano")
				}); 

			$('form[role="modifyForm"]').prepend(input);
    	}
    	
    	var dataNum=0;    	
    	function addFile_go(){
    		//alert("click add file btn");
    		
    		var attachedFile=$('a[name="attachedFile"]').length; //기존파일
    		var inputFile=$('input[name="uploadFile"]').length;	 //추가된 파일
    		var attachCount=attachedFile+inputFile; //기존파일 + 추가된파일 개수
    		
    		if(attachCount >=5){
    			alert("파일추가는 5개까지만 가능합니다.");
    			return;
    		}
    		
    		var div=$('<div>').addClass("inputRow").attr("data-no",dataNum);
    		var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
    		
    		div.append(input).append("<button onclick='remove_go("+dataNum+");' style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>");    		   		
    		$('.fileInput').append(div);
    		
    		dataNum++;
    		
    	}
    	
    	function remove_go(dataNum){
    		$('div[data-no="'+dataNum+'"]').remove();
    	}
    	
    	//submit =============================================
    	function modifyPOST_go(){
			//alert("modify btn click");			
			var form = $('form[role="modifyForm"]');
			
			//제목 유효성확인
			if($("input[name='title']").val()==""){
				alert(input.name+"은 필수입니다.");
				$("input[name='title']").focus();
				return;
			}
			
			//파일 첨부확인
			var files = $('input[name="uploadFile"]');
			for(var file of files){
				console.log(file.name+" : "+file.value);
				if(file.value==""){
					alert("파일을 선택하세요.");
					file.focus();
					return false;
				}
			}	
			
			form.submit();
		}	
    		
    		
    </script>

</body>
