<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
</head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<style>
    .bg{
        width: 100%;
        height: 100vh;
        opacity: 70%;
        background-size:cover;
        background-repeat : no-repeat;
    }
    .login-box{
        margin: 0;
        position: absolute;
        top: 50%;        
        left: 50%;        
        -ms-transform: translate(-50%, -50%);        
        transform: translate(-50%, -50%);
    }
</style>
<body>
    <img class="bg" src="<%=request.getContextPath()%>/resources/images/rundering_bg.jpg" alt="rundering_bg">
    <div class="login-box">
        <div class="login-logo">
            <div><a href="<%=request.getContextPath()%>/home.do"><img class="logo" src="<%=request.getContextPath()%>/resources/images/RunderingMemberLogo.png" alt="RunderingMember"></a></div>
            <!-- <b>회원</b> 로그인 -->
        </div>
        
        <div class="card">
            <div class="card-body login-card-body">
                <p class="login-box-msg"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">비밀번호를 잊으셨나요?<br> </font><font style="vertical-align: inherit;">▼▼아래 정보를 입력해주세요▼▼</font></font></p>
                <form method="post">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" id="" placeholder="이름을 입력하세요." required>
                    </div>
                    <div class="input-group mb-3">
                        <input type="id" class="form-control" id="id" placeholder="아이디를 입력하세요." required>
                    </div>
                    <div class="input-group mb-3">
                        <input type="email" class="form-control" id="mail" placeholder="이메일을 입력하세요." required>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary btn-block"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">임시 비밀번호 요청</font></font></button>
                        </div>
                        
                    </div>
                </form>
                <p class="mt-3 mb-1">
                    <a href="<%=request.getContextPath()%>/login.do"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">로그인</font></font></a>
                </p>
                <p class="mb-0">
                    <a href="<%=request.getContextPath()%>/join.do" class="text-center"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">신규 회원가입</font></font></a>
                </p>
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
</script>
</html>