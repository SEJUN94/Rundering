<!DOCTYPE html>
<html lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head>
    <meta charset="UTF-8">
    <script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
    <!-- 주소api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
</head>

<style>
    /* p{
        text-align: center;
        margin-top: 5px;
        margin-right: 5px;
    } */
    
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
    .form-control2{
        margin-top: 5px;
        height: 30px;
    }
</style>
  <body>
    <img class="bg" src="<%=request.getContextPath()%>/resources/images/rundering_bg.jpg" alt="rundering_bg">
    <div class="register-box">
        <div class="login-logo">
            <div><a href="<%=request.getContextPath()%>/home.do"><img class="logo" src="<%=request.getContextPath()%>/resources/images/RunderingMemberLogo.png" alt="RunderingMember"></a></div>
            <!-- <b>회원</b> 로그인 -->
        </div>
        <div class="card">
            <div class="card-body register-card-body">
                <p class="login-box-msg">join a new membership</p>
                <form action="../../index.html" method="post">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="아이디 입력">
                        <div class="input-group-append">
                            <button type="button" id="modalBtn" class="btn btn-info btn-sm" onclick="">중복체크</button>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control" placeholder="패스워드 입력">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control" placeholder="패스워드 재입력">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>   
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="닉네임">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-vcard"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="email" class="form-control" id="mail" placeholder="Email">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="휴대폰 ex)010-1234-5678">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-phone"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" id="zip"  placeholder="우편번호 버튼 Click">
                        <div class="input-group-append">
                            <button type="button" id="modalBtn" class="btn btn-info btn-sm" onclick="findZip();">우편검색</button>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" id="add1" placeholder="기본주소">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-address-book"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" id="add2" placeholder="상세주소">
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
                            <button type="submit" class="btn btn-primary btn-block">Join</button>
                        </div>
                        
                    </div>
                </form>
            </div>            
        </div>
    </div>
   </body>

<script>
    
    let mailchk = false;
    
    //유효성검증 - mail
    $('#mail').on('keyup',function(){
        let mailValue = $('#mail').val().trim();
        let regMail = /^[0-9a-zA-Z]+@[0-9a-zA-Z]+(\.[a-z]+){1,2}$/;
        
        if(regMail.test(mailValue)){
            okProc($('#mail'), "");
            mailchk = true;
        }else if(mailValue === ""){
            noProc('#mail', " 메일을 입력하세요");
            mailchk = false;
        }else{
            noProc($('#mail'), "형식에 맞게 입력하세요");
            mailchk=  false;
        }	
    });
    
    //우편번호검색 - address
    function findZip() {
        new daum.Postcode({
            oncomplete: function(data) {
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

</html>
