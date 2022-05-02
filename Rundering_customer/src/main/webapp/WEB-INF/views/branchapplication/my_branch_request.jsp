<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<style>
.pp {
	padding: 12px;
	box-sizing: border-box;
	overflow-y: scroll;
	font-size: 1.0rem;
	background: #s;
	margin-bottom: 16px;
}
</style>
</head>
<body>

	<div style="width: 70%; margin: auto;">
		<section class="content-header"
			style="margin-bottom: 0px; padding-bottom: 0px">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>지점 신청 처리상태</h1>
					</div>
				</div>
			</div>
			<hr>
		</section>
		<div class="card">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th colspan="10">신청 <button class="btn btn-sm btn-warning float-right">첫번쨰 상태일때만 수정</button></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>이름 </td>
						<td>이어진</td>
						<td>전화번호</td>
						<td>01022918232</td>
						<td>이메일</td>
						<td>bwgbgw100@aasndqwss.com </td>
					</tr>
					<tr>
						<td>임대차계약서</td>
						<td colspan="2">임대차 계약서 다운로드</td>
						<td colspan="2">임대차 계약서 보기</td>
						<td colspan="2">임대차 계약서 첨부수정 <button class="btn btn-sm btn-primary float-right">저장</button></td>
					</tr>
<!-- 					심사신청후 안보이게 -->
					<tr>
						<td colspan="10">심사내역</td>
					</tr>
					<tr >
						<td rowspan="1" style="border-bottom: 0px;">심사내용</td>
						<td rowspan="4" colspan="10" style="overflow: auto;">ㅁㄴㅇㅁㅇㅁㅇㄴㅁㅇㄴㅁㅇㄴㅁ</td>
					</tr>
					<tr>
						<td  colspan="" style="border-bottom: 0px;border-top: 0px;"></td>
					</tr>
					<tr>
						<td  colspan="" style="border-bottom: 0px;border-top: 0px;"></td>
					</tr>
					<tr>
						<td  colspan="" style="border-bottom: 0px;border-top: 0px;"></td>
					</tr>
					<tr>
						<td>수의계약서</td>
						<td colspan="2">수의계약서 양식다운로드</td>
						<td colspan="2">수의계약서 첨부 <button class="btn btn-sm btn-primary float-right">저장</button></td>
						<td colspan="2">수의계약서 첨부수정  <button class="btn btn-sm btn-warning float-right">저장</button></td>
					</tr>
					<tr>
						<td>수의계약서</td>
						<td colspan="3">수의계약서 다운로드</td>
						<td colspan="3">수의계약서 보기 <button class="btn btn-sm btn-primary float-right">확인</button></td>
					</tr>
						
					
					
				</tbody>
			</table>
		</div>
	</div>


</body>
</html>