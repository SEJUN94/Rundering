<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<section class="content register-page">
	<div class="">
		<div class="login-logo">
			<a href=""><b>물품 등록</b></a>
		</div>
		<!-- form start -->
		<div class="card">
			<div class="card-body">
				<form role="form" class="form-horizontal" action="regist"
					method="post" name="registForm" enctype="multipart/form-data">
					<input type="hidden" name="picture">
					<div class="row">
						<div class="input-group col-md-12">
							<div class="col-md-12" style="text-align: center;">
								<div class="goodsPicture" data-id="${orderGoods.articlesCode }"
									id="pictureView"
									style="border: 1px solid green; height: 140px; width: 140px; margin: 0 auto; margin-bottom: 5px;"></div>
								<div class="input-group input-group-sm">
									<label for="inputFile"
										class=" btn btn-warning btn-sm btn-flat input-group-addon">사진변경</label>
									<input id="inputFileName" class="form-control" type="text"
										name="tempPicture" disabled value="${orderGoods.picture }" />
									<input id="picture" class="form-control" type="hidden"
										name="uploadPicture" />
								</div>
							</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="articlesName" class="col-sm-4"> <span
							style="color: red; font-weight: bold;">*</span>상품명
						</label>
						<div class="col-sm-8 input-group-sm">
							<input class="form-control" name="articlesName" type="text"
								id="articlesName">
						</div>
					</div>
					<div class="form-group row">
						<label for="articlesCode" class="col-sm-4"> <span
							style="color: red; font-weight: bold;">*</span>상품코드
						</label>
						<div class="col-sm-8 input-group-sm">
							<input class="form-control" name="articlesCode" type="text"
								id="articlesCode">
						</div>
					</div>

					<div class="form-group row">
						<!-- search bar -->
						<!-- sort num -->
						<label for="clcode" class="col-sm-4"> <span
							style="color: red; font-weight: bold;">*</span>상품분류
						</label>
						<div class="col-sm-8 input-group-sm">
							<select id="clcode" name="clcode" class="form-control">
								<option value="B" ${orderGoods.clcode eq 'B' ? 'selected':'' }>가루세제</option>
								<option value="C" ${orderGoods.clcode eq 'C' ? 'selected':'' }>엑체세제</option>
								<option value="D" ${orderGoods.clcode eq 'D' ? 'selected':'' }>섬유유연제</option>
								<option value="E" ${orderGoods.clcode eq 'E' ? 'selected':'' }>세탁비누</option>
								<option value="F" ${orderGoods.clcode eq 'F' ? 'selected':'' }>세탁보조용품</option>
							</select>
						</div>
					</div>

					<div class="form-group row">
						<label for="price" class="col-sm-4"> <span
							style="color: red; font-weight: bold;">*</span>판매가
						</label>
						<div class="col-sm-8 input-group-sm">
							<input class="form-control" name="price" type="text" id="price">
						</div>
					</div>
					<div class="form-group row">
						<label for="each" class="col-sm-4"> <span
							style="color: red; font-weight: bold;">*</span>단위
						</label>
						<div class="col-sm-5 input-group-sm">
							<input class="form-control" name="each" type="text" id="each"
								style="text-align: right;">
						</div>
						<div class="col-sm-3 input-group-sm">
							<select onchange="list_go(1);" id="each" name="each"
								class="form-control">
								<option value="n" ${orderGoods.each eq 'n' ? 'selected':'' }>개</option>
								<option value="h" ${orderGoods.each eq 'h' ? 'selected':'' }>매</option>
								<option value="g" ${orderGoods.each eq 'g' ? 'selected':'' }>g</option>
								<option value="kg" ${orderGoods.each eq 'kg' ? 'selected':'' }>kg</option>
								<option value="ml" ${orderGoods.each eq 'ml' ? 'selected':'' }>ml</option>
								<option value="l" ${orderGoods.each eq 'l' ? 'selected':'' }>L</option>
							</select>
						</div>

					</div>
					<div class="form-group row">
						<label for="note" class="col-sm-4"> <span
							style="font-weight: bold;">&nbsp;&nbsp;</span>비고
						</label>
						<div class="col-sm-8 input-group-sm">
							<input class="form-control" name="note" type="text" id="note">
						</div>
					</div>

				</form>
				<div class="btn-group float-right">
					<div class="input-group-sm">
						<button type="button" id="sendBtn" class="btn btn-primary btn-sm"
							onclick="regist_go();">등록</button>
					</div>
					&nbsp;&nbsp;
					<div class="input-group-sm">
						<button class="btn btn-danger btn-sm" id="sendBtn" type="button"
							onclick="history.go(-1);">목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<form role="imageForm" action="upload/picture" method="post" 
	  enctype="multipart/form-data">
	<input id="inputFile" name="pictureFile" type="file" class="form-control"
		   onchange="picture_go();"	style="display:none;">
	<input id="oldFile" type="hidden" name="oldPicture" value="" />
	<input type="hidden" name="checkUpload" value="0" />	
</form>

<script>
	function regist_go() {
		var form = document.registForm;
		if (form.articlesName.value == "") {
			alert("상품명은 필수입니다.");
			return;
		}
		if (form.articlesCode.value == "") {
			alert("세탁물품코드는 필수입니다.");
			return;
		}
		if (form.price.value == "") {
			alert("물품가격은 필수입니다.");
			return;
		}
		$.ajax({
			  url:"<%=request.getContextPath()%>/admin/ordergoods/picture",
		      data:formData,
		      type:'post',
		      processData:false,
		      contentType:false,
		      success:function(data){
		    	  //업로드 확인변수 세팅
		          $('input[name="checkUpload"]').val(1);
		          //저장된 파일명 저장.
		          $('input#oldFile').val(data); // 변경시 삭제될 파일명	  
		          $('form[role="form"] input[name="picture"]').val(data);	   
		      },
		      error:function(error){
		    	  AjaxErrorSecurityRedirectHandler(error.status);		
		      }
		 });
		form.submit();
	}
</script>
<script>
	function picture_go(){
	   var form = $('form[role="imageForm"]');
	   var picture = form.find('[id=inputFile]')[0];
		   
	   formData = new FormData($('form[role="imageForm"]')[0]);
	   //이미지 확장자 jpg 확인
	   var fileFormat = picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
		if(!(fileFormat=="JPG" || fileFormat=="JPEG")){
	   		alert("이미지는 jpg/jpeg 형식만 가능합니다.");
	   		picture.value="";      
	   		return;
		} 
	
		//이미지 파일 용량 체크
	   if(picture.files[0].size>1024*1024*5){
	      alert("사진 용량은 1MB 이하만 가능합니다.");
	      picture.value="";
	      return;
	   };
	   //업로드 확인변수 초기화 (사진변경)
	   form.find('[name="checkUpload"]').val(0);	
	   document.getElementById('inputFileName').value=picture.files[0].name;
	   
	   if (picture.files && picture.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				 $('div#pictureView').css({'background-image':'url('+e.target.result+')',
	                 'background-position':'center',
	                 'background-size':'cover',
	                 'background-repeat':'no-repeat'
	                 });
			}
			reader.readAsDataURL(picture.files[0]);
		}
	}

</script>
</body>
</html>