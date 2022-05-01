<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>세탁물 수거/배송 관리</h1>
				</div>
			</div>
		</div>
	</section>
	<div class="callout callout-info ml-3 mr-3">
		<h5>
			<i class="fas fa-info"></i> <strong>공지 : </strong>버전 업데이트
		</h5>
		Rundering App Update 3.14
	</div>
	<div class="m-3" style="">
		<button type="button" class="btn btn-block btn-outline-info btn-lg"
			onclick="location.href='<%=request.getContextPath()%>/fordelivery/pickup?orderStatus=02'"
			style="font-size: 2rem; padding: 2rem 0; margin: 2rem 0;">
			<i class="fa fa-bell"></i> 진행중인 수거 1건
		</button>
		<button type="button" class="btn btn-block btn-outline-success btn-lg"
			onclick="location.href='<%=request.getContextPath()%>/fordelivery/delivery?orderStatus=07'"
			style="font-size: 2rem; padding: 2rem 0; margin: 2rem 0;">
			<i class="fa fa-bell"></i> 진행중인 배송 1건
		</button>
	</div>

</body>


