<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/x-handlebars-template" id="request" >
<div class="row ml-3 mr-3" id="removeTag">
		<div class="col-8">
			<div class="card card-default">
				<div class="card-header">
					<h3 class="card-title">
						<b>반려 내용</b>
					</h3>
				</div>
				<div class="card-body" id="content" style="height: 250px">
				
				</div>
			</div>
		</div>
		<div class="col-4">
			<div class="card card-body">
				<div class="col-md-12 ">
					<div class="form-group col-12">
						<div>
							<label>임대차계약서</label>
						</div> 
						<button class="btn btn-xs btn-secondary" onclick="addFile_go();" type="button"  style="background-color:#82BBD8;border: 1px solid #82BBD8">
						<i class="fas fa-file"></i>
						&nbsp; 임대차계약서 다운로드</button>
						<button class="btn btn-xs btn-secondary" onclick="addFile_go();" type="button"  style="background-color:#82BBD8;border: 1px solid #82BBD8">
						임대차계약서 보기</button>
					</div>
					
				</div>
			</div>
			<div style="position: absolute; right: 20px; bottom: 20px;">
				<button class="btn btn-md btn-primary">승인</button>
				<button class="btn btn-md btn-danger">반려</button>
			</div>
		</div>
	</div>
	</script>
	
	<script type="text/javascript">
		function branch_request(){
			let source = $("#request").html(); 
        	let template = Handlebars.compile(source);
        	let data ={
        	}
        	let html = template(data);
        	if($('#removeTag')!=null){
        		$('#removeTag').remove();	
        	}
        	$('#handleTag').append(html);
        	
        	 $('#content').summernote({
   		      height: 200,          // 기본 높이값

   		      minHeight: 250,      // 최소 높이값(null은 제한 없음)

   		      maxHeight: null,      // 최대 높이값(null은 제한 없음)

   		      focus: true,          // 페이지가 열릴때 포커스를 지정함

   		      lang: 'ko-KR',         // 한국어 지정(기본값은 en-US)
   		      toolbar: [
   		         
   		      ],
   		    

   		      placeholder: '최대 2048자'

   		    });
   	
        	summernote_go($('div[id="content"]'),'<%=request.getContextPath()%>');	
		}
	
	</script>
	