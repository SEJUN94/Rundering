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
    .login-box{
        margin: 0;
        position: absolute;
        top: 50%;        
        left: 50%;        
        -ms-transform: translate(-50%, -50%);        
        transform: translate(-50%, -50%);
    }    
</style>
</head>
<body>
<img class="bg" src="imgfile/rundering_bg.jpg" alt="rundering_bg">

<div class="login-box">
    <div class="login-logo">
        <div><img class="logo" src="imgfile/RunderingLogo.png" alt="Rundering"></div>
        <!-- <b>사원</b> 로그인 -->
    </div>
    
    <div class="card">
        <div class="card-body login-card-body">
            <p class="login-box-msg">Sign in to start your session</p>
            <form action="../../index3.html" method="post">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="사번입력">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input type="password" class="form-control" placeholder="Password">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-8">
                        <div class="icheck-primary">
                            <input type="checkbox" id="remember">
                            <label for="remember">
                                Remember Me
                            </label>
                        </div>
                    </div>
                    
                    <div class="col-4">
                        <button type="submit" class="btn btn-primary btn-block">로그인</button>
                    </div>

                </div>
            </form>
            
            <p class="mb-1">
                <a href="worker_forgot_password.html">I forgot my password</a>
            </p>
            <p class="mb-0">
                <a href="worker_register.html" class="text-center">새로운 계정 발급하기</a>
            </p>
        </div>
    </div>

</div>
</body>
