<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
						<input type="text" class="form-control" name="name" id="name" value="백관우" disabled>
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
						<input type="password" class="form-control" name="password" value="112132" disabled>
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
						<input type="text" class="form-control" name="call"	value="010-6644-5555" disabled>
					</div>
					<span class="form-group col-7">
						<button class="btn  float-right" style="border-color: gray;"call">변경</button>
					</span>
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
						<input type="email" class="form-control " name="email" value="bgwbgw100@naver.com" disabled>
					</div>
					<span class="form-group col-4">
						<button class="btn  float-right" style="border-color: gray;"email">변경</button>
					</span>
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
						<input type="text" class="form-control" name="call" id="call" value="대전 광역시 유성구 반석동 반석마울 702-101 호">
					</div>
					<span class="form-group col-3">
						<button class="btn float-right" id="address" style="border-color: gray;">수정</button>
					</span>
				</div>
			</div>
		</div>
	</div>
</div>


