<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<title>세탁 주문접수</title>

<body>

	<div style="width: 60%; display: flex; flex-direction: column; margin-left: 20%;">


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
		
		
		<div class="card" style="box-shadow: none;">
			<div class="card-header">
				<h3 class="" style="text-align: center; font-size: 1.3rem; font-weight: 400;">세탁 정보 입력</h3>
			</div>

			<form role="form" class="form-horizontal" action="<%=request.getContextPath() %>/order/comfirm" method="post">
	
	
	
				<div class="card-body col-6" style="margin: auto; margin-top: 25px;">
					
					<div class="input-group mb-3">
						<label>수거날짜 입력</label>
					</div>
					<div class="">
						<input type="date" class="form-control"> <span class="sp"></span>
					</div>
					
					<div class="input-group mb-3" style="margin-top: 20px;">
						<label>요청사항</label>
					</div>
					<div class="input-group mb-3 ">
						<input type="text" class="form-control" id="" placeholder="ex) 공동현관 비밀번호 #12345*">
					</div>
					
					<button type="submit" style="margin-top: 20px;" class="btn btn-primary btn-block" onclick="location.href='<%=request.getContextPath()%>/order/comfirm.do'">주문하기</button>
				</div>
				
				
		
					<section class="content pb-3"style="margin-top:30px;margin-bottom:30px;">
		<div class="container-fluid h-100" >
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
				
				
				
			</form>
		</div>


	</div>



</body>