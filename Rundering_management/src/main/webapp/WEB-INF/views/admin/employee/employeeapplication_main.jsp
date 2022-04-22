<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="appList" value="${dataMap.appList }" />
<c:set var="branchList" value="${branchList}" />
<c:set var="cvList" value="${cvList}" />
<c:set var="bv" value="${bv}" />



<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>사원 등록 관리</h1>
			</div>
		</div>
	</div>
</section>

<div class="row ml-3 mr-3">
	<div class="col-12">
		<div class="card">
			<div class="card-header">

				<div class="input-group input-group-sm">
					<h2 style="height: 20px;" class="card-title">
						<b>사원 신청 리스트</b>
					</h2>

					<div class="col-7"></div>
				</div>
				<div class="card-tools"></div>

			</div>

			<div class="card-body p-0">
				<table style="text-align: center;" class="table text-nowrap">
					<thead>
						<tr>
							<th>회원번호</th>
							<th>이름</th>
							<th>등록신청일</th>
							<th>상태변경</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty appList  }">
							<tr>
								<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
							</tr>
						</c:if>
						<c:forEach items="${appList }" var="list">
							<tr>
								<td class="list" id="memno" name="memno" style="vertical-align: middle" value="${list.memberNo}">${list.memberNo}</td>
								<td style="vertical-align: middle" onClick="detail('${list.memberNo}')">${list.name }</td>
								<td style="vertical-align: middle"><fmt:formatDate
										value="${list.registDate }" pattern="yyyy-MM-dd" /></td>
								<td style="vertical-align: middle"><button type="submit"
										class="btn btn-danger btn-sm" onclick="remove('${list.memberNo}')">반려</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="card-footer">
				<%@ include file="/WEB-INF/views/admin/employee/pagination.jsp"%>
			</div>
		</div>
	</div>
</div>

<div class="row ml-3 mr-3">
	<div class="col-12">
		<div class="card card-default">

			<div class="card-header">
				<h3 class="card-title">
					<b>사원 등록</b>
				</h3>
			</div>

			<form class="form-horizontal" method="post">
				<div class="card-body">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>이름</label> 
								<input type="text" class="form-control"	id="name" name="name" value="" readonly />
							</div>
							<div class="form-group">
								<label>연락처</label> 
								<input type="text" class="form-control"	id="phone" name="phone" value="" readonly />
							</div>
							<div class="form-group">
								<label>이메일</label> 
								<input type="text" class="form-control"	id="email" name="eamil" value="" readonly />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>지점</label>
								<input type="hidden" class="form-control"	id="branchCode" name="branchCode" value="${bv.branchCode }" readonly > 
								<input type="text" class="form-control"	value="${bv.branchName }" readonly > 
							</div>
							<div class="form-group">
								<label>부서</label> <select
									class="form-control select2 select2-hidden-accessible"
									style="width: 100%;" data-select2-id="9" tabindex="-1"
									aria-hidden="true">
									<option selected="selected" data-select2-id="11">부서명</option>
									<c:forEach items="${cvList }" var="list">
									<option value="${list.comCode }">${list.comCodeNm }</option>
									</c:forEach>
								</select>
							</div>

							<div class="form-group" style="margin-top: 45px;">
								<div class="float-right col-4" style="margin-right: 0;">
									<button type="submit" class="btn col-12 btn-primary"
										onclick="regist()">등록</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<script>
	let nm = document.querySelector('#name');
	let name = document.querySelector('input[id="name"]');
	let phone = document.querySelector('input[id="phone"]');
	let email = document.querySelector('input[id="email"]');
	
	function detail(no) {
		console.log(this);
		$.ajax({
			url : '<%=request.getContextPath()%>/admin/employeeapplication/detail',
			data : {
				'memberNo' : no
			},
			type : 'post',
			success : function(mv) {
				nm.value = mv.name
				phone.value = mv.phone
				email.setAttribute('value',mv.email)
				
				
			},
			error : function(error) {
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}
	
	function remove(no){
		console.log(this);
		$.ajax({
			url : '<%=request.getContextPath()%>/admin/employeeapplication/remove',
			data : {
				'memberNo' : no
			},
			type : 'post',
			success : function(ok) {
				if(ok.toUpperCase() == "OK"){
					Swal.fire('해당 신청을 반려하였습니다.', '반려', 'success' )
					setTimeout(function(){location.reload();},1000);
				} else {
					Swal.fire('error', '시스템 오류로 반려 할 수 없습니다.' , 'error')
				}
				
			},
			error : function(error) {
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
		
	}
	
	function regirst(){
			
	}
</script>

