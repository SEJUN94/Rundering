<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>지점전체조회</h1>
				</div>
			</div>
		</div>
	</section>
	<div>
		<a href="<%=request.getContextPath()%>/admin/branch/detail.do"
			class="nav-link">
			<p>지점 기본 정보</p>
		</a> <a href="<%=request.getContextPath()%>/admin/branch/infodetail.do"
			class="nav-link">
			<p>지점 상세 조회</p>
		</a>
	</div>
</body>
