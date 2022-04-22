<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="appList" value="${dataMap.appList }" />
<c:set var="branchList" value="${branchList}" />



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
								<td id="memno" name="memno" style="vertical-align: middle">${list.memberNo}</td>
								<td style="vertical-align: middle" onClick="detail()">${list.name }</td>
								<td style="vertical-align: middle"><fmt:formatDate
										value="${list.registDate }" pattern="yyyy-MM-dd" /></td>
								<td style="vertical-align: middle"><button type="submit"
										class="btn btn-danger btn-sm" onclick="remove()">반려</button></td>
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
								<label>이름</label> <input type="text" class="form-control"
									id="name" name="name" value="" readonly />
							</div>
							<div class="form-group">
								<label>연락처</label> <input type="text" class="form-control"
									id="name" name="name" value="" readonly />
							</div>
							<div class="form-group">
								<label>이메일</label> <input type="text" class="form-control"
									id="email" name="eamil" value="" readonly />
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label>지점</label> <select
									class="form-control select2 select2-hidden-accessible"
									style="width: 100%;" data-select2-id="9" tabindex="-1"
									aria-hidden="true">
									<option selected="selected" data-select2-id="11" value="">등록 신청시 지점명</option>
									<option disabled="disabled">선택하세요 (disabled)</option>
									<c:forEach items="${branchList }" var="list">
										<option value="${list.branchCode }">${list.branchName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label>부서</label> <select
									class="form-control select2 select2-hidden-accessible"
									style="width: 100%;" data-select2-id="9" tabindex="-1"
									aria-hidden="true">
									<option selected="selected" data-select2-id="11">부서명</option>
									<option disabled="disabled">California (disabled)</option>
									<option value="">인사</option>
									<option value="">잘</option>
									<option value="">한다</option>
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
	function detail() {
		$.ajax({
			url : '<%=request.getContextPath()%>/admin/employeeapplication/detail',
			data : {
				'memberNo' : $('#memno').val()
			},
			type : 'post',
			success : function(result) {
				if (result.toUpperCase() == "DUPLICATED") {
					$('#rst').html("이미 존재하는 ID입니다").css('color', 'red');
					sp[0].style.display = 'none';
					rst.style.display = "inline-block";
				} else {
					$('#rst').html("사용 가능한 ID입니다").css('color', 'green');
					sp[0].style.display = 'none';
					rst.style.display = "inline-block";
				}
			},
			error : function(error) {
				//alert("시스템장애로 가입이 불가합니다.");
				AjaxErrorSecurityRedirectHandler(error.status);
			}
		});
	}
</script>

