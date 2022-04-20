<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
					<h2 style="height: 10px;" class="card-title">사원 신청 리스트</h2>

					<div class="col-7"></div>
					<select class="form-control col-md-2" name="searchType"
						id="searchType">
						<option value="w">이름</option>
						<option value="w">주소</option>
						<option value="w">이름+주소</option>
						<option value="w">배송중</option>
					</select> <input class="form-control col-md-2" type="text" name="keyword"
						placeholder="검색어를 입력하세요." value=""><span
						class="input-group-append">
						<button class="btn btn-primary" type="button"
							onclick="list_go(1);" data-card-widget="search">
							<i class="fa fa-fw fa-search"></i>
						</button>
					</span>
				</div>
				<div class="card-tools"></div>

			</div>

			<div class="card-body p-0">
				<table style="text-align: center;" class="table text-nowrap">
					<thead>
						<tr>
							<th>회원번호</th>
							<th>이름</th>
							<th>지점명</th>
							<th>상태변경</th>
						</tr>
					</thead>
					<tbody>
						<tr	onclick="location.href='<%=request.getContextPath()%>/admin/customer/secessiondetail.do'">
							<td>183</td>
							<td>John Doe</td>
							<td>2022-03-27</td>
							<td>
							<div class="col-6" style="maring:auto;">
								<button type="submit" class="btn btn-danger btn-block" onclick="regist()">반려</button>
                        	</div>
                        </td>
						</tr>
						<tr
							onclick="location.href='<%=request.getContextPath()%>/admin/customer/secessiondetail.do'">
							<td>219</td>
							<td>Alexander Pierce</td>
							<td>2022-03-21</td>
							<td><span class="badge bg-success">탈퇴취소</span></td>
						</tr>
						<tr
							onclick="location.href='<%=request.getContextPath()%>/admin/customer/secessiondetail.do'">
							<td>657</td>
							<td>Bob Doe</td>
							<td>2021-12-04</td>
							<td><span class="badge bg-success">탈퇴취소</span></td>
						</tr>
						<tr
							onclick="location.href='<%=request.getContextPath()%>/admin/customer/secessiondetail.do'">
							<td>175</td>
							<td>Mike Doe</td>
							<td>2021-11-30</td>
							<td><span class="badge bg-success">탈퇴취소</span></td>
						</tr>
						<tr
							onclick="location.href='<%=request.getContextPath()%>/admin/customer/secessiondetail.do'">
							<td>115</td>
							<td>Henry Doe</td>
							<td>2021-10-27</td>
							<td><span class="badge bg-success">탈퇴취소</span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<%@ include file="/WEB-INF/include/pagination.jsp"%>
		</div>
	</div>
</div>

<div class="row ml-3 mr-3">
	<div class="col-12">
		<div class="card card-default">
			<div class="card-header">
				<h3 class="card-title">사원 등록</h3>
			</div>

			<div class="card-body">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label>Minimal</label> <select
								class="form-control select2 select2-hidden-accessible"
								style="width: 100%;" data-select2-id="1" tabindex="-1"
								aria-hidden="true">
								<option selected="selected" data-select2-id="3">Alabama</option>
								<option>Alaska</option>
								<option>California</option>
								<option>Delaware</option>
								<option>Tennessee</option>
								<option>Texas</option>
								<option>Washington</option>
							</select>
						</div>

						<div class="form-group">
							<label>Disabled</label> <select
								class="form-control select2 select2-hidden-accessible"
								disabled="" style="width: 100%;" data-select2-id="4"
								tabindex="-1" aria-hidden="true">
								<option selected="selected" data-select2-id="6">Alabama</option>
								<option>Alaska</option>
								<option>California</option>
								<option>Delaware</option>
								<option>Tennessee</option>
								<option>Texas</option>
								<option>Washington</option>
							</select><span
								class="select2 select2-container select2-container--default select2-container--disabled"
								dir="ltr" data-select2-id="5" style="width: 100%;"><span
								class="selection"><span
									class="select2-selection select2-selection--single"
									role="combobox" aria-haspopup="true" aria-expanded="false"
									tabindex="-1" aria-disabled="true"
									aria-labelledby="select2-owzu-container"><span
										class="select2-selection__rendered"
										id="select2-owzu-container" role="textbox"
										aria-readonly="true" title="Alabama">Alabama</span><span
										class="select2-selection__arrow" role="presentation"><b
											role="presentation"></b></span></span></span><span class="dropdown-wrapper"
								aria-hidden="true"></span></span>
						</div>

					</div>

					<div class="col-md-6">
						<div class="form-group">
							<label>Multiple</label>
							<input type="email" class="form-control" id="eamil" name="email" placeholder="Email">
						</div>

						<div class="form-group">
							<label>Disabled Result</label> <select
								class="form-control select2 select2-hidden-accessible"
								style="width: 100%;" data-select2-id="9" tabindex="-1"
								aria-hidden="true">
								<option selected="selected" data-select2-id="11">Alabama</option>
								<option>Alaska</option>
								<option disabled="disabled">California (disabled)</option>
								<option>Delaware</option>
								<option>Tennessee</option>
								<option>Texas</option>
								<option>Washington</option>
							</select>
						</div>
					</div>
				</div>

				<h5>Custom Color Variants</h5>
				<div class="row">
					<div class="col-12 col-sm-6">
						<div class="form-group">
							<label>Minimal (.select2-danger)</label> <select
								class="form-control select2 select2-danger select2-hidden-accessible"
								data-dropdown-css-class="select2-danger" style="width: 100%;"
								data-select2-id="12" tabindex="-1" aria-hidden="true">
								<option selected="selected" data-select2-id="14">Alabama</option>
								<option>Alaska</option>
								<option>California</option>
								<option>Delaware</option>
								<option>Tennessee</option>
								<option>Texas</option>
								<option>Washington</option>
							</select><span
								class="select2 select2-container select2-container--default"
								dir="ltr" data-select2-id="13" style="width: 100%;"><span
								class="selection"><span
									class="select2-selection select2-selection--single"
									role="combobox" aria-haspopup="true" aria-expanded="false"
									tabindex="0" aria-disabled="false"
									aria-labelledby="select2-3dbq-container"><span
										class="select2-selection__rendered"
										id="select2-3dbq-container" role="textbox"
										aria-readonly="true" title="Alabama">Alabama</span><span
										class="select2-selection__arrow" role="presentation"><b
											role="presentation"></b></span></span></span><span class="dropdown-wrapper"
								aria-hidden="true"></span></span>
						</div>

					</div>

					<div class="col-12 col-sm-6">
						<div class="form-group">
							<label>Multiple (.select2-purple)</label>
							<div class="select2-purple">
								<select class="select2 select2-hidden-accessible" multiple=""
									data-placeholder="Select a State"
									data-dropdown-css-class="select2-purple" style="width: 100%;"
									data-select2-id="15" tabindex="-1" aria-hidden="true">
									<option>Alabama</option>
									<option>Alaska</option>
									<option>California</option>
									<option>Delaware</option>
									<option>Tennessee</option>
									<option>Texas</option>
									<option>Washington</option>
								</select><span
									class="select2 select2-container select2-container--default"
									dir="ltr" data-select2-id="16" style="width: 100%;"><span
									class="selection"><span
										class="select2-selection select2-selection--multiple"
										role="combobox" aria-haspopup="true" aria-expanded="false"
										tabindex="-1" aria-disabled="false"><ul
												class="select2-selection__rendered">
												<li class="select2-search select2-search--inline"><input
													class="select2-search__field" type="search" tabindex="0"
													autocomplete="off" autocorrect="off" autocapitalize="none"
													spellcheck="false" role="searchbox"
													aria-autocomplete="list" placeholder="Select a State"
													style="width: 769.5px;"></li>
											</ul></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
							</div>
						</div>

					</div>

				</div>


			</div>
		</div>
	</div>
</div>

