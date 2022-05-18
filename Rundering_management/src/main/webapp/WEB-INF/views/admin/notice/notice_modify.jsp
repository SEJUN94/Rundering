<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--이쁜 알럽트창 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">

<body>

	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>공지사항 수정하기</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">공지사항 수정하기</li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<div class="card card-primary card-outline">
		<div class="card-body">
			<form action="modify" method="post" role="modifyForm" enctype="multipart/form-data">
				<input type="hidden" name="noticeno" value="${notice.noticeno }" />
				<div class="form-group">
					<input class="form-control" placeholder="제목" name="title"
						value="${notice.title }">
				</div>
				<label for="content">내 용</label>
				<textarea class="textarea" name="content" id="content" rows="20"
					placeholder="1000자 내외로 작성하세요." style="display: none;">${notice.content }</textarea>
					
					<div class="form-group">								
								<div class="card mt-2">
									<div class="card-header">
										<h5 style="display:inline;line-height:40px;">첨부파일 : </h5>&nbsp;&nbsp;
										<button class="btn btn-xs btn-primary mb-" onclick="addFile_go();"	type="button" id="addFileBtn" style="background-color: #7b9acc; border: #7b9acc;">Add File</button>
									</div>						
									<div class="card-footer fileInput">
										<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
											
											 <c:forEach items="${attachList }" var="attach">
											<li class="attach-item thumb${attach.atchFileNo }${attach.atchFileSeq }" file-name="${attach.fileNm }" target-ano="${attach.atchFileNo },${attach.atchFileSeq }" style="border: none;"><div class="mailbox-attachment-info" style="margin: auto; border:1px solid lightgray;">
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
			</form>
		</div>

		<div class="card-footer">
			<div class="float-right">
				<button onclick="history.go(-1)" class="btn btn-warning">뒤로가기</button>
				<button type="submit" class="btn btn-primary"
					onclick="modifyPOST_go();">수정완료</button>
			</div>
		</div>
	</div>

	<!-- 알림 sweetalert2 -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/sweetalert2/sweetalert2.all.min.js"></script>


	<script>
	window.onload=function(){
	summernote_go($('textarea[name="content"]'), '<%=request.getContextPath()%>');
		}

	</script>
	
	 <script>
    	function removeFile_go(className){
    		var li = $('li.'+className);
    		Swal.fire({
                title: li.attr("file-name")+"을 정말 삭제하시겠습니까?",
                icon : 'warning' ,
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '승인',
                cancelButtonText: '취소',
                reverseButtons: true, // 버튼 순서 거꾸로
              }).then((result) => {
    		if(result.isConfirmed){
    			li.remove();
        		
        		var input=$('<input>').attr({"type":"hidden",
    				 "name":"deleteFile",
    				 "value":li.attr("target-ano")
    				}); 

    			$('form[role="modifyForm"]').prepend(input);
    		} 
    			return;
              })
    	}
    	
    	var dataNum=0;    	
    	function addFile_go(){
    		//alert("click add file btn");
    		
    		var attachedFile=$('a[name="attachedFile"]').length; //기존파일
    		var inputFile=$('input[name="uploadFile"]').length;	 //추가된 파일
    		var attachCount=attachedFile+inputFile; //기존파일 + 추가된파일 개수
    		
    		if(attachCount >=5){
    			Swal.fire({
					icon : 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
					title : '파일추가는 5개까지만 가능합니다.'
				});
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
				Swal.fire({
					icon : 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
					title : input.name+'은 필수입니다.'
				});
				$("input[name='title']").focus();
				return;
			}
			
			//파일 첨부확인
			var files = $('input[name="uploadFile"]');
			for(var file of files){
				//console.log(file.name+" : "+file.value);
				if(file.value==""){
					Swal.fire({
						icon : 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
						title : '파일을 선택하세요.'
					});
					file.focus();
					return false;
				}
			}	
			
			form.submit();
		}	
    		
    		
    </script>

</body>
