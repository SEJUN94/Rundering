<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>


<style>
/* p{
        text-align: center;
        margin-top: 5px;
        margin-right: 5px;
    } */
.register-box {
	margin: auto;
}

.form-control2 {
	margin-top: 5px;
	height: 30px;
}
</style>

<!-- 주소api -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<section class="content-header" style="margin-bottom: 0px;">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>회원가입</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item active">회원가입</li>
					<li class="breadcrumb-item"><a href="#">Home</a></li>

				</ol>
			</div>
		</div>
	</div>
	<hr />
</section>

<div class="col-6" style="margin:auto;">
	<div class="card-body">
		<p class="login-box-msg">join a new membership</p>
		<form class="form-horizontal" onsubmit="return valid();" method="post">
			<div>
				<label for="id" class="col-mb-3"> <span	style="color: red; font-weight: bold;">*</span>아이디</label>
			</div>
			<div class="input-group mb-3 form-group">
				<input type="text" class="col-lg-4 form-control" placeholder="아이디 입력" name="id" id="id">
				<span class="sp"></span> 
				<br/><span id="rst"></span>
			</div>
			<div style="margin-bottom:15px;">
				
			</div>
			<div>
				<label for="pw1" class="col-mb-3"> <span style="color: red; font-weight: bold;">*</span>비밀번호</label>
			</div>
			<div class="input-group mb-3 form-group">
				<input type="password" id="pw1" class="col-lg-4 form-control pass" placeholder="패스워드 입력" name="password"> 
				<span class="sp"></span>
			</div>
			<div class="input-group mb-3 form-group">
				<input type="password" id="pw2" class="col-lg-4 form-control pass" placeholder="패스워드 재입력"> 
				<span class="sp"></span>
			</div>
			<div>
				<label for="name" class="col-mb-3"> <span style="color: red; font-weight: bold;">*</span>이름</label>
			</div>
			<div class="input-group mb-3 form-group">
				<input type="text" class="col-lg-4 form-control" placeholder="예) 홍 길 동" name="name" id="name">
				<span class="sp"></span>
			</div>
			<div>
				<label for="email" class="col-mb-3"> <span
					style="color: red; font-weight: bold;">*</span>Email</label> 
			</div>
			<div class="input-group mb-3 form-group">
				<input type="email" class="col-lg-6 form-control" id="email"	placeholder="Email" name="email">
				<span class="sp"></span>
			</div>
			<div>
				<label for="phone" class="col-mb-3"> <span
					style="color: red; font-weight: bold;">*</span>연락처
				</label> <span class="sp"></span>
			</div>
			<div class="input-group mb-3 form-group">
				<input type="text" class="col-lg-6 form-control" id="phone" name="phone"
					pattern="010[0-9]{8}" placeholder="'-'없이  번호만 기재해주세요">
			</div>
			<div>
				<label for="zip" class="col-mb-3"> <span
					style="color: red; font-weight: bold;">*</span>주소</label>
			</div>
			<div class="input-group mb-3 form-group">
				<input type="text" class="col-lg-6 form-control" id="zip" 	placeholder="우편번호 버튼 Click">
				<div class="input-group-append">
					<button type="button" id="modalBtn" class="btn btn-info btn-sm"	onclick="findZip();">우편검색</button>
				</div>
			</div>
			<div class="input-group mb-3 form-group">
				<input type="text" class="form-control" id="add1" placeholder="기본주소">
			</div>
			<div class="input-group mb-3 form-group">
				<input type="text" class="form-control" id="add2" placeholder="상세주소">
			</div>
			<div class="row">
				<div class="col-8">
					<div class="icheck-primary">
						<input type="checkbox" id="agreeTerms" name="terms" value="agree">
						<label for="agreeTerms"> I agree to the <a href="#">terms</a>
						</label>
					</div>
				</div>

				<div class="col-4">
					<button type="submit" id="sendBtn"
						class="btn btn-primary btn-block">Join</button>
				</div>

			</div>
		</form>
	</div>
</div>

<script>

let idchk = false;
let pwchk = false;
let namechk = false;
let passchk = false;
let hpchk = false;
let mailchk = false;

function valid(){
	
	event.preventDefault();	//submit 이벤트를 막아 페이지 리로드를 방지
	
	if(idchk && pwchk && namechk && passchk && hpchk && mailchk){
		let formData = $('form').serialize();
		
		
		$.ajax({
			url : '<%=request.getContextPath()%>/join',
			type : 'post',
			data : formData,
			success : function(aa){
				if(aa.cd == "ok"){
					alert("Rundering 회원가입을 축하드립니다!");
					location.href = "<%=request.getContextPath()%>/login";
					} else {
						alert("공백없이 형식에 맞게 작성해주세요!");
					}
				},
				error : function(xhr) {
					alert(xhr.status);
				},
				dataType : 'json'
			});
		}

	}


var checkedID ="";
function idCheck_go(){
	//alert("id check btn click");
	
	var input_ID=$('input[name="id"]');
	
	if(!input_ID.val()){
       alert("아이디를 입력하시오");
       input_ID.focus();
       return;
	}
	
	 $.ajax({
		 url : "<%=request.getContextPath()%>/idCheck",
		 data : {
				'id' : $('#id').val()
			},
		type : 'post',	
    	 success : function(result){
   		   if(result.toUpperCase() == "DUPLICATED"){
              alert("중복된 아이디 입니다.");
              $('input[name="id"]').focus();
           }else{
              alert("사용가능한 아이디 입니다.");
              checkedID=input_ID.val().trim();
              $('input[name="id"]').val(input_ID.val().trim());
             
           } 
    	 },
         error:function(error){
           //alert("시스템장애로 가입이 불가합니다.");
        	 AjaxErrorSecurityRedirectHandler(error.status);		
         }			 
	 });
}


	//id 중복체크 ajax
	function idCheckAjax() {
		let sp = document.querySelectorAll('.sp');
		let rst = document.querySelector('#rst');

		$.ajax({
			url : '<%=request.getContextPath()%>/idCheck',
			data : {
				'id' : $('#id').val()
			},
			type : 'post',
			success : function(result) {
				if (result.toUpperCase() == "DUPLICATED") {
					$('#rst').html("이미 존재하는 ID입니다").css('color', 'red');
					sp[0].style.display = 'none';
					rst.style.display = "inline-block";
				} else {
					$('#rst').html("사용 가능한 ID입니다").css('color', 'green');
					sp[0].style.display = 'none';
					rst.style.display = "inline-block";
				}
			},
			error : function(error) {
				//alert("시스템장애로 가입이 불가합니다.");
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}

window.onload = function() {
	//	아이디 중복검사 
	//keyup 이벤트 : 키를 눌렀다가 떼는 순간
	$('#id').on('keyup', function() {
		
		//유효성검증(validation check) - id
		let idValue = $('#id').val().trim();
		let regId = /^[a-zA-Z][a-zA-Z0-9]{3,7}$/;
		let sp = document.querySelectorAll('.sp');
		let rst = document.querySelector('#rst');

		//패턴체크
		if (regId.test(idValue)) {
			idCheckAjax();
			idchk = true;
		} else if (idValue === "") {
			sp[0].style.display = "inline-block"
			rst.style.display = "none";
			noProc($('#id'), "아이디를 입력하세요");
			idchk = false;
		} else {
			sp[0].style.display = "inline-block"
			rst.style.display = "none";
			noProc($('#id'), "영문,숫자,4~8자리 입력 가능");
			idchk = false;
		}
	});

	//유효성검증 - pass
	$('#pw1').on('keyup',function() {
						let passValue = $('#pw1').val().trim();
						let regPass = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+|]).{8,}$/;

						if (regPass.test(passValue)) {
							okProc($('#pw1'), "사용 가능한 패스워드 입니다!");
							pwchk = true;
						} else if (passValue === "") {
							noProc($('#pw1'), "패스워드를 입력하세요");
							pwchk = false;
						} else {
							noProc($('#pw1'), "대/소문자,특수문자,숫자 포함 8자리 이상 입력해야함");
							pwchk = false;
						}
					});

	//비밀번호 일치 여부 확인
	$('.pass').on('keyup', function() {
		let pass1 = $("#pw1").val().trim();
		let pass2 = $("#pw2").val().trim();

		if (pass1 != "" || pass2 != "") {
			if (pass1 == pass2) {
				okProc($('#pw2'), "일치");
				passchk = true;
			} else {
				noProc($('#pw2'), "불일치");
				passchk = false;
			}
		}
	});

	//유효성검증 - name
	$('#name').on('keyup', function() {
		let nameValue = $('#name').val().trim();
		let regName = /^[가-힣]{2,5}$/;

		if (regName.test(nameValue)) {
			okProc($('#name'), "");
			namechk = true;
		} else if (nameValue === "") {
			noProc($('#name'), "이름을 입력하세요");
			namechk = false;
		} else {
			noProc($('#name'), "한글 2~5자리 입력 가능");
			namechk = false;
		}
	});

	//유효성검증 - hp
	$('#phone').on('keyup', function() {
		let hpValue = $('#phone').val().trim();
		let regHp = /^[0-9]{3}[0-9]{3,4}[0-9]{4}$/;

		if (regHp.test(hpValue)) {
			okProc($('#phone'), "");
			hpchk = true;
		} else if (hpValue === "") {
			noProc($('#phone'), "전화번호를 입력하세요");
			hpchk = false;
		} else {
			noProc($('#phone'), "공백 없이 입력하세요");
			hpchk = false;
		}
	});

	//유효성검증 - mail
	$('#email').on('keyup', function() {
		let mailValue = $('#email').val().trim();
		let regMail = /^[0-9a-zA-Z]+@[0-9a-zA-Z]+(\.[a-z]+){1,2}$/;

		if (regMail.test(mailValue)) {
			okProc($('#email'), "");
			mailchk = true;
		} else if (mailValue === "") {
			noProc('#email', " 메일을 입력하세요");
			mailchk = false;
		} else {
			noProc($('#email'), "형식에 맞게 입력하세요");
			mailchk = false;
		}
	});

	// 회원가입 전송
	$('#sendBtn').on('click', valid)
}
	
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
	
	
function okProc(ele, str){
	let vs = $(ele).parents('.form-group').find('.sp');
	$(vs).html(str).css('color','green');
}
function noProc(ele, str){
	
	let vs = $(ele).parents('.form-group').find('.sp');
	$(vs).html(str).css('color','red');
}
</script>
