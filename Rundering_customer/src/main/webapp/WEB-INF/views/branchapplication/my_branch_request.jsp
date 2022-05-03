<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<table class="table table-bordered">
			<thead>
				<tr>
					<th colspan="10" style="font-size:1.2em;">신청 정보
						<c:if test="${bv.progressStatusCode eq '01'}">	
							<button class="btn btn-sm float-right" style="background-color:#82BBD8;border-color:#82BBD8;color:#ffffff" >수정</button>
						</c:if>
						<c:if test="${bv.progressStatusCode ne '01' }">
							<c:if test="${bv.progressStatusCode eq '02'}">
								<span class="float-right">처리상태 : <span style="color:red;">반려</span></span>
							</c:if>
							<c:if test="${bv.progressStatusCode ne '02' }">
								<span class="float-right">처리상태 : <span style="color:blue;"> 승인</span></span>
							</c:if>
						</c:if>
					</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td style="background-color:#EBF3FC">이름 </td>
					<td>${bv.applicateName }</td>
					<td style="background-color:#EBF3FC">전화번호</td>
					<td>${bv.phone }</td>
					<td style="background-color:#EBF3FC">이메일</td>
					<td>${bv.email } </td>
				</tr>
				<tr>
					<td style="background-color:#EBF3FC">임대차계약서</td>
					<td colspan="2">임대차 계약서 다운로드</td>
					<td colspan="2">임대차 계약서 보기</td>
					<c:if test="${bv.progressStatusCode eq '01'}" >
					<td colspan="2">임대차 계약서 첨부<button class="btn btn-sm btn-primary float-right"  style="background-color:#82BBD8;border-color:#82BBD8;color:#ffffff">저장</button></td>
					</c:if>
				</tr>
				
				<c:if test="${bv.progressStatusCode ne '01'}" >
				<c:if test="${bv.progressStatusCode ne '02'}" >
					<!--심사신청후 안보이게 -->
					<tr>
						<td colspan="10" style="font-size:1.2em;">지점 등록 심사 
							<c:if test="${bv.progressStatusCode eq '03' }">
								<button class="btn btn-sm btn-primary float-right"  style="background-color:#82BBD8;border-color:#82BBD8;color:#ffffff" onclick="updateJudge()">심사신청</button>
							</c:if>
							<c:if test="${bv.progressStatusCode eq '04' }">
								<span class="float-right">처리상태 : <span style="">심사 대기중</span></span>
							</c:if>
							<c:if test="${bv.progressStatusCode eq '05' }">
								<span class="float-right">처리상태 : <span style="color:red">심사 반려</span></span>
							</c:if>
							<c:if test="${bv.progressStatusCode eq '06' || bv.progressStatusCode eq '07' || bv.progressStatusCode eq '08' || bv.progressStatusCode eq '09' || bv.progressStatusCode eq '10'}">
								<span class="float-right">처리상태 : <span style="color:blue">심사 승인</span></span>
							</c:if>
						</td>
					</tr>
				</c:if>
				</c:if>

				<c:if test="${bv.progressStatusCode ne '01'}">
				<c:if test="${bv.progressStatusCode ne '02'}">
				<c:if test="${bv.progressStatusCode ne '03'}">
				<c:if test="${bv.progressStatusCode ne '04'}">
					<tr>
						<td style="border-bottom: 0px; background-color:#EBF3FC; height:180px; vertical-align:middle;">심사내용</td>
						<td rowspan="4" colspan="10" style="overflow: auto;">${bv.examinationDetails }</td>
					</tr>
					<tr>
						<td  colspan="" style="border-bottom: 0px;border-top: 0px; background-color:#EBF3FC;"></td>
					</tr>
					<tr>
						<td  colspan="" style="border-bottom: 0px;border-top: 0px; background-color:#EBF3FC;"></td>
					</tr>
					<tr>
						<td  colspan="" style="border-bottom: 0px;border-top: 0px; background-color:#EBF3FC;"></td>
					</tr>
				</c:if>
				</c:if>
				</c:if>
				</c:if>
				<c:if test="${bv.progressStatusCode eq '06' || bv.progressStatusCode eq '07' || bv.progressStatusCode eq '08' || bv.progressStatusCode eq '09' || bv.progressStatusCode eq '10'}">	
				<tr>
					<th colspan="10" style="font-size:1.2em;">수의 계약 신청
						<c:if test="${bv.progressStatusCode eq '06'}">	
							<button class="btn btn-sm float-right" style="background-color:#82BBD8;border-color:#82BBD8;color:#ffffff" onclick="updateJudge1()" >신청</button>
						</c:if>
						<c:if test="${bv.progressStatusCode eq '07'}">
							<span class="float-right">처리상태 : <span style="">처리 대기</span></span>
						</c:if>
						<c:if test="${bv.progressStatusCode eq '08' || bv.progressStatusCode eq '09' || bv.progressStatusCode eq '10'}">
							<span class="float-right">처리상태 : <span style="color:blue;"> 승인</span></span>
						</c:if>
					</th>
				</tr>
				
				<c:if test="${bv.progressStatusCode eq '06' || bv.progressStatusCode eq '07' || bv.progressStatusCode eq '08' || bv.progressStatusCode eq '09' || bv.progressStatusCode eq '10'}">
				<tr>
					<td style="background-color:#EBF3FC">수의계약서</td> 
					<td colspan="2">수의계약서 양식다운로드</td>
					<c:if test="${bv.progressStatusCode eq '06'}">
					<td colspan="2">수의계약서 첨부 <button class="btn btn-sm btn-primary float-right" style="background-color:#82BBD8;border-color:#82BBD8;color:#ffffff">저장</button></td>
					</c:if>					
					<c:if test="${bv.progressStatusCode eq '07'}">
					<td colspan="2">수의계약서 첨부수정  <button class="btn btn-sm btn-warning float-right"  style="background-color:#82BBD8;border-color:#82BBD8;color:#ffffff">수정</button></td>
					</c:if>
				</tr>
				</c:if>
				</c:if>
				<c:if test="${bv.progressStatusCode eq '08' || bv.progressStatusCode eq '09' || bv.progressStatusCode eq '10'}">
				<tr>
					<td style="background-color:#EBF3FC">수의계약서</td>
					<td colspan="3">수의계약서 다운로드</td>
					<td colspan="3">수의계약서 보기 <button class="btn btn-sm btn-primary float-right" style="background-color:#82BBD8;border-color:#82BBD8;color:#ffffff">확인</button></td>
				</tr>
				</c:if>
				<c:if test="${bv.progressStatusCode eq '08' || bv.progressStatusCode eq '09' || bv.progressStatusCode eq '10'}">	
				<tr>
					<th colspan="10" style="font-size:1.2em;">지점 등록
						<c:if test="${bv.progressStatusCode eq '08'}">	
							<button class="btn btn-sm float-right" style="background-color:#82BBD8;border-color:#82BBD8;color:#ffffff" onclick="updateJudge2()">신 청</button>
						</c:if>
						<c:if test="${bv.progressStatusCode eq '09'}">
							<span class="float-right">처리상태 : <span style="">등록 대기중</span></span>
						</c:if>
						<c:if test="${bv.progressStatusCode eq '10'}">
							<span class="float-right">처리상태 : <span style="color:blue;">점포 계약 완료</span></span>
						</c:if>
					</th>
				</tr>
				</c:if>
			</tbody>
		</table>
		<input type="hidden" id="applicationNo" value="${bv.applicationNo}" />
	</div>
	<!-- 알림 sweetalert2 -->
<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/sweetalert2/sweetalert2.all.min.js"></script>
	
	
	<script>
		function updateJudge() {
			var no = document.getElementById('applicationNo');
			 $.ajax({
					url: "<%=request.getContextPath()%>/branchapplication/updateJudge",
					data:{
						'progressStatusCode' : '03' 	,
						'applicationNo' : no.value
						},
					type:'POST',
					success:function(re){
						if (re.toUpperCase() == "OK") {
	       					Swal.fire({
								icon: 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
								title: '심사신청이 되었습니다.',
								text: '심사 신청 기간은 1~2주 정도 소요됩니다.'
							});
	       					setTimeout(function(){location.reload()},3000);
	       				} else {
	       					Swal.fire({
	       						icon: 'error', // 여기다가 아이콘 종류를 쓰면 됩니다.
	       						title: '심사신청에 실패하였습니다.',
	       					});
	       				}
					},
					error:function(error){
						//alert("현재 사진 업로드가 불가합니다. \n관리자에게 연락바랍니다.");
						AjaxErrorSecurityRedirectHandler(error.status);
					}
				});
			 
		}
		function updateJudge1() {
			var no = document.getElementById('applicationNo');
			 $.ajax({
					url: "<%=request.getContextPath()%>/branchapplication/updateJudge",
					data:{
						'progressStatusCode' : '06' 	,
						'applicationNo' : no.value
						},
					type:'POST',
					success:function(re){
						if (re.toUpperCase() == "OK") {
	       					Swal.fire({
								icon: 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
								title: '수의 계약 신청이 되었습니다.',
								text: '수의 계약 신청 기간은 1~2일 정도 소요됩니다.'
							});
	       					setTimeout(function(){location.reload()},3000);
	       				} else {
	       					Swal.fire({
	       						icon: 'error', // 여기다가 아이콘 종류를 쓰면 됩니다.
	       						title: '수의 계약 신청에 실패하였습니다.',
	       					});
	       				}
					},
					error:function(error){
						//alert("현재 사진 업로드가 불가합니다. \n관리자에게 연락바랍니다.");
						AjaxErrorSecurityRedirectHandler(error.status);
					}
				});
			 
		}
		function updateJudge2() {
			var no = document.getElementById('applicationNo');
			 $.ajax({
					url: "<%=request.getContextPath()%>/branchapplication/updateJudge",
					data:{
						'progressStatusCode' : '08' 	,
						'applicationNo' : no.value
						},
					type:'POST',
					success:function(re){
						if (re.toUpperCase() == "OK") {
	       					Swal.fire({
								icon: 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
								title: '지점등록 신청 되었습니다.',
								text: '지점 등록 기간은 3~4일 정도 소요됩니다.'
							});
	       					setTimeout(function(){location.reload()},3000);
	       				} else {
	       					Swal.fire({
	       						icon: 'error', // 여기다가 아이콘 종류를 쓰면 됩니다.
	       						title: '지점등록 신청에 실패하였습니다.',
	       					});
	       				}
					},
					error:function(error){
						//alert("현재 사진 업로드가 불가합니다. \n관리자에게 연락바랍니다.");
						AjaxErrorSecurityRedirectHandler(error.status);
					}
				});
			 
		}
	</script>


</body>
</html>