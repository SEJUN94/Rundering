<!DOCTYPE html>
<html lang="ko">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
    <meta charset="UTF-8">
    <script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
</head>
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
            <p class="login-box-msg">Sign in to start your session</p>
            <form action="<%=request.getContextPath() %>/common/login.do" method="post">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="아이디입력" name="id">
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input type="password" class="form-control" placeholder="Password" name="password">
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
                I forgot my <a href="<%=request.getContextPath()%>/login/findaccount.do">account</a> / <a href="<%=request.getContextPath()%>/login/findpassword.do">password</a>
            </p>
            <p class="mb-0">
                <a href="<%=request.getContextPath()%>/join.do" class="text-center">join a new membership</a>
            </p>
        </div>
    </div>
</div>
</body>
</html>