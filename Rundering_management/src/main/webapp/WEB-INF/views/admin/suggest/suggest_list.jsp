<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="suggestList" value="${dataMap.suggestList }" />

<head>

<style>
th, .td {
	text-align: center;
}
</style>
</head>

<body>
	<section class="content-header">
	   <div class="container-fluid">
	      <div class="row mb-2">
	         <div class="col-sm-6">
	            <h1>건의사항</h1>
	         </div>
	      </div>
	   </div>
	</section>
	<div id="body">
		<div class="row ml-3 mr-3">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<h2 style="height: 20px;" class="card-title">
		                  <b></b>
		               	</h2>
						<div class="card-tools">
							<div class="input-group input-group-sm" style="width: 300px;">
								<select class="form-control col-md-4" name="searchType"
									id="searchType">
									<option value="tcwb"
										${cri.searchType eq 'tcwb' ? 'selected':'' }>전체</option>
									<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제목</option>
									<option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내용</option>
									<option value="w" ${cri.searchType eq 'w' ? 'selected':'' }>작성자</option>
									<option value="b" ${cri.searchType eq 'b' ? 'selected':'' }>지점</option>
								</select> <input class="form-control" type="text" name="keyword"
									placeholder="검색어를 입력하세요." value="" /> <span
									class="input-group-append">
									<button class="btn btn-primary" type="button"
										onclick="list_go(1);" data-card-widget="search" style="background-color: #59a5cb; border: 1px solid #59a5cb;">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
					<div class="card-body p-0" style="height: 540px">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr style="text-align: center;">
									<th></th>
									<th width="60%">제목</th>
									<th width="10%">작성자</th>
									<th width="10%">지점</th>
									<th width="10%">작성날짜</th>
									<th class="">첨부파일</th>
									<th width="3%">조회수</th>
									<c:if test="${cri.searchType eq 'checktrue'}">
										<th width="3%" class="pr-3" style="cursor: pointer" onclick="checkSolting('${cri.searchType}')" id ="checkText">
										확인 
										<i class="fas fa-arrows-alt-v"></i>
										</th>
									</c:if>
									<c:if test="${cri.searchType eq 'checkfalse'}">
										<th width="3%" class="pr-3" style="cursor: pointer" onclick="checkSolting('${cri.searchType}')" id ="checkText">
										미확인
										<i class="fas fa-arrows-alt-v"></i>
										 </th>
									</c:if>
									<c:if test="${cri.searchType ne 'checkfalse'}">
										<c:if test="${cri.searchType ne 'checktrue'}">
											<th width="3%" class="pr-3" style="cursor: pointer" onclick="checkSolting('${cri.searchType}')" id ="checkText">
											확인여부 
											<i class="fas fa-arrows-alt-v"></i>
											</th>
										</c:if>
									</c:if>
								</tr>
							</thead>
							<c:if test="${empty suggestList }">
								<tr>
									<td colspan="7" style="text-align: center;"><strong>해당 내용이 없습니다.</strong></td>
								</tr>
							</c:if>
							<c:forEach items="${suggestList }" var="suggest"  varStatus="status">
								<tr style='cursor: pointer; font-size:1em;text-align: center;'
									onclick="OpenWindow('detail?from=list&sno=${suggest.sno }','상세보기',900,700);">
									<td class="td">${(cri.page - 1) * cri.perPageNum + (status.index +1) }</td>
									<td id="Title"
										style="text-align: left; max-width:330px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${suggest.title }
										<c:set var="now" value="<%=new java.util.Date()%>" /><!-- 현재시간 -->
										<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" /><!-- 현재시간을 숫자로 -->
										<fmt:parseNumber value="${suggest.registDate.time / (1000*60*60*24)}" integerOnly="true" var="chgDttm" /><!-- 게시글 작성날짜를 숫자로 -->
										<c:if test="${today - chgDttm le 3}"><!-- 3일동안은 new 표시 -->
											&nbsp;&nbsp;<span class="badge bg-red">new</span>
										</c:if>
									</td>
									<td class="td">${suggest.writer }</td>
									<td class="td">${suggest.branchName }</td>
									<td class="td"><fmt:formatDate
											value="${suggest.registDate }" pattern="yyyy-MM-dd" /></td>
									<td>
										<c:if test="${!empty suggest.atchFileNo }">
											<i class="nav-icon fas fa-file"></i>
										</c:if>
										<c:if test="${empty suggest.atchFileNo }">
											<span>-</span>
										</c:if>
									</td>
									<td class="td"><span class="tag tag-success">${suggest.viewcnt }</span></td>
				                            <td class="pr-3"><span class="badge ${suggest.checkyn eq '확인' ? 'bg-primary' : 'bg-danger'}" style="font-size: 0.88rem;">${suggest.checkyn}</span></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="card-footer" style="font-size: 1em">
						<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	function checkSolting(check){
		if(check=="checktrue"){
			location.href="<%=request.getContextPath()%>/admin/suggest/list?searchType=checkfalse";
			return
		}
		location.href="<%=request.getContextPath()%>/admin/suggest/list?searchType=checktrue";
		
	}
	
	</script>
	
</body>