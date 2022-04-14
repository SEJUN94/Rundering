<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>

<style>
th,td{
	text-align: center;
}
.no {
	width: 12%;
}

.boardtitle {
	width: 25%;
}

.writer {
	width: 20%;
}

.date {
	width: 20%;
}

.clicks {
	width: 11%;
}
.yn{
	width: 12%;
}
</style>
</head>

<body>
	<div id="body">
		<div class="row ml-2 mr-2">
			<div class="col-12">
				<div class="card card-primary card-outline">
					<div class="card-header">
						<h3 class="card-title">건의사항</h3>
						<div class="card-tools">
							<div class="input-group input-group-sm">
								<div class="input-group-sm selectWidth">
									<select class="form-control " name="searchType" id="searchType">
										<option value="tcb" ${cri.searchType eq 'tc' ? 'selected':'' }>전체</option>
										<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제목</option>
										<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내용</option>
										<option value="b" ${cri.searchType eq 'b' ? 'selected':'' }>지점</option>
									</select>									
								</div>
								<div class="input-group-sm textWidth">
									<input class="form-control" type="text" name="keyword"
										placeholder="검색어를 입력하세요." value="${param.keyword }">
								</div>
									<span class="input-group-append">
										<button class="btn btn-primary" type="button"
											onclick="list_go(1);" data-card-widget="search">
											<i class="fa fa-fw fa-search"></i>
										</button>
									</span>
							</div>
						</div>
						<div class="card-body p-0">
							<table class="table table-hover text-nowrap">
								<thead>
									<tr>
										<th class="no" id=>번호</th>
										<th class="boardtitle">제목</th>
										<th class="writer">작성자</th>
										<th class="date">작성날짜</th>
										<th class="clicks">조회수</th>
										<th class="yn">확인여부</th>
									</tr>
								</thead>
								<c:if test="${empty anonymousList }">
									<tr>
										<td colspan="5"><strong>해당 내용이 없습니다.</strong></td>
									</tr>
								</c:if>
								<c:forEach items="${anonymousList }" var="anonymous">
									<tr 
										onclick="OpenWindow('detail?from=list&ano=${anonymous.ano }','상세보기',900,700);">
										<td class="no">${anonymous.ano }</td>
										<td class="boardtitle">${anonymous.title }</td>
										<td class="writer">${anonymous.writer }</td>	
										<td class="date"><fmt:formatDate value="${anonymous.registDate }"
												pattern="yyyy-MM-dd" /></td>
										<td class="clicks"><span class="tag tag-success">${anonymous.viewcnt }</span></td>
										<td class="yn">확인</td>
									</tr>
								</c:forEach>
							</table>
							<div class="float-right mt-3 mr-3 mb-3">

								<button class="btn btn-primary" type="button" id="registBtn"
									onclick="location.href='<%=request.getContextPath()%>/branch/suggest/registForm'">
									작성하기</button>
							</div>
						</div>


						<div class="card-footer" style="font-size: 0.9em">

							<nav aria-label="Contacts Page Navigation">
								<ul class="pagination justify-content-center m-0">
									<li class="page-item"><a class="page-link" href="#"> <i
											class="fas fa-angle-left"></i>
									</a></li>
									<li class="page-item"><a class="page-link" href="#"> <i
											class="fas fa-angle-double-left"></i>
									</a></li>
									<li class="page-item active"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">4</a></li>
									<li class="page-item"><a class="page-link" href="#">5</a></li>
									<li class="page-item"><a class="page-link" href="#"> <i
											class="fas fa-angle-right"></i>
									</a></li>
									<li class="page-item"><a class="page-link" href="#"> <i
											class="fas fa-angle-double-right"></i>
									</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>