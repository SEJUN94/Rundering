<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			
<script type="text/x-handlebars-template" id="enrollemnt" >
<form action="enrollmentRegist" method="post">	
	<div class="row ml-3 mr-3" id="removeTag">
		<input type="hidden" name="name" value='{{applicateName}}'>
		<input type="hidden" name="phone" value="{{phone}}">
		<input type="hidden" name="email" value="{{email}}">
		<div class="col-8">
			<div class="card card-default">
				<div class="card-header">
					<h3 class="card-title">
						<b>지점 등록</b>
					</h3>
				</div>
	
					<div class="card-body row">
							<div class="col-md-12 row">
								<div class="form-group col-4">
									<label>지점이름</label>
									<input type="text" class="form-control"	id="branchName" name="branchName" value=""  />
								</div>
								
								<div class="form-group col-4">
									<label>지점 전화번호</label> 
									<input type="text" class="form-control"	id="branchContact" name="branchContact" value=""  />
								</div>
								<div class="form-group col-2">
									<label>상위지역 </label> 
									<input type="text" class="form-control"	id="toparea" name="toparea" value=""  />
								</div>
								<div class="form-group col-2">
									<label>하위지역 </label> 
									<input type="text" class="form-control"	id="area" name="area" value=""  />
								</div>
								
							</div>
							<div class="col-md-12 row">
								<div class="form-group col-4">
									<label>우편번호</label> 
									<span class="input-group-append">
										<input type="text" class="form-control col-7"	id="zip" name="zip" value=""  />
									
										<button class ="btn btn-sm btn-primary col-5">우편검색</button>
									</span>
								</div>
								<div class="form-group col-4">
									<label>주소</label> 
									<input type="text" class="form-control"	id="add1" name="add1" value=""  />
								</div>
								<div class="form-group col-4">
									<label>상세주소 </label> 
									<input type="text" class="form-control"	id="add2" name="add2" value=""  />
								</div>
							</div>
						</div>
		
			</div>
			<div class="card card-body">
				<div class="col-md-12 row">
					<div class="form-group col-4">
						<label>세탁가능수량</label> 
							<span class="input-group-append" >
								<input type="text" class="form-control quantity" style="text-align: end;"	id="branchLndrpcrymslmcoqy" name="branchLndrpcrymslmcoqy" value="0"  readonly="readonly" />
								<span class="btn-group-vertical" style="width: 18px;">
									<button type="button" class="btn btn-sm btn-default p-0" style="height: 20px;" onclick="laundryPlusQuantity(this)">+</button>
									<button type="button" class="btn btn-sm btn-default p-0" style="height: 20px;" onclick="laundryMinusQuantity(this)">-</button>
								</span>
							</span>
					</div>
					<div class="form-group col-2">
						<label>세탁기</label> 
						<span class="input-group-append">
								<input type="text" class="form-control quantity" style="text-align: end;"id="A001" name="A001" value="0"  readonly="readonly" />
								<span class="btn-group-vertical" style="width: 18px;">
									<button type="button" class="btn btn-sm btn-default p-0" style="height: 20px;" onclick="plusQuantity(this)">+</button>
									<button type="button" class="btn btn-sm btn-default p-0" style="height: 20px;" onclick="minusQuantity(this)">-</button>
								</span>
							</span>
					</div>
					<div class="form-group col-2">
						<label>건조기</label> 
						<span class="input-group-append">
								<input type="text" class="form-control quantity" style="text-align: end;"	id="A002" name="A002" value="0"  readonly="readonly" />
								<span class="btn-group-vertical" style="width: 18px;">
									<button type="button" class="btn btn-sm btn-default p-0" style="height: 20px;" onclick="plusQuantity(this)">+</button>
									<button type="button" class="btn btn-sm btn-default p-0" style="height: 20px;" onclick="minusQuantity(this)">-</button>
								</span>
							</span>
					</div>
					<div class="form-group col-2">
							<label>에어컨</label> 
							<span class="input-group-append">
								<input type="text" class="form-control quantity" style="text-align: end;"	id="A003" name="A003" value="0"  readonly="readonly" />
								<span class="btn-group-vertical" style="width: 18px;">
									<button type="button" class="btn btn-sm btn-default p-0" style="height: 20px;" onclick="plusQuantity(this)">+</button>
									<button type="button" class="btn btn-sm btn-default p-0" style="height: 20px;" onclick="minusQuantity(this)">-</button>
								</span>
							</span>
					</div>
						<div class="form-group col-2">
								<button type="submit" class="btn btn-md btn-primary" onclick="regist()" style="position: absolute; right: 0px; bottom: 0px;">등록</button>
						</div>
			
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
		</div>

	</div>
</form>
	</script>
	
	<script type="text/javascript">
		function branch_enrollment(){
			let source = $("#enrollemnt").html(); 
        	let template = Handlebars.compile(source);
        	let data ={
        		
        	}
        	let html = template(data);
        	if($('#removeTag')!=null){
        		$('#removeTag').remove();	
        	}
        	$('#handleTag').append(html);
			
        	
        	
        	summernote_go($('div[id="content"]'),'<%=request.getContextPath()%>');	
		}
		function plusQuantity(){
			let input =event.target.parentNode.parentNode.querySelectorAll('.quantity')[0]
			let intValue= parseInt(input.value)
			input.value=intValue+1;
			
		}
		function minusQuantity(){
			let input =event.target.parentNode.parentNode.querySelectorAll('.quantity')[0]
			let intValue= parseInt(input.value)
			let result=intValue-1;
			if(result<0){
				result=0;
			}
			input.value=result;
			
			
		}
		function laundryPlusQuantity(){
			let input =event.target.parentNode.parentNode.querySelectorAll('.quantity')[0]
			let intValue= parseInt(input.value)
			input.value=intValue+10;
		}
		function laundryMinusQuantity(){
			let input =event.target.parentNode.parentNode.querySelectorAll('.quantity')[0]
			let intValue= parseInt(input.value)
			let result=intValue-10;
			if(result<0){
				result=0;
			}
			input.value=result;
			
		}
	
	</script>
	