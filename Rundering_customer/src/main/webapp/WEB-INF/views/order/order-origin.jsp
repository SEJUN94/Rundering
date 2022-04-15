<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<style>
	input{
		text-align:left;
	}
</style>
<!-- 주소api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div style="width: 60%;display: flex;flex-direction: column;margin-left: 20%;">

<div class="content-wrapper kanban"	style="height: auto; background-color: #fff;">
<section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>세탁주문 상세</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active">세탁주문 상세</li>
                        <li class="breadcrumb-item"><a href="#">세탁주문</a></li>
                    </ol>
                </div>
            </div>
        </div>
    </section>
    
    <div style="margin-left:100px;">
	<div>



		<br>
		<div class="input-group mb-3 col-sm-3" style="margin-top:30px;">
			<span style="margin-left:0;margin-top:auto;margin-bottom:auto;">주소입력</span>
			&nbsp;&nbsp;
			<div>
				<button class="btn btn-primary btn-sm">즐겨찾기1</button>
				&nbsp; &nbsp;
				<button class="btn btn-primary btn-sm">즐겨찾기2</button>
			</div>
		</div>
	</div>
	<div class="input-group mb-3 col-sm-3">
		<input type="text" class="form-control" id="zip"
			placeholder="우편번호 버튼 Click">
		<div class="input-group-append">
			<button type="button" id="modalBtn" class="btn btn-primary"
				onclick="findZip();">우편검색</button>
		</div>
	</div>
	<div class="input-group mb-3 col-sm-6">
		<input type="text" class="form-control" id="add1" placeholder="기본주소">
	</div>
	<div class="input-group mb-3 col-sm-4">
		<input type="text" class="form-control" id="add2" placeholder="상세주소">
	</div>
	
			<div>
			<br>

			<div class="input-group mb-3 col-sm-3">
				<h4>수거날짜 입력</h4>
			</div>
			<div class="col-sm-2">
				<input type="date" class="form-control"> <span class="sp"></span>
			</div>
		</div>
	

	<div>
		<div class="input-group mb-3 col-sm-3" style="margin-top:50px;">
			<h4>요청사항</h4>
		</div>
	</div>
	<div class="input-group mb-3 col-sm-3">
		<input type="text" class="form-control" id=""
			placeholder="ex) 공동현관 비밀번호 #12345*">
	</div>

</div>
    
    
    
	<section class="content pb-3"style="margin-top:30px;margin-bottom:30px;">
		<div class="container-fluid h-100">
			<div class="card card-row card-secondary">
				<div class="card-header">
					<h3 class="card-title">아우터</h3>
				</div>
				<div class="card-body">
					<div class="card card-secondary card-outline">
						<table>
							<tr>
								<td><input type="checkbox"></td>
								<td>양털집업</td>
								
								<td>
									<form>
										<input name=amount type="text" style="width: 50px;" value="0"/>개수
										<input type="button" value="+"  onClick="javascript:this.form.amount.value++;"
										style="background-color: skyblue; border: 0; border-radius: 3px; outline: 0; margin-left:30px;" />
										<input type="button" value="-" onClick="javascript:this.form.amount.value--;"
										style="background-color: rgb(235, 135, 222); border: 0; border-radius: 3px; outline: 0;">
									</form>
								</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>롱패딩</td>
								<td><input value="" style="width: 50px;" />개수</td>
								<td><input type="button" value="+"
									style="background-color: skyblue; border: 0; border-radius: 3px; outline: 0;"><input
									type="button" value="-"
									style="background-color: rgb(235, 135, 222); border: 0; border-radius: 3px; outline: 0;"></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>더블코트</td>
								<td><input value="" style="width: 50px;" />개수</td>
								<td><input type="button" value="+"
									style="background-color: skyblue; border: 0; border-radius: 3px; outline: 0;"><input
									type="button" value="-"
									style="background-color: rgb(235, 135, 222); border: 0; border-radius: 3px; outline: 0;"></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>가죽자켓</td>
								<td><input value="" style="width: 50px;" />개수</td>
								<td><input type="button" value="+"
									style="background-color: skyblue; border: 0; border-radius: 3px; outline: 0;"><input
									type="button" value="-"
									style="background-color: rgb(235, 135, 222); border: 0; border-radius: 3px; outline: 0;"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="card card-row card-primary">
				<div class="card-header">
					<h3 class="card-title">상의</h3>
				</div>
				<div class="card-body">
					<div class="card card-primary card-outline">
						<table>
							<tr>
								<td><input type="checkbox"></td>
								<td>셔츠</td>
								<td><input value="" style="width: 50px;" />개수</td>
								<td><input type="button" value="+"
									style="background-color: skyblue; border: 0; border-radius: 3px; outline: 0;"><input
									type="button" value="-"
									style="background-color: rgb(235, 135, 222); border: 0; border-radius: 3px; outline: 0;"></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>남방</td>
								<td><input value="" style="width: 50px;" />개수</td>
								<td><input type="button" value="+"
									style="background-color: skyblue; border: 0; border-radius: 3px; outline: 0;"><input
									type="button" value="-"
									style="background-color: rgb(235, 135, 222); border: 0; border-radius: 3px; outline: 0;"></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>블라우스</td>
								<td><input value="" style="width: 50px;" />개수</td>
								<td><input type="button" value="+"
									style="background-color: skyblue; border: 0; border-radius: 3px; outline: 0;"><input
									type="button" value="-"
									style="background-color: rgb(235, 135, 222); border: 0; border-radius: 3px; outline: 0;"></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>후드티</td>
								<td><input value="" style="width: 50px;" />개수</td>
								<td><input type="button" value="+"
									style="background-color: skyblue; border: 0; border-radius: 3px; outline: 0;"><input
									type="button" value="-"
									style="background-color: rgb(235, 135, 222); border: 0; border-radius: 3px; outline: 0;"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="card card-row card-default">
				<div class="card-header bg-info">
					<h3 class="card-title">하의</h3>
				</div>
				<div class="card-body">
					<div class="card card-info card-outline">
						<table>
							<tr>
								<td><input type="checkbox"></td>
								<td>슬랙스</td>
								<td><input value="" style="width: 50px;" />개수</td>
								<td><input type="button" value="+"
									style="background-color: skyblue; border: 0; border-radius: 3px; outline: 0;"><input
									type="button" value="-"
									style="background-color: rgb(235, 135, 222); border: 0; border-radius: 3px; outline: 0;"></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>청바지</td>
								<td><input value="" style="width: 50px;" />개수</td>
								<td><input type="button" value="+"
									style="background-color: skyblue; border: 0; border-radius: 3px; outline: 0;"><input
									type="button" value="-"
									style="background-color: rgb(235, 135, 222); border: 0; border-radius: 3px; outline: 0;"></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>조거팬츠</td>
								<td><input value="" style="width: 50px;" />개수</td>
								<td><input type="button" value="+"
									style="background-color: skyblue; border: 0; border-radius: 3px; outline: 0;"><input
									type="button" value="-"
									style="background-color: rgb(235, 135, 222); border: 0; border-radius: 3px; outline: 0;"></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>치마</td>
								<td><input value="" style="width: 50px;" />개수</td>
								<td><input type="button" value="+"
									style="background-color: skyblue; border: 0; border-radius: 3px; outline: 0;"><input
									type="button" value="-"
									style="background-color: rgb(235, 135, 222); border: 0; border-radius: 3px; outline: 0;"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>








	<div class="input-group-append">
		<button type="button" id="modalBtn" class="btn btn-primary" style="margin: auto;margin-top:50px;margin-bottom:50px;" onclick="location.href='<%=request.getContextPath()%>/order/comfirm.do'">주문하기</button><br/><br/>
	</div>
</div>
</div>


<script>
	function findZip() {
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