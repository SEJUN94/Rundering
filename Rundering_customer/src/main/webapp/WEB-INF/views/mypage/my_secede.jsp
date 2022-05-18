<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!--이쁜 알럽트창 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>
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
li h1{
}

</style>

<div class="row">
	<aside style="padding-top:50px;">
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
				<a href="<%=request.getContextPath()%>/mypage/myorder/histroy/main">주문 내역</a>
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
						<h1>회원탈퇴</h1>
					</div>
				</div>
			</div>
		<hr style="border: 1px solid rgb(170, 167, 167);">
		</section>


<h2 class="text-center display-6" style="font-size: 1.1em;">탈퇴시 유의사항</h2><br>
<strong><p class="text-center display-10" style="font-size: 1.2em;">회원님의 정보를 안전하게 보호하기위해 비밀번호를 다시한번 입력해 주세요</p></strong>
<div class="card-body col-10 " style="margin-left: 15%; padding-top:50px;">
	<div class="form-group">
		<div class="row ">
			<label for="password" class="col-2">
				<p style="font-size: 1.5em;">비밀번호</p>
			</label>
				<div class="form-group col-5">
					<input type="password" class="form-control" name="password" id="password" value="">
				</div>
				<div>
					<button class="btn  float-right" style="border-color: gray; "
						type="submit" onclick="secede()">탈퇴하기</button>
				</div>
		</div>
	</div>
</div>
</div>
</div>


<script>
	function secede(){
		
		$.ajax({
			url : '<%=request.getContextPath()%>/mypage/secede',
			type : 'post',
			data : {
				'password' : $('#password').val()
			},
			success : function(response){
				if(response.toUpperCase() == "OK"){
					Swal.fire({
						icon: 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
						title: 'Rundering 회원탈퇴되었습니다.',
						text: '다음에 다시 이용해주세요.' 
					});
					location.href = "<%=request.getContextPath()%>/login/form";
				} else {
					setTimeout(function(){location.href = "<%=request.getContextPath()%>/login/form";},1000);
				} else if(response.toUpperCase() == "NO"){
					Swal.fire({
						icon: 'error', // 여기다가 아이콘 종류를 쓰면 됩니다.
						title: '탈퇴 실패!',
						text: '진행중인 세탁주문이 있습니다.',
						text: '세탁주문이 있을시 탈퇴 할 수 없습니다.' 
					});
					
				} else {	
					Swal.fire({
						icon : 'error', // 여기다가 아이콘 종류를 쓰면 됩니다.
						title : '비밀번호가 일치하지 않습니다.'
					});
				}
			},
			error : function(xhr) {
				alert(xhr.status);
			},
		});
	}
</script>
