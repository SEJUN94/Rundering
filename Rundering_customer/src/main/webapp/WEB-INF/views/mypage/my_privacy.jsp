<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

	<!-- 주소api -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div class="card card-secondary">
	<div class="card-header">
		<h3 class="card-title ">회원수정</h3>
	</div>
</div>

<div class="card-body marginfont text-center">
	<div class="form-group">
		<div class="row ">
			<label for="name" class="col-2">
				<p>이름</p>
			</label>
			<div class="col-10">
				<div class="col-12 row">
					<div class="form-group col-4">
						<input type="text" class="form-control" name="name" id="name" value="${loginUser.getName() }" disabled style="border:none;background-color:transparent;">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="row ">
			<label for="password" class="col-2">비밀번호 </label>
			<div class="col-10" id="divPassword">
				<div class="col-12 row">
					<div class="form-group col-4">
						<input type="password" class="form-control" name="password" value="${loginUser.getPassword() }" >
					</div>
					<span class="form-group col-7">
						<button class="btn float-right" id="password" style="border-color: gray;">변경</button>
					</span>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="row ">
			<label for="call" class="col-2">
				<p>전화번호</p>
			</label>
			<div class="col-10" id="divCall">
				<div class="col-12 row">
					<div class="form-group col-4">
						<input type="text" class="form-control" name="call"	value="${loginUser.getPhone() }">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="row ">
			<label for="email" class="col-2">
				<p>email</p>
			</label>
			<div class="col-10" id="divEmail">
				<div class="col-12 row">
					<div class="form-group col-7">
						<input type="email" class="form-control " name="email" value="${loginUser.getEmail() }" >
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="row ">
			<label for="call" class="col-2">
				<p>주소</p>
			</label>
			<div class="col-10">
				<div class="col-12 row">
					<div class="form-group col-8">
						<input type="text" class="form-control" name="add1" id="add1" value="${memberAddressList[0].getAdd1() }" disabled>
					</div>
					<span class="form-group col-3">
						<button class="btn float-right" id="modalBtn" style="border-color: gray;" onclick="findAdd();">주소검색</button>
					</span>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="row ">
			<label for="call" class="col-2">
				<p>상세주소</p>
			</label>
			<div class="col-10">
				<div class="col-12 row">
					<div class="form-group col-6">
						<input type="text" class="form-control" name="add2" id="add2" value="${memberAddressList[0].getAdd2() }">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="row ">
			<label for="call" class="col-2">
			</label>
			<div class="col-10">
				<div class="col-12 row">
					<div class="form-group col-8">
						<input type="hidden" class="form-control" name="zip" id="zip" value="${memberAddressList[0].getZip() }">
					</div>
					<span class="form-group col-3">
						<button class="btn float-right" id="address" style="border-color: gray;">수정</button>
					</span>
				</div>
			</div>
		</div>
	</div>
</div>


<script>
function findAdd() {
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

