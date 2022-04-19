<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<style>
    .bg{
        width: 100%;
        height: 100vh;
        opacity: 70%;
        background-size:cover;
        background-repeat : no-repeat;
    }
    .register-box{
        margin: 0;
        position: absolute;
        top: 50%;        
        left: 50%;        
        -ms-transform: translate(-50%, -50%);        
        transform: translate(-50%, -50%);
    }
</style>
<!-- 이쁜알림창 -->
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">

<!-- 주소api -->
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>

    <div class="register-box">
        <div class="login-logo">
            <div><img class="logo" src="imgfile/RunderingLogo.png" alt="RunderingMember"></div>
            <!-- <b>회원</b> 로그인 -->
        </div>
        <div class="card">
            <div class="card-body register-card-body">
                <p class="login-box-msg">Register a new membership</p>
                <form class="form-horizontal" onsubmit="return valid();" method="post">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" id="name" name="name" placeholder="사원명 입력">
                        <div class="input-group-append">
                            <select class="btn btn-info btn-sm form-control" name="password" id="password">
                                <option value="">지점선택</option>
                                <option value="0601">동구지점</option>
                                <option value="0602">중구지점</option>
                                <option value="0603">서구지점</option>
                                <option value="0604">유성구지점</option>
                                <option value="0605">대덕구지점</option>
                            </select>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="email" class="form-control" id="eamil" name="email" placeholder="Email">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" id="phone" name="phone" placeholder="휴대폰 ex)010-1234-5678">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-phone"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" id="zip" name="zip" placeholder="우편번호 버튼 Click" readonly>
                        <div class="input-group-append">
                            <button type="button" id="modalBtn" class="btn btn-info btn-sm" onclick="findZip();">우편검색</button>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" id="add1" name="add1" placeholder="기본주소" readonly>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-address-book"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" id="add2" name="add2" placeholder="상세주소">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-address-book"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <div class="icheck-primary">
                                <input type="checkbox" id="agreeTerms" name="terms" value="agree">
                                <label for="agreeTerms">
                                    I agree to the <a href="#">terms</a>
                                </label>
                            </div>
                        </div>
                        <div class="col-4">
                            <button type="submit" class="btn btn-primary btn-block" onclick="regist()">등록신청</button>
                        </div>
                    </div>
                </form>
            </div>            
        </div>
    </div>
    
<script>

	let phonchk = false;

	function regist(){
		event.preventDefault();	//submit 이벤트를 막아 페이지 리로드를 방지
		if(phonchk){
			let formData = $('form').serialize();
			
			var pw1 = $('input[name="password"]');
			var pw2 = pw1.val();
			if(pw2 != ""){
				$.ajax({
					url : '<%=request.getContextPath()%>/common/application_success',
					type : 'post',
					data : formData,
					success : function(response){
						if(response.toUpperCase() == "OK"){
							Swal.fire('Rundering 사원등록 신청이 완료되었습니다.', '사원 등록 후 아이디 및 패스워드를 이메일로 보내드리니 이메일을 확인해주세요', 'success' )
							location.href = "<%=request.getContextPath()%>/common/loginform";
							} else {
							Swal.fire('공백없이 형식에 맞게 작성해주세요!', 'error' )
							}
						},
						error : function(xhr) {
							alert(xhr.status);
						},
					});
			}else {
				Swal.fire('지점코드르 선택해주세요!', 'error' )
			}
		}else{
			Swal.fire('휴대폰 인증이 필요합니다!', 'error' )
			document.getElementById("phone").focus();
		}
	}
</script>


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


</body>

</html>