<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>


<body>
	<div class="col-md-12">
		<div class="card card-primary card-outline">
			<div class="card-header">
				<h3 class="card-title">건의사항 작성</h3>
			</div>
			<form action="" method="post">
				<div class="card-body p-0">
					<div class="mailbox-read-info">
						<p style="font-size: 1.3em; margin-bottom: 0;">&nbsp; 제목</p>
						<input type="text" name="title" class="form-control "
							style="border: none;">
					</div>
					<div class="mailbox-read-message">
						<textarea style="border: none; height: 311px; resize: none;"
							class="form-control" rows="10" cols="30" id="" name="content"></textarea>
					</div>
				</div>
			</form>

			<div class="form-group">
				<button class="btn btn-default btn-file" onclick="addFile()" type="button">
					<i class="fas fa-paperclip"></i> Add File +
				</button>
			</div>
			
			<div class="form-group row" id="fileBox">
			  <form role="imageForm" action="upload/picture" method="post" enctype="multipart/form-data">
				<div class="btn btn-default btn-file">
					<i class="fas fa-paperclip">Attachment</i> 
                  
                        <input type="file" name="file" onchange="fileUpload()" >
                    
				</div>
				</form>
				

			</div>
			<div class="card-footer">
				<div class="float-right">
					<button type="button" class="btn btn-primary btn-sm">뒤로가기</button>
					<button type="button" class="btn btn-primary btn-sm">저장</button>
				</div>
			</div>
		</div>
	</div>



<script>

    function addFile(){
        if(document.querySelectorAll("input[name=file]").length>4){
           
            return;
        }
        let fileBox = document.querySelector("#fileBox");
        let fileDiv = document.createElement('div')
        fileDiv.setAttribute('class','btn btn-default btn-file')
        let fileI= document.createElement('i')
        fileI.setAttribute('class','fas fa-paperclip')
        let fileForm=document.createElement('form')
        fileForm.setAttribute('action','upload')
        fileForm.setAttribute('method','post')
        fileForm.setAttribute('enctype','multipart/form-data')
        
        let fileInput = document.createElement('input')
        fileInput.setAttribute('type','file')
        fileInput.setAttribute('name','file')
        fileInput.setAttribute('onchange','fileUpload()')

     
		fileI.innerText="Attachment"
        fileDiv.appendChild(fileI);
        
        console.log(fileDiv.textContent)
        fileDiv.appendChild(fileInput);
        fileForm.appendChild(fileDiv);
        fileBox.appendChild(fileForm);
    
    }

    

</script>
<script>
    function fileUpload(){
        let file= event.target.files[0];
        if(file==null){
            return;
        }
        
        if(file.size>1024*1024*2){
            alert("2mb 이하면 업로드 가능합니다")
        } 
        form=event.target.parentNode.parentNode;
        formData= new FormData(form);
        $.ajax({
		  url:"upload.do",
	      data:formData,
	      type:'post',
	      dataType:"json",
	      processData:false,
	      contentType:false,
	      success:function(data){
	    	  form.children[0].children[0].innerText=data.originalFileName
	    	 											 
	    	  alert("파일이 업로드 되었습니다.");
	      },
	      error:function(error){
	          //alert("현재 사진 업로드가 불가합니다.\n 관리자에게 연락바랍니다.");
	          AjaxErrorSecurityRedirectHandler(error.status);
	      }
	   });
        
    }
    
        
    

</script>





</body>
