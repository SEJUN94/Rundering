<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
								<td class="list" id="memno" name="memno" style="vertical-align: middle" >백관우</td>
								<td style="vertical-align: middle" >01033215542</td>
								<td style="vertical-align: middle">bgwbgw100@gmail.com</td>
								<td style="vertical-align: middle;padding-bottom: 6px;padding-top: 6px;">
								<button type="submit" class="btn btn-outline-danger btn-sm">신청승인</button>
								<button type="submit" class="btn btn-outline-danger btn-sm">심사승인</button>
								<button type="submit" class="btn btn-outline-danger btn-sm">수의계약</button>
								<button type="submit" class="btn btn-outline-danger btn-sm">지점등록</button></td>
							</tr>
							<tr>
								<td class="list" id="memno" name="memno" style="vertical-align: middle" >백관우</td>
								<td style="vertical-align: middle" >01033215542</td>
								<td style="vertical-align: middle">bgwbgw100@gmail.com</td>
								<td style="vertical-align: middle;padding-bottom: 6px;padding-top: 6px;">
								<button type="submit" class="btn btn-outline-danger btn-sm">신청승인</button>
								<button type="submit" class="btn btn-outline-danger btn-sm">심사승인</button>
								<button type="submit" class="btn btn-outline-danger btn-sm">수의계약</button>
								<button type="submit" class="btn btn-outline-danger btn-sm">지점등록</button></td>
							</tr>
							<tr>
								<td class="list" id="memno" name="memno" style="vertical-align: middle" >백관우</td>
								<td style="vertical-align: middle" >01033215542</td>
								<td style="vertical-align: middle">bgwbgw100@gmail.com</td>
								<td style="vertical-align: middle;padding-bottom: 6px;padding-top: 6px;">
								<button type="submit" class="btn btn-outline-danger btn-sm">신청승인</button>
								
							</tr>
							<tr>
								<td class="list" id="memno" name="memno" style="vertical-align: middle" >백관우</td>
								<td style="vertical-align: middle" >01033215542</td>
								<td style="vertical-align: middle">bgwbgw100@gmail.com</td>
								<td style="vertical-align: middle;padding-bottom: 6px;padding-top: 6px;">
								<button type="submit" class="btn btn-outline-danger btn-sm">신청승인</button>
								<button type="submit" class="btn btn-outline-danger btn-sm">심사승인</button>
								<button type="submit" class="btn btn-outline-danger btn-sm">수의계약</button>
								<button type="submit" class="btn btn-outline-danger btn-sm">지점등록</button></td>
							</tr>
							<tr>
								<td class="list" id="memno" name="memno" style="vertical-align: middle" >백관우</td>
								<td style="vertical-align: middle" >01033215542</td>
								<td style="vertical-align: middle">bgwbgw100@gmail.com</td>
								<td style="vertical-align: middle;padding-bottom: 6px;padding-top: 6px;">
								<button type="submit" class="btn btn-outline-success btn-sm">신청승인</button>
								<button type="submit" class="btn btn-outline-success btn-sm">심사승인</button>
								<button type="submit" class="btn btn-outline-success btn-sm">수의계약</button>
								<button type="submit" class="btn btn-outline-danger btn-sm">지점등록</button></td>
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
	<div class="col-8">
		<div class="card card-default">

			<div class="card-header">
				<h3 class="card-title">
					<b>지점 등록</b>
				</h3>
			</div>

			<form class="form-horizontal" method="post">
				<div class="card-body row">
						<div class="col-md-12 row">
							<div class="form-group col-4">
								<label>지점이름</label>
								<input type="text" class="form-control"	id="adress" name="adress" value=""  />
							</div>
							
							<div class="form-group col-4">
								<label>지점 전화번호</label> 
								<input type="text" class="form-control"	id="adress" name="adress" value=""  />
							</div>
							<div class="form-group col-2">
								<label>상위지역 </label> 
								<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value=""  />
							</div>
							<div class="form-group col-2">
								<label>하위지역 </label> 
								<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value=""  />
							</div>
							
						</div>
						<div class="col-md-12 row">
							<div class="form-group col-4">
								<label>우편번호</label> 
								<span class="input-group-append">
									<input type="text" class="form-control col-7"	id="phone" name="phone" value=""  />
								
									<button class ="btn btn-sm btn-primary col-5">우편검색</button>
								</span>
							</div>
							<div class="form-group col-4">
								<label>주소</label> 
								<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value=""  />
							</div>
							<div class="form-group col-4">
								<label>상세주소 </label> 
								<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value=""  />
							</div>
						</div>
					</div>
			</form>
		</div>
		<div class="card card-body">
			<div class="col-md-12 row">
				<div class="form-group col-4">
					<label>세탁가능수량</label> 
					<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value="" readonly="readonly" />
				</div>
				<div class="form-group col-2">
					<label>세탁기</label> 
					<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value=""  readonly="readonly" />
				</div>
				<div class="form-group col-2">
					<label>건조기</label> 
					<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value="" readonly="readonly"  />
				</div>
				<div class="form-group col-2">
						<label>에어컨</label> 
						<input type="text" class="form-control"	id="detailAdress" name="detailAdress" value=""  readonly="readonly" />
				</div>
					<div class="form-group col-2">
							<button type="submit" class="btn btn-md btn-primary" onclick="regist()" style="position: absolute; right: 0px; bottom: 0px;">등록</button>
					</div>
		
			</div>
		</div>
	</div>
	<div class="col-4">
		<div class="card card-body">
			<div class="col-md-12 ">
				<div class="form-group col-12">
					<div>
						<label>임대차계약서</label>
					</div> 
					<button class="btn btn-xs btn-secondary" onclick="addFile_go();" type="button"  style="background-color:#82BBD8;border: 1px solid #82BBD8">
					<i class="fas fa-file"></i>
					&nbsp; 임대차계약서 다운로드</button>
					<button class="btn btn-xs btn-secondary" onclick="addFile_go();" type="button"  style="background-color:#82BBD8;border: 1px solid #82BBD8">
					임대차계약서 보기</button>
				</div>
				<div class="form-group col-12">
					<div>
						<label>심사계약서</label>
					</div> 
					<button class="btn btn-xs btn-secondary" onclick="addFile_go();" type="button"  style="background-color:#82BBD8;border: 1px solid #82BBD8">
					<i class="fas fa-file"></i>
					&nbsp; 심사계약서 다운로드</button>
					<button class="btn btn-xs btn-secondary" onclick="addFile_go();" type="button"  style="background-color:#82BBD8;border: 1px solid #82BBD8">
					심사계약서 보기</button>
				</div>
				<div class="form-group col-12">
					<div>
						<label>수의계약서</label>
					</div> 
					<button class="btn btn-xs btn-secondary" onclick="addFile_go();" type="button"  style="background-color:#82BBD8;border: 1px solid #82BBD8">
					<i class="fas fa-file"></i>
					&nbsp; 수의계약서 다운로드</button>
					<button class="btn btn-xs btn-secondary" onclick="addFile_go();" type="button"  style="background-color:#82BBD8;border: 1px solid #82BBD8">
					수의계약서 보기</button>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row ml-3 mr-3">
	<div class="col-8">
		
	</div>
</div>

			
				


</body>


