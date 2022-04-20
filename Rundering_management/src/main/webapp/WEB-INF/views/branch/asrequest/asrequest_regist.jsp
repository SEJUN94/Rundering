<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<body>

	<div class="col-md-12">
		<div class="card-primary card-outline">
			<div class="card-header">
				<h3 class="card-title">AS 요청</h3>
			</div>
			<form role="form" action="regist" method="post" name="registForm">
				<div class="card-body p-0">
					<div class="form-group">
						<label for="title"
							style="margin-left: 10px; margin-top: 10px; font-size: large;">제목</label>
						<input type="text" name="title" id="title" class="form-control"
							placeholder="ㅇ호 물품명 고장">
					</div>
					<div class="form-group">
						<label for="writer" style="margin-left: 10px; font-size: large;">작성자</label>
						<input type="text" id="writer" readonly name="writer"
							class="form-control" value="${loginEmployee.employeeId }">
					</div>
					<div class="form-group">
						<label for="branchName"
							style="margin-left: 10px; font-size: large;">소속지점</label> <input
							type="text" id="branchName" readonly name="branchName"
							class="form-control" value="${loginEmployee.branchCode }">
					</div>
					<div class="form-group">
						<label for="inputName" style="margin-left: 10px; font-size: large;">물품</label>
						<div class=" col-sm-6">
							<select class="form-control" name="" id=""
								style="width: 120px; margin-top: 6px;">
								<option value="세탁기">세탁기</option>
								<option value="건조기">건조기</option>
								<option value="에어컨">에어컨</option>
							</select>
							<select class="form-control" name="" id=""
								style="width: 120px; margin-top: 6px;">
								<option value="세탁기">세탁기</option>
								<option value="건조기">건조기</option>
								<option value="에어컨">에어컨</option>
							</select>
						</div>
						<div class=" col-sm-6">
							
						</div>
					</div>
					<div class="form-group">
						<label for="content" style="margin-left: 10px; font-size: large;">내
							용</label>
						<textarea style="border: none; height: 100px; resize: none;"
							class="textarea" rows="10" cols="20" id="content" name="content"></textarea>
					</div>
				</div>
			</form>
		</div>
		<div class="tab-pane active " id="settings">

			<form class="form-horizontal" action="" method="post">
				<div class="form-group row">
					<label for="inputName" class="col-sm-2 col-form-label">물품</label>
					<div class=" col-sm-10">
						<select class="form-control" name="" id=""
							style="width: 120px; margin-top: 6px;">
							<option value="세탁기">세탁기</option>
							<option value="건조기">건조기</option>
							<option value="에어컨">에어컨</option>
						</select>

					</div>
				</div>

				<div class="form-group row">
					<label for="inputName2" class="col-sm-2 col-form-label">고장원인</label>
					<div class="col-sm-10">

						<textarea name="" id="inputName2" cols="30" rows="4"
							class="form-control" placeholder="고장원인"></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label for="inputName3" class="col-sm-2 col-form-label">고장내용</label>
					<div class="col-sm-10">

						<textarea name="" id="inputName3" cols="30" rows="4"
							class="form-control" placeholder="고장내용"></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label for="inputSkills" class="col-sm-2 col-form-label">고장날짜</label>
					<div class="col-sm-4">
						<input type="date" class="form-control" id="inputSkills"
							placeholder="Skills">
					</div>
				</div>

				<div class="form-group row">
					<div class="offset-sm-2 col-sm-10">
						<div class="float-right">
							<button type="submit" class="btn btn-primary">저장</button>
							<button type="submit" class="btn btn-secondary">취소</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
