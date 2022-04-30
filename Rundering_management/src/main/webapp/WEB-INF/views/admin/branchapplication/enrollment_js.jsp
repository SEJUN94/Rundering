<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			
	<script type="text/x-handlebars-template" id="enrollemnt" >
	<div class="row ml-3 mr-3" id="removeTag">
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
									<input type="text" class="form-control"	id="adress" name="adress" value=""  />
								</div>
								
								<div class="form-group col-4">
									<label>지점 전화번호</label> 
									<input type="text" class="form-control"	id="adress" name="adress" value=""  />
								</div>
								<div class="form-group col-2">
									<label>상위지역 </label> 
									<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value=""  />
								</div>
								<div class="form-group col-2">
									<label>하위지역 </label> 
									<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value=""  />
								</div>
								
							</div>
							<div class="col-md-12 row">
								<div class="form-group col-4">
									<label>우편번호</label> 
									<span class="input-group-append">
										<input type="text" class="form-control col-7"	id="phone" name="phone" value=""  />
									
										<button class ="btn btn-sm btn-primary col-5">우편검색</button>
									</span>
								</div>
								<div class="form-group col-4">
									<label>주소</label> 
									<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value=""  />
								</div>
								<div class="form-group col-4">
									<label>상세주소 </label> 
									<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value=""  />
								</div>
							</div>
						</div>
				</form>
			</div>
			<div class="card card-body">
				<div class="col-md-12 row">
					<div class="form-group col-4">
						<label>세탁가능수량</label> 
							<span class="input-group-append">
								<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value="0"  readonly="readonly" />
								<span class="btn-group-vertical" style="width: 18px;">
									<button type="button" class="btn btn-sm btn-default p-0" style="height: 20px;" onclick="plusQuantity(this)">+</button>
									<button type="button" class="btn btn-sm btn-default p-0" style="height: 20px;" onclick="minusQuantity(this)">-</button>
								</span>
							</span>
					</div>
					<div class="form-group col-2">
						<label>세탁기</label> 
						<span class="input-group-append">
								<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value="0"  readonly="readonly" />
								<span class="btn-group-vertical" style="width: 18px;">
									<button type="button" class="btn btn-sm btn-default p-0" style="height: 20px;" onclick="plusQuantity(this)">+</button>
									<button type="button" class="btn btn-sm btn-default p-0" style="height: 20px;" onclick="minusQuantity(this)">-</button>
								</span>
							</span>
					</div>
					<div class="form-group col-2">
						<label>건조기</label> 
						<span class="input-group-append">
								<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value="0"  readonly="readonly" />
								<span class="btn-group-vertical" style="width: 18px;">
									<button type="button" class="btn btn-sm btn-default p-0" style="height: 20px;" onclick="plusQuantity(this)">+</button>
									<button type="button" class="btn btn-sm btn-default p-0" style="height: 20px;" onclick="minusQuantity(this)">-</button>
								</span>
							</span>
					</div>
					<div class="form-group col-2">
							<label>에어컨</label> 
							<span class="input-group-append">
								<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value="0"  readonly="readonly" />
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
							<label>심사계약서</label>
						</div> 
						<button class="btn btn-xs btn-secondary" onclick="addFile_go();" type="button"  style="background-color:#82BBD8;border: 1px solid #82BBD8">
						<i class="fas fa-file"></i>
						&nbsp; 심사계약서 다운로드</button>
						<button class="btn btn-xs btn-secondary" onclick="addFile_go();" type="button"  style="background-color:#82BBD8;border: 1px solid #82BBD8">
						심사계약서 보기</button>
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
			
		}
	
	</script>
	