<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body>

<!--이쁜 알럽트창 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>

	<div class="login-box" style="margin:auto;">
        <div class="login-logo">
           <img class="logo" style="margin:auto;"  src="<%=request.getContextPath()%>/resources/images/RunderingMemberLogo.png" alt="RunderingMember">
           
            <!-- <b>회원</b> 로그인 -->
        </div>
        <div class="card">
            <div class="card-body" id="passwordDiv">
                <p class="login-box-msg"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">새비밀번호 입력<br> </font></font></p>
                    <form action="passwordModify" method="post" id="passwordModify">
                    	<input type="hidden" name="id" value="${id }">
	                    <div class="input-group mb-3" >
	                        <div class="col-12" style="padding-left: 0px;padding-right: 0px;">
	                        	<input type="password" name="password" class="form-control" id="password1" placeholder="새비밀번호" required >
	                    	</div>
	                    	<span class="sp"></span>
	                    </div>
	                    <div class="input-group mb-3" > 
	                    	<div class="col-12" style="padding-left: 0px;padding-right: 0px;">
	                   			<input type="password" class="form-control" id="password2" placeholder="비밀번호 확인" required >
	                   		</div>
	                   		<span class="sp"></span>
	                    </div>
	                    
	                    <div class="row">
	                        <div class="col-12">
	                            <button type="button" class="btn btn-primary btn-block" onclick="passwordModify()" ><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">비밀번호 변경</font></font></button>
	                        </div>
	                    </div>
                    </form>
            </div>
            
        </div>
    </div>
    <script>
    	let pwchk =false;
    	let passchk =false;
	    document.querySelector("#password1").addEventListener('keyup',function(){
			let passValue = document.querySelector("#password1").value.trim();
			let regPass = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+|]).{8,20}$/;
	
			if (regPass.test(passValue)) {
				okProc(document.querySelector("#password1"), "사용 가능한 패스워드 입니다!");
				pwchk = true;
			} else if (passValue === "") {
				noProc(document.querySelector("#password1"), "패스워드를 입력하세요");
				pwchk = false;
			} else {
				noProc(document.querySelector("#password1"), "대/소문자,특수문자,숫자 포함 8자리 이상 입력해야함");
				pwchk = false;
			}
		});
	
	//비밀번호 일치 여부 확인
		document.querySelector("#passwordDiv").addEventListener('keyup',function(){
			let pass1 = document.querySelector("#password1").value.trim();
			let pass2 = document.querySelector("#password2").value.trim();
			
			if (pass1 != "" || pass2 != "") {
			if (pass1 == pass2) {
				okProc(document.querySelector("#password2"), "일치");
				passchk = true; 
			}
			else {
				noProc(document.querySelector("#password2"), "불일치");
				passchk = false;
			}
			}
		});
	
		function okProc(ele, str){
			  let vs = ele.parentNode.parentNode.querySelector(".sp")
			   vs.style["color"]="green"
			   vs.innerText=str;
			}
		function noProc(ele, str){
			 let vs = ele.parentNode.parentNode.querySelector(".sp")
			   vs.style["color"]="red"
			   vs.innerText=str;
		}
	function passwordModify(){
		if(pwchk==false){
			Swal.fire({
				icon : 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
				title : '잘못된 비밀번호 입니다'
			});
			return;
		}
		if(passchk==false){
			Swal.fire({
				icon : 'error', // 여기다가 아이콘 종류를 쓰면 됩니다.
				title : '비밀번호가 일치하지않습니다.'
			});
			return;
		}
		let form =document.querySelector("#passwordModify");
		form.submit();
	}
    </script>
</body>
