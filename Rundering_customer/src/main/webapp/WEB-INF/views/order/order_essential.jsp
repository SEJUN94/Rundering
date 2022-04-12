<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/customer/src/main/webapp/resources/bootstrap/plugins/sweetalert2/sweetalert2.min.css" />  
</head>

<title>세탁 주문접수</title>

<body>

	<div style="width: 60%; display: flex; flex-direction: column; margin-left: 20%;">

		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>세탁주문</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item active">세탁주문</li>
							<li class="breadcrumb-item"><a href="#">Home</a></li>
						</ol>
					</div>
				</div>
			</div>
		</section>

		<div class="card" style="box-shadow: none;">
			<div class="card-header">
				<h3 class="" style="text-align: center; font-size: 1.3rem; font-weight: 400;">주소지 정보 확인</h3>
			</div>
			
			

			<form role="form" class="form-horizontal" action="<%=request.getContextPath() %>/order/detail" method="post">
				
				<p class="mt-3" style="text-align: center;">수거와 배달을 받을 주소지와 연락처를 입력해주세요.</p>
				
			<div class="card-body col-6" style="margin: auto; margin-top: 10px;">
			
					<div class="form-group">
						<label for="addr">주소지</label>
						<div class="input-group" style="padding-top: 10px;">
							<div class="input-group" style="padding-right: 0;">

								<div class="input-group mb-3">
									<input type="text" class="form-control" id="zip" name="zip" placeholder="우편번호" value="${member.zip}">
									<div class="input-group-append">
										<button type="button" id="modalBtn" class="btn btn-primary" onclick="findZip();">주소검색</button>
									</div>
								</div>
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="add1" name="add1" placeholder="기본주소" value="${member.add1}">
								</div>
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="add2" name="add2" placeholder="상세주소" value="${member.add2}">
								</div>
							</div>
						</div>
					</div>
			
				
				<label for="phone" style="display: block;">연락처</label>
				<p class="h4 mt-2 mb-3 showPhone" style="display: inline-block;">${member.phone}010-1111-1111</p>
				<button type="button" onclick="form_phone_show()" class="btn btn-outline-secondary btn-sm phoneChenge" style="margin-top: 0.5rem;margin-bottom: 1rem; margin-left: 115px;">변경</button>
				
				<input type="tel" class="form-control" id="contactNumber" name="contactNumber" value="${member.phone}010-1111-1111" style="display: none;">
				
					<div class="form-group newphone" style="display: none;">
						<div class="input-group">
							<div class="input-group" style="padding-right: 0;">
								<input type="tel" class="form-control" id="tel" placeholder="휴대폰번호 숫자만 입력하세요.">
								<div class="input-group-append">
									<button type="button" onclick="tel_verification()" class="btn btn-primary">인증</button>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group verificationCode" style="display: none;">
						<label for="addr">인증번호</label>
						<div class="input-group" style="padding-top: 10px;">
							<input type="text" class="form-control" id="Code" placeholder="인증번호">
							<button type="button" onclick="verificationCodeCheck()" style="margin-top: 10px;" class="btn btn-outline-primary btn-block">연락처 인증하기</button>
						</div>
					</div>
				<button type="submit" style="margin-top: 20px;" class="btn btn-primary btn-block">다음으로</button>
				</div>
				
				
			</form>
		</div>
	</div>

	<!-- 알림 sweetalert2 -->
	<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/sweetalert2/sweetalert2.all.min.js"></script>

	<!-- 주소api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>
	function findZip() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
				var addr = ''; // 주소 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zip').value = data.zonecode;
				document.getElementById("add1").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("add2").focus();
			}
		}).open();
	}
</script>

<script>

  function form_phone_show(){
	  
	  let form_phone = document.querySelector('.newphone');	
	  let input_phone = document.querySelector('.newphone input');	
	  let form_code = document.querySelector('.verificationCode');	
	  let input_code = document.querySelector('.verificationCode input');	
	  let show_btn = document.querySelector('.phoneChenge');
	  
	  if(form_phone.style.display == 'block'){
		  show_btn.innerText = '변경';
		  form_phone.style.display = 'none';
		  form_code.style.display = 'none';
		  input_phone.value = '';
		  input_code.value = '';
		  
	  }else{
		  form_phone.style.display = 'block';
		  show_btn.innerText = '변경 취소';
	  }
  }


  function tel_verification() {
	  
      let tel = document.getElementById('tel').value;
      
      let regPhone = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
      
      if (regPhone.test(tel) !== true) {
    	  
          const Toast = Swal.mixin({
		      toast: true,
		      position: 'center',
		      showConfirmButton: false,
		      timer: 1200,
		      timerProgressBar: false,
		      didOpen: (toast) => {
		        toast.addEventListener('mouseenter', Swal.stopTimer)
		        toast.addEventListener('mouseleave', Swal.resumeTimer)
		      }
		    })
		
		    Toast.fire({
		      icon: 'warning',
		      title: '휴대폰번호를 다시 확인해주세요.'
		    });
      }else{
    	  document.querySelector('.verificationCode').style.display = 'block';  
  		  //SMS API활용해야함
      }
  }
  
  function verificationCodeCheck() {
	  	//SMS API활용해야함
	  	
     	let tel = document.querySelector('.newphone input');
     	let contactNumber = document.querySelector('#contactNumber');
     	
     	contactNumber.value = tel.value;
     	
     	let showPhone = document.querySelector('.showPhone');
     	showPhone.innerText = phoneFomatter(tel.value);
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
