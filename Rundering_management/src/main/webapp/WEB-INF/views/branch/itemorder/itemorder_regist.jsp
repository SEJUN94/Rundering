<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<body>
	<div >
		<div class="row ml-2 mr-2">
			<div class="col-6">
				<div class="card card-primary card-outline col-12">
					<div class="card-header">
						<h3 class="card-title">물품리스트</h3>
						<div class="card-tools"></div>
					</div>
					<div class="card-body p-0" style="font-size: 0.9em; height: 760px;">
						<table class="table table-hover ">
							<thead>
								<tr>
									<th class="width20" style="text-align: center">물품명</th>
									<th class="width15" style="text-align: center">사진</th>
									<th class="width15" style="text-align: center">금액</th>
									<th class="width10" style="text-align: center;">담기</th>
								</tr>
							</thead>
	
							<tbody>
								<tr>
									<td style="text-align: left;">세제</td>
									<td style="text-align: center;">사진</td>
									<td style="text-align:right;" >3000</td>
									<td style="text-align: center; padding-top: 8px"><button type="button"
											class="btn btn-primary btn-sm">담기</button></td>
	
								</tr>
								
							</tbody>
						</table>
					</div>
	
				</div>
	
			</div>
	
			<div class="col-6">
				<div class="card card-primary card-outline col-12">
					<div class="card-header">
						<h3 class="card-title">발주신청</h3>
	
					</div>
					<div class="card-body p-0" style="font-size: 0.9em; height: 600px;">
						<table class="table table-hover text-nowrap">
							<thead>
								<tr>
									<th class="width20">물품명</th>
	
									<th class="width15">수량</th>
	
									<th class="width15">총금액</th>
									<th class="width10" style="text-align: center;"><input
										type="checkbox"></th>
								</tr>
							</thead>
	
							<tbody>
								<tr>
									<td>세제</td>
									<td>
									<input type="text" name="content" class="form-control" style="width: 50px; height: 30px;">
									</td>
									<td>30000</td>
									<td style="text-align: center;">
									<input type="checkbox">
									</td>
								</tr>
								<tr>
									<td>옷걸이</td>
									<td><input type="text" name="content" class="form-control"
										style="width: 50px; height: 30px;"></td>
	
	
	
									<td>10000</td>
									<td style="text-align: center;"><input type="checkbox"></td>
	
								</tr>
								<tr>
									<td>다리미</td>
									<td><input type="text" name="content" class="form-control"
										style="width: 50px; height: 30px;"></td>
	
	
	
									<td>10000</td>
									<td style="text-align: center;"><input type="checkbox"></td>
	
								</tr>
								<tr>
									<td>옷장</td>
									<td><input type="text" name="content" class="form-control"
										style="width: 50px; height: 30px;"></td>
	
	
	
									<td>10000</td>
									<td style="text-align: center;"><input type="checkbox"></td>
	
	
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card">
	
					<div class="card-body">
						<strong>선택 합계금액</strong> <input 원="" style="width: 100px"
							class="form-control float-right" name="content" type="text">
					</div>
				</div>
				<div class="float-right">
					<button type="button" class="btn btn-primary">발주</button>
	
					<button type="button" class="btn btn-primary">리셋</button>
				</div>
	
			</div>
		</div>
	</div>
	<script type="text/javascript">
		window.onload()=function (){
			$.ajax({
				  url:'<%=request.getContextPath()%>/itemorder/',
				  type:"post",
				  success:function(data){
				
				  },
				  error:function(error){
				  	
				  }
			   });   	
		}
	
	</script>
</body>