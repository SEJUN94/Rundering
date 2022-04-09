<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<section class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>세탁주문 확인</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item active">세탁주문</li>
					<li class="breadcrumb-item"><a href="#">Home</a></li>
				</ol>
			</div>
		</div>
	</div>
</section>

<div class="col-lg-12" style="margin-top:30px;">
	<div class="col-lg-6 card" style="float: left;">
		<div class="card-header border-0">
			<h3 class="card-title">주문내역 확인</h3>
		</div>
		<div class="card-body table-responsive p-0">
			<table class="table table-striped table-valign-middle">
				<thead>
					<tr>
						<th>Product</th>
						<th>개수</th>
						<th>이용가격</th>
						<th>총가격</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>셔츠</td>
						<td>4개</td>
						<td>1,500원</td>
						<td>6,000원</td>
					</tr>
					<tr>
						<td>극세사이불</td>
						<td>4개</td>
						<td>15,000원</td>
						<td>60,000원</td>
					</tr>
					<tr>
						<td>워커</td>
						<td>2개</td>
						<td>11,000원</td>
						<td>22,000원</td>
					</tr>
					<tr>
						<td>니트</td>
						<td>5개</td>
						<td>4,000원</td>
						<td>20,000원</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	</div>
	<div class="col-lg-6 card" style="float: right;">
		<img src="<%=request.getContextPath()%>/resources/images/how_use.png"
			alt="how_use">
	</div>
	
		<div class="col-lg-3 card">
	<div class="info-box mb-3">
		<span class="info-box-icon bg-success elevation-1"><i
			class="fas fa-shopping-cart"></i></span>
		<div class="info-box-content">
			<span class="info-box-text" style="margin:auto;">총 결제 금액</span> 
			<span class="info-box-number" style="margin:auto;">108,000원</span>
			<button type="button" class="btn btn-secondary" >결제</button>
		</div>
	</div>
</div>