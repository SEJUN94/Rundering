<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<c:if test="${from eq 'passwordModify' }">
		<script>
			alert("비밀번호 변경 완료")
			window.close();
		</script>
	</c:if>


<img class="bg" src="<%=request.getContextPath() %>/resources/images/LoginBackground.jpg" alt="rundering_bg" style="opacity: 0.6;">
<%-- <img class="bg" src="<%=request.getContextPath()%>/resources/images/rundering_bg.jpg" alt="rundering_bg"> --%>
<div class="login-box">
    <div class="login-logo">
        <div><a href="<%=request.getContextPath()%>/home"><img class="logo" style="width: 100%;" src="<%=request.getContextPath()%>/resources/images/RunderingMemberLogo.png" alt="RunderingMember"></a></div>
        <!-- <b>회원</b> 로그인 -->
    </div>
    
    <div class="card">
        <div class="card-body login-card-body">
            <p class="login-box-msg" onclick="data()">로그인 후 더 나은 서비스를 이용하세요</p>
            <form action="<%=request.getContextPath() %>/login" method="post">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="아이디입력  8~20" name="id" id="id" >
                    <div class="input-group-append">
                        <div class="input-group-text">
                        </div>
                    </div>
                </div>
                <div class="input-group mb-3">
                    <input type="password" class="form-control" placeholder="Password" name="password" id="pw" >
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary btn-block">로그인</button>
                    </div>
                    
                </div>
            </form>
           <p class='mt-2 mb-1'>
                <a></a>
                <a href="javascript:OpenWindow('<%=request.getContextPath()%>/login/findaccount','아이디 찾기', 450, 700)">아이디 찾기</a> / 
                <a href="javascript:OpenWindow('<%=request.getContextPath()%>/login/findpassword','비밀번호 찾기', 450, 700)">비밀번호 찾기</a>
            </p>
            <p class="mb-0"> 
                <a href="<%=request.getContextPath()%>/3agree" class="text-center">회원가입</a>
            </p>
   
        </div>
    </div>
</div>
</body>
