<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>


<body>

<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>지점 등록 관리</h1>
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
						<b>지점 신청 리스트</b>
					</h2>

					<div class="col-7"></div>
				</div>
				<div class="card-tools"></div>

			</div>

			<div class="card-body p-0">
				<table style="text-align: center;" class="table text-nowrap">
					<thead>
						<tr>
							<th class="width10">이름</th>
							<th class="WID">전화번호</th>
							<th>이메일</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
							<tr>
								<td class="list" id="memno" name="memno" style="vertical-align: middle" ></td>
								<td style="vertical-align: middle" ></td>
								<td style="vertical-align: middle">	</td>
								<td style="vertical-align: middle"><button type="submit" class="btn btn-danger btn-sm"></button></td>
							</tr>
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
					<b>지점 등록</b>
				</h3>
			</div>

			<form class="form-horizontal" method="post">
				<div class="card-body">
					<div class="row">
						<div class="col-md-3">
							<div class="form-group">
								<label>지점이름</label>
								<input type="text" class="form-control"	id="adress" name="adress" value=""  />
							</div>
							
							<div class="form-group">
								<label>우편번호</label> 
								<input type="text" class="form-control"	id="adress" name="adress" value=""  />
							</div>
							
							<div class="form-group">
								<label>상위지역코드</label> 
								<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value=""  />
							</div>
							
						
							
							
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>지점 전화번호</label> 
								<input type="text" class="form-control"	id="phone" name="phone" value="" readonly />
							</div>
							<div class="form-group">
								<label>주소</label> 
								<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value=""  />
							</div>
							<div class="form-group">
								<label>세탁기</label> 
								<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value=""  />
							</div>
							
							
						</div>
						<div class="col-md-3">
							<div class="form-group">
								<label>세탁가능수량</label> 
								<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value=""  />
							</div>
							<div class="form-group">
								<label>상세주소</label> 
								<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value=""  />
							</div>
							<div class="form-group">
								<label>건조기</label> 
								<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value=""  />
							</div>
						
						</div>
							<div class="col-md-3">
								<div class="form-group">
									<label>에어컨</label> 
									<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value=""  />
							
							</div>
							<div class="form-group">
								<label>지역분류</label> 
								<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value=""  />
							</div>
						</div>
						
						
					</div>
					<input type="hidden" id="memNo" name="memNo" value="" >
					<input type="hidden" id="jd" name="jd" value="" >
							<div class="form-group" style="">
								<div class="float-right col-2" style="margin-right: 0;">
									<button type="submit" class="btn col-12 btn-primary"
										onclick="regist()">등록</button>
								</div>
							</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>


