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
</head>


<body>
    <img class="bg" src="imgfile/rundering_bg.jpg" alt="rundering_bg">
    <div class="register-box">
        <div class="login-logo">
            <div><img class="logo" src="imgfile/RunderingLogo.png" alt="RunderingMember"></div>
            <!-- <b>회원</b> 로그인 -->
        </div>
        <div class="card">
            <div class="card-body register-card-body">
                <p class="login-box-msg">Register a new membership</p>
                <form action="../../index.html" method="post">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="사원명 입력">
                        <div class="input-group-append">
                            <select class="btn btn-info btn-sm" name="Point">
                                <option value="">지점선택</option>
                                <option value="동구지점">동구지점</option>
                                <option value="중구지점">중구지점</option>
                                <option value="서구지점">서구지점</option>
                                <option value="유성구지점">유성구지점</option>
                                <option value="대덕구지점">대덕구지점</option>
                            </select>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="email" class="form-control" placeholder="Email">
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
                            <button type="submit" class="btn btn-primary btn-block">Register</button>
                        </div>
                        
                    </div>
                </form>
            </div>            
        </div>
    </div>
</body>
