<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<style>
.pp {
    padding: 12px;
    box-sizing: border-box;
    overflow-y: scroll;
    font-size: 1.0rem;
    background: #EBF3FC;
    margin-bottom: 16px;
} 

</style>
</head>
<body>
	
	<div style="width: 70%;margin: auto;">
		<section class="content-header"
			style="margin-bottom: 0px; padding-bottom: 0px">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>지점 신청</h1>
					</div>
				</div>
			</div>
			<hr>
		</section>
		<div class="card" >
			<div class="card-body" style="height: 500px; padding: 10px">
				<div class="pp">
					개인정보 수집 이용에 관한 사항(필수)<br>
					회사는 개설 상담을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br>
					1. 수집항목 : (필수) 이름, 연락처, 개설희망지역, 개설희망시기, 투자가능비용, 빨래방 이용경험, 건물소유/임대<br>
					2. 이용목적 : 개설 문의 상담, 기타 관련 문의사항 답변, 개설 관련 정보 제공 및 관련 안내 문자(SMS) 발송<br>
					3. 보유기간 : 3년간 보관<br>
					＊위의 개인정보 수집, 이용에 대한 동의를 거부할 권리가 있습니다. 그러나 동의를 거부하실 경우 상담이 불가합니다.
				</div>
						<div class="">
							<label>
								&nbsp;<input type="checkbox" name="" value="1"  id="">
									<span class="">&nbsp;개인정보 수집 및 이용에 동의합니다.</span>
							</label>
						</div>
					<div  class="row" >
						<div class=" col-6" style="padding-left:10%;">
							<div style="margin-top: 16px">
							<label for="email" class="col-mb-3"> <span
								style="color: red; font-weight: bold;">*</span>이름</label> 
							</div>
							<div class="input-group mb-3 form-group">
								<input type="text" class="col-lg-9 form-control" id="name" name="name" placeholder="이름" >
							</div>
							
							<div style="margin-top: 16px">
								<label for="phone" class="col-mb-5"> <span style="color: red; font-weight: bold;">*</span>연락처</label> <span class="sp"></span>
							</div>
							<div class="input-group mb-3 form-group">
								<input type="text" class="col-lg-9 form-control" id="phone" name="phone" pattern="010[0-9]{8}" placeholder="'-'없이  번호만 기재해주세요">
								<div class="input-group-append">
									<button type="button" onclick="phone_verification();" class="btn btn-secondary" style="background-color:#82BBD8;border: 1px solid #82BBD8">인증</button>
								</div>
							</div>
							
						
							
						</div>
						<div class="col-6" style="padding-right: 10%;">
						
							<div style="margin-top: 16px">
							<label for="email" class="col-mb-3"> <span
								style="color: red; font-weight: bold;">*</span>Email</label> 
							</div>
							<div class="input-group mb-3 form-group">
								<input type="email" class="col-lg-9 form-control" id="email" name="email" placeholder="Email" >
							
							</div>
							
						
							<div class="card-header" style="border-bottom: 0px; padding-left: 0px;padding-bottom: 5px;padding-top:3px; ">
								<span style="margin-top: 0px" >
								<label for="email" class="col-mb-3"> <span
									style="color: red; font-weight: bold;">*</span>임대차 계약서 첨부</label> 
								</span>
								<h5 style="display:inline;"></h5>
								<button class="btn btn-xs btn-secondary" onclick="addFile_go();" type="button" id="addFileBtn" style="background-color:#82BBD8;border: 1px solid #82BBD8"><i class="fas fa-file"></i>&nbsp; 양식 다운로드</button>
							</div>									
							<div class=" fileInput" style="">
								<div class="inputRow" data-no="0">
									<label for="inputFile" data-no="0" class="btn btn-secondary btn-sm input-group-addon" style="background-color:#82BBD8;border: 1px solid #82BBD8" onclick="justPressed(this)">파일선택</label>
									<input id="inputFileName" type="text" name="tempPicture" data-no="0" disabled="" style="width: 192px;" >
								</div>
							</div>
							<div class="overlay" style="display: none;">
							  <i class="fas fa-2x fa-spinner fa-spin"></i>
							</div>
						</div>
					</div>	
						<div style="text-align: center; margin-top: 25px">
							<button class="btn btn-md btn-secondary btn-block col-2"  style="margin: auto;background-color:#82BBD8;border: 1px solid #82BBD8">신청</button>
						</div>
			</div>
		</div>
	
	</div>		

	

</body>
</html>