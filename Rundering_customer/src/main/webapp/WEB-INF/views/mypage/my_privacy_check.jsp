<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
#peter {
	width: 200px;
	height: 300px;
	list-style-type:none;
	margin:0;
	padding:0;
	border:solid 1px #f3f3f3;
	background-color:#f3f3f3;
}
aside ul li a{
	color:#000000;
	font-size:1.1em;
}
</style>


<div class="row">
	<aside style="padding-top: 50px;">
		<ul id="peter">
			<li style="margin-top: 15px; padding-bottom: 15px; border-bottom: solid 1px lightgray;">
				<h1 style="font-size: 1.5em; text-align: center;">마이페이지</h1>
			</li>
			<li onclick="location.href='<%=request.getContextPath()%>/mypage'"
				style="cursor: pointer; margin-top: 30px; margin-bottom: 15px; margin-left: 30px;"><a href="">회원
					정보 수정</a></li>
			<li onclick="location.href='<%=request.getContextPath()%>/mypage/myaddress'"
				style="cursor: pointer; margin-top: 15px; margin-bottom: 15px; margin-left: 30px;">
				<a>주소 관리</a>
			</li>
			<li onclick="location.href='<%=request.getContextPath()%>/mypage/myorder/histroy/main'" 
				style="margin-top: 15px; margin-bottom: 15px; margin-left: 30px;">
				<a>주문 내역</a>
			</li>
			<li	onclick="location.href='<%=request.getContextPath()%>/mypage/myinquiry/list'"
				style="cursor: pointer; margin-top: 10px; margin-bottom: 15px; margin-left: 30px;">
				<a>문의 내역</a>
			</li>
			<li	onclick="location.href='<%=request.getContextPath()%>/mypage/secedeform'"
				style="cursor: pointer; margin-top: 10px; margin-bottom: 15px; margin-left: 30px;">
				<a>회원 탈퇴</a>
			</li>
		</ul>
	</aside>
	<div style="width: 60%; display: flex; flex-direction: column; margin-left: 50px; margin-top:30px;">
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>회원정보 수정</h1>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item active">회원정보 수정</li>
							<li class="breadcrumb-item"><a href="#">마이페이지</a></li>
						</ol>
					</div>
				</div>
			</div>
			<hr style="border: 1px solid rgb(170, 167, 167);">
		</section>


		<strong><p class="text-center display-10" style="font-size: 1.2em;">회원님의 정보를 안전하게 보호하기위해 비밀번호를 다시한번 입력해 주세요</p></strong>
		<div class="card-body col-10 " style="margin-left: auto;">
			<div class="form-group">
				<div class="row ">
					<label for="password" class="col-2">
						<p style="font-size: 1.5em;">비밀번호</p>

					</label>
					<div class="col-10">
						<div class="col-12 row">
							<div class="form-group col-6">
								<input type="password" class="form-control" name="password"
									id="password" value="" />
							</div>
							<span class="form-group col-2">
								<button class="btn btn-secondary float-right"
									onClick="pwCkeck()">확인</button>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 알림 sweetalert2 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/sweetalert2/sweetalert2.all.min.js"></script>

<script>
	
	document.getElementById("password").focus();
	
	function pwCkeck(){
		if($('#password').val()== null){
			Swal.fire({
				icon: 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
				title: '비밀번호를 입력해주세요.',
			});
		} else {
			$.ajax({
				url : '<%=request.getContextPath()%>/mypage/pwCheck',
				data : {
					'password' : $('#password').val()
				},
				type : 'post',
				success : function(result) {
					if (result.toUpperCase() == "OK") {
						 location.href = "<%=request.getContextPath()%>/mypage/memberModifyform";
					} else {
						Swal.fire({
							icon: 'error', // 여기다가 아이콘 종류를 쓰면 됩니다.
							title: '비밀번호가 틀렸습니다!',
						});		
					}
				},
				error : function(error) {
					//alert("시스템장애로 가입이 불가합니다.");
					AjaxErrorSecurityRedirectHandler(error.status);
				}
			});
		}
	}
	
	document.querySelector('#password').addEventListener('keyup', (e)=>{
	    if (e.keyCode === 13) {
	    	
	    	if($('#password').val()== null || $('#password').val().trim()==""){
	    		Swal.fire({
					icon: 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
					title: '비밀번호를 입력해주세요.',
				});
			} else {
				$.ajax({
					url : '<%=request.getContextPath()%>/mypage/pwCheck',
					data : {
						'password' : $('#password').val()
					},
					type : 'post',
					success : function(result) {
						if (result.toUpperCase() == "OK") {
							 location.href = "<%=request.getContextPath()%>/mypage/memberModifyform";
						} else {
							Swal.fire({
								icon: 'error', // 여기다가 아이콘 종류를 쓰면 됩니다.
								title: '비밀번호가 틀렸습니다!',
							});
						}
					},
					error : function(error) {
						//alert("시스템장애로 가입이 불가합니다.");
						AjaxErrorSecurityRedirectHandler(error.status);
					}
				});
			}
	        // code for enter
	  }  
	});
	
</script>