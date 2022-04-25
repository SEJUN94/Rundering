<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!--이쁜 알럽트창 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>

    <h2 class="text-center " style="background-color: rgb(223, 219, 219); border-bottom: 1px solid gray; padding-bottom: 40px;padding-top: 40px;">이때까지 이용해주셔서 감사합니다 !!</h2>


    <h2 class="text-center display-6">탈퇴시 유의사항</h2>
    <strong><p class="text-center display-10" style="font-size: 1.2em;">회원님의 정보를 안전하게 보호하기위해 비밀번호를 다시한번 입력해 주세요</p></strong>
    <div class="card-body col-10 " style="margin-left: 30%;">
        <div class="form-group">
            <div class="row ">
                <label for="password" class="col-2">
                    <p style="font-size: 1.5em;">비밀번호</p>

                </label>
                <div class="col-10">
                    <div class="col-12 row">
                        <div class="form-group col-4">
                        <form class="form-horizontal" method="post">
                            <input type="password" class="form-control" name="password" id="password" value="">
                        </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card-body col-10 " style="margin-left: 30%;">
        <div class="form-group">
            <div class="row ">
                <label for="id" class="col-2">
                    <p style="font-size: 1.5em;">탈퇴 사유</p>
                </label>
                <div class="col-10">
                    <div class="col-12 row">
                        <div class="form-group col-4">
                            <textarea style="resize: none;" rows="4"></textarea> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<div>
		<span class="form-group col-2">
	    	<button class="btn  float-right" style="border-color: gray" type="submit" onclick="secede()">탈퇴</button>
	    </span>
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
						Swal.fire({
							icon: 'error', // 여기다가 아이콘 종류를 쓰면 됩니다.
							title: '비밀번호가 일치하지 않습니다.',
						});
					}
				},
				error : function(xhr) {
					alert(xhr.status);
				},
			});
	}
</script> 