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
							<div class="form-group verificationCode" style="display: none;">
								<span style="color: red; font-weight: bold;">*</span>
								<label for="addr">인증번호</label>
								<div class="input-group" style="padding-top: 10px;">
									<input type="text" class="form-control col-4" id="Code" placeholder="인증번호">
									<button type="button" onclick="verificationCodeCheck()" style="margin-left: 10px;" class="btn btn-outline-primary btn-block col-2">인증하기</button>
									<div id="timeLimit" style="position: absolute;padding: 9px;margin-left: 140px;color: gray;font-size: 0.9rem; z-index: 10"></div>
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
<!-- 알림 sweetalert2 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/sweetalert2/sweetalert2.all.min.js"></script>
		
<script>
	const certify_ajax = function (phoneNumber){
		const v_ajax = new XMLHttpRequest();
	    v_ajax.open("POST","<%=request.getContextPath() %>/order/certifyPhoneNum",true);
	    v_ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
	    v_ajax.send('phoneNumber=' + encodeURIComponent(phoneNumber));
	    v_ajax.onreadystatechange = function(){
	    	 if (v_ajax.readyState === XMLHttpRequest.DONE) {
		     	if (v_ajax.status === 200) {
		        	const response = JSON.parse(v_ajax.responseText);
		            responseCode = Number(response.randomNum);
		            Toast.fire({
		     			icon: 'success',
		     		    title: '인증번호가 발송되었습니다.'
		     		});
		        } else {
	            }
		     }
	    }
	};
	
</script>
		
<script>
let isRunning = false;

const Toast = Swal.mixin({
   toast: true,
   position: 'center',
   showConfirmButton: false,
   timer: 1500,
   timerProgressBar: false,
   didOpen: (toast) => {
     toast.addEventListener('mouseenter', Swal.stopTimer);
     toast.addEventListener('mouseleave', Swal.resumeTimer);
   }
 });




  function phone_verification() {
	  
      let tel = document.getElementById('phone').value;
      
      let regPhone = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
      
      if (regPhone.test(tel) !== true) {
		
		    Toast.fire({
		      icon: 'warning',
		      title: '휴대폰번호를 다시 확인해주세요.'
		    });
      }else{
    	  document.querySelector('.verificationCode').style.display = 'block';  
    	  certify_ajax(tel);
    	  const timeLimit = document.getElementById("timeLimit");
    	  startTimer(180,timeLimit);
      }
  }
 
  function startTimer(count, display) {
      
	  let minutes, seconds;
      let timer = setInterval(function () {
      minutes = parseInt(count / 60, 10);
      seconds = parseInt(count % 60, 10);

      minutes = minutes < 10 ? "0" + minutes : minutes;
      seconds = seconds < 10 ? "0" + seconds : seconds;
      display.innerHTML = minutes + ":" + seconds;
	  
      // 타이머 끝
      if (--count < 0) {
	     clearInterval(timer);
	     Toast.fire({
		      icon: 'warning',
		      title: '인증시간이 초과되었습니다.\n재인증 해주세요.'
		    });
	     isRunning = false;
      }
  }, 1000);
       isRunning = true;
}
  
  function verificationCodeCheck() {
	  let codeInput = document.querySelector('#Code');
	  
	  if(isRunning && responseCode !== 0){
	  		if(codeInput.value == responseCode){
		     	let phone = document.querySelector('#phone');
		     	
		     	phone.setAttribute('value',phone.value);
		     	console.log('phone.value',phone.value);
		     	phonchk = true;
	  			Toast.fire({
	     		      icon: 'success',
	     		      title: '인증되었습니다.'
	     		});
	  			
	  			form_phone_show();
	  		}else{
	  			Toast.fire({
	  		      icon: 'warning',
	  		      title: '인증번호가 틀렸습니다.'
	  		    });
	  		}
	  	}
  }
  
  
  
  function phoneFomatter(num,type){
	    let formatNum = '';

	    if(num.length==11){
	        if(type==0){
	            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-****-$3');
	        }else{
	            formatNum = num.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
	        }
	    }else if(num.length==8){
	        formatNum = num.replace(/(\d{4})(\d{4})/, '$1-$2');
	    }else{
	        if(num.indexOf('02')==0){
	            if(type==0){
	                formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-****-$3');
	            }else{
	                formatNum = num.replace(/(\d{2})(\d{4})(\d{4})/, '$1-$2-$3');
	            }
	        }else{
	            if(type==0){
	                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-***-$3');
	            }else{
	                formatNum = num.replace(/(\d{3})(\d{3})(\d{4})/, '$1-$2-$3');
	            }
	        }
	    }
	    return formatNum;
	}

</script>
	

</body>
</html>