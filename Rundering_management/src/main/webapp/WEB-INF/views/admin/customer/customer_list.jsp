<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="memberList" value="${dataMap.memberList }" />

<head>
<!--이쁜 알럽트창 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">

<style>
.no {
	width: 10%;
}

.boardtitle {
	width: 35%;
}

.writer {
	width: 20%;
}

.date {
	width: 25%;
}

.clicks {
	width: 10%;
}

#body {
	padding-left: 1%;
	padding-right: 1%;
}
</style>
</head>
<body>
<section class="content-header">
	   <div class="container-fluid">
	      <div class="row mb-2">
	         <div class="col-sm-6">
	            <h1>회원관리</h1>
	         </div>
	      </div>
	   </div>
	</section>
	
<div id="body">
		<div class="row ml-2 mr-2">
			<div class="col-12">
				<div class="card ">
					<div class="card-header">
						<div class="card-tools">
					<div class="input-group input-group-sm" style="width: 380px;">

						<!-- sort -->
						<select class="form-control col-md-3" name="customerSort"
							id="customerSort" onchange="list_go(1);">
							<option value="01" ${cri.customerSort eq '01' ? 'selected' : '' }>전체회원</option>
							<option value="0" ${cri.customerSort eq '0' ? 'selected' : '' }>휴면회원</option>
							<option value="Y" ${cri.customerSort eq 'Y' ? 'selected' : '' }>탈퇴회원</option>
						</select>

						<!-- search bar -->
						<select class="form-control col-md-3" name="searchType"
							id="searchType">
							<option value="tc" ${cri.searchType eq 'tc' ? 'selected':'' }>전체</option>
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>회원번호</option>
							<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>이름</option>
						</select> <input class="form-control" type="text" name="keyword" 
							placeholder="검색어를 입력하세요." value="" /> <span
							class="input-group-append">
							<button class="btn btn-primary" type="button" style="background-color: #59a5cb;border-color: #59a5cb;"
								onclick="list_go(1);" data-card-widget="search">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				</div>
			</div>


				<table class="table table-hover text-nowrap" style="text-align:center;">
					<thead>
						<tr>
							<th class="memberNo">회원번호</th>
							<th class="id">아이디</th>
							<th class="name">이름</th>
							<th class="phone">연락처</th>
							<th class="email">email</th>
							<th class="lastLogpsnHourLiver">마지막로그인</th>
							<th class="change">탈퇴상태</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty memberList }">
							<tr>
								<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
							</tr>
						</c:if>
						<c:if test="${!empty memberList }">
							<c:forEach items="${memberList }" var="member">
								<tr style='font-size: 1em;'>
									<td>${member.memberNo }</td>
									<td>${member.id }</td>
									<td>${member.name}</td>
									<td>${member.phone }</td>
									<td>${member.email }</td>
									<td><fmt:formatDate value="${member.lastLogpsnHourLiver }"
											pattern="yyyy-MM-dd hh:mm:ss" /></td>
									<td>
										<c:if test="${member.deleteYn eq 'Y' }">
											<button class="btn btn-warning btn-sm"  style="background-color: #59a5cb; border: 1px solid #59a5cb;"
												onclick="modify_go('${member.memberNo}');">변경</button>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>

				<div class="card-footer">
					<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
				</div>
			
		</div>
	</div>
</div>
</div>
<form action="cancel" id="cancel">
	<input type="hidden" name="memberNo" id="cancelHidden" value="">
</form>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>

<script>

function modify_go(memberNo){
	
	Swal.fire({
        title: '일반회원으로 변경하시겠습니까?',
        icon : 'warning' ,
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '승인',
        cancelButtonText: '취소',
        reverseButtons: true, // 버튼 순서 거꾸로
        
      }).then((result) => {
          if (result.isConfirmed) {
		   document.querySelector("#cancelHidden").value=""+memberNo
		   document.querySelector('#cancel').submit();
		   console.log(document.querySelector("#cancelHidden").value)
	     
	   }
	})
}



</script>

</body>



