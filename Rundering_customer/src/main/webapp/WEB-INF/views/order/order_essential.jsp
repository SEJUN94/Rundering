<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/customer/src/main/webapp/resources/bootstrap/plugins/sweetalert2/sweetalert2.min.css" />  
</head>

<title>세탁 주문접수</title>

<body>

	<div style="width: 60%; display: flex; flex-direction: column; margin-left: 20%;">

		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<h1>세탁주문</h1>
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

		<div class="card" style="box-shadow: none;">
			<div class="card-header">
				<h3 class="" style="text-align: center; font-size: 1.3rem; font-weight: 400;">연락처 확인</h3>
			</div>
			
			<label for="tel">연락처</label>
			

			<form role="form" class="form-horizontal" action="<%=request.getContextPath() %>/order/detail" method="post">
			
				<div class="card-body col-6" style="margin: auto; margin-top: 25px;">
					<div class="form-group">
						<label for="tel">연락처</label>
						<div class="input-group" style="padding-top: 10px;">
							<div class="input-group" style="padding-right: 0;">
								<input type="tel" class="form-control" id="tel" placeholder="휴대폰번호 숫자만 입력하세요.">
								<div class="input-group-append">
									<button type="button" onclick="tel_verification()" class="btn btn-primary">인증</button>
								</div>
							</div>
						</div>
					</div>
					<div class="form-group" id="verificationCode" style="display: none;">
						<label for="addr">인증번호</label>
						<div class="input-group" style="padding-top: 10px;">
							<input type="text" class="form-control" id="Code" placeholder="인증번호">
							<button type="submit" style="margin-top: 10px;" class="btn btn-primary btn-block">연락처 인증하기</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/sweetalert2/sweetalert2.all.min.js"></script>


<script>


  function tel_verification() {
      let tel = document.getElementById('tel').value;

      let regPhone = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
      if (regPhone.test(tel) === true) {
    	  
    	  //SMS API활용해야함
    	  
     	  document.getElementById("verificationCode").style.display = 'block';
     	  
      }else{
          const Toast = Swal.mixin({
		      toast: true,
		      position: 'center-center',
		      showConfirmButton: false,
		      timer: 1200,
		      timerProgressBar: false,
		      didOpen: (toast) => {
		        toast.addEventListener('mouseenter', Swal.stopTimer)
		        toast.addEventListener('mouseleave', Swal.resumeTimer)
		      }
		    })
		
		    Toast.fire({
		      icon: 'warning',
		      title: '휴대폰번호를 다시 확인해주세요.'
		    });
      }
      
  }
</script>

</body>
