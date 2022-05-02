<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/x-handlebars-template" id="voluntary" >
<div class="row ml-3 mr-3" id="removeTag">
		
		<div class="col-8">
			<div class="card card-default">
				<div class="card-header">
					<h3 class="card-title">
						<b>심사 내용</b>
					</h3>
				</div>
				<div class="card-body"  style="height: 250px">
				
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
					<div class="form-group col-12">
						<div>
							<label>심사신청서</label>
						</div> 
						<button class="btn btn-xs btn-secondary" onclick="addFile_go();" type="button"  style="background-color:#82BBD8;border: 1px solid #82BBD8">
						<i class="fas fa-file"></i>
						&nbsp; 심사신청서 다운로드</button>
						<button class="btn btn-xs btn-secondary" onclick="addFile_go();" type="button"  style="background-color:#82BBD8;border: 1px solid #82BBD8">
						심사신청서 보기</button>
					</div>
					<div class="form-group col-12">
						<div>
							<label>수의계약서</label>
						</div> 
						<button class="btn btn-xs btn-secondary" onclick="addFile_go();" type="button"  style="background-color:#82BBD8;border: 1px solid #82BBD8">
						<i class="fas fa-file"></i>
						&nbsp; 수의계약서 다운로드</button>
						<button class="btn btn-xs btn-secondary" onclick="addFile_go();" type="button"  style="background-color:#82BBD8;border: 1px solid #82BBD8">
						수의계약서 보기</button>
					</div>
					
					
				</div>
			</div>
			<div style="position: absolute; right: 20px; bottom:8px">
				<button class="btn btn-md btn-primary">확인</button>
			</div>
		</div>
	</div>
</script>

<script type="text/javascript">
		function branch_voluntary(){
			let source = $("#voluntary").html(); 
        	let template = Handlebars.compile(source);
        	let data ={
        	}
        	let html = template(data);
        	if($('#removeTag')!=null){
        		$('#removeTag').remove();	
        	}
        	$('#handleTag').append(html);
        	
        	
		}
	
	</script>