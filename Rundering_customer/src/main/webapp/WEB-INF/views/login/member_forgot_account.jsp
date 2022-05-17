<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>


<body>

<!--이쁜 알럽트창 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>

	<div class="login-box" style="margin: auto;">
		<div class="login-logo">
			<img class="logo" style="margin: auto;"
				src="<%=request.getContextPath()%>/resources/images/RunderingMemberLogo.png"
				alt="RunderingMember">
			<!-- <b>회원</b> 로그인 -->
		</div>

		<div class="card">
			<div class="card-body">
				<p class="login-box-msg">
					<font style="vertical-align: inherit;"><font
						style="vertical-align: inherit;">계정을 잊으셨나요?<br>
					</font><font style="vertical-align: inherit;">▼▼아래 정보를 입력해주세요▼▼</font></font>
				</p>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="이름을 입력하세요."
						required id="input_name">

				</div>
				<div class="input-group mb-3" id="email_div">
					<div class="col-9" style="padding-left: 0px;">
						<input type="text" class="form-control" id="email" name="email"
							placeholder="이메일을 입력하세요." required>
						<div class="input-group-append"></div>

					</div>

					<div class="col-3" style="padding-right: 0px;">
						<button type="button" id="mailCheck"
							class="btn btn-primary btn-block" onclick="mailCheckGo()">인증</button>
					</div>
				</div>

				<div class="row">
					<div class="col-12">
						<button type="button" class="btn btn-primary btn-block"
							onclick="idGetEmail()">
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">아이디 확인</font></font>
						</button>
					</div>

				</div>
			</div>

		</div>
	</div>
	<script>
    let email_authKey="";
    let id_check=false;
    let auth_flag=false;
    let checkTag_flag=false;
    let getName="";
    let getEmail="";
    
    function mailCheckGo(){
    	if(id_check==true){
    		return;
    	}
    	
    	if(checkTag_flag==false){
    	let email_div=document.querySelector("#email_div");
    	let parentDiv=document.createElement("div")
    	let authDiv=document.createElement("div");
    	let buttonDiv=document.createElement("div");
    	let authInput=document.createElement("input");
    	let authButton=document.createElement("button");
    	
    	authButton.setAttribute("class","btn btn-primary btn-block")
    	authButton.setAttribute("type","button");
    	authButton.setAttribute("onclick","auth()")
    	authButton.innerText="확인"
    	parentDiv.setAttribute("class","input-group mb-3")
    	parentDiv.setAttribute("id","parentDiv")
    	
		authDiv.setAttribute("class","col-9");
    	authDiv.style["padding-left"]="0px";
    	
    	buttonDiv.setAttribute("class","col-3");
    	buttonDiv.style["padding-right"]="0px";
    	
		authInput.type="text";
		authInput.setAttribute("class","form-control");
		authInput.setAttribute("id","authInput");
		authInput.required="";
		
		buttonDiv.append(authButton);
		
    	authDiv.append(authInput);
    	
    	parentDiv.append(authDiv);
    	parentDiv.append(buttonDiv);
    	
    	email_div.after(parentDiv);
    	
    	checkTag_flag=true;
    	
    	}
    	Swal.fire({
			icon: 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
			title: '이메일 발송.'
		});
    	  
    	$.ajax({
			  url:'<%=request.getContextPath()%>/login/idfindmailcheck',
			  type:"post",
			  data: {
				  email:document.querySelector("#email").value ,
				  name:document.querySelector("#input_name").value
			  },
			  datatype: "JSON",
			  success:function(data){
			  	if(data.check=="false"){
			  		Swal.fire({
						icon: 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
						title: '이름과 이메일에 일치하는 아이디가 없습니다.'
					});
			  		return;
			  	}
			  	if(data.check=="true"){
				
			  		auth_flag=true;
			  	}
				  
				if(auth_flag==true){
			  		document.querySelector("#mailCheck").innerText='재발송';
			  	}
				
			  	getEmail=data.email;
			  	getName=data.name;
			  	
			  	email_authKey=data.authKey
			  },
			  error:function(error){
				  Swal.fire({
						icon: 'error', // 여기다가 아이콘 종류를 쓰면 됩니다.
						title: '서버에러'
					});
			  }
		   });
    }
    
    function auth(){
    	let authVal=document.querySelector("#authInput").value
    	if(!(authVal==email_authKey && auth_flag==true)){
    		Swal.fire({
				icon: 'error', // 여기다가 아이콘 종류를 쓰면 됩니다.
				title: '인증실패'
			});
    		return;
    	}
    	id_check=true;
    	document.querySelector("#parentDiv").remove();
    	Swal.fire({
			icon: 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
			title: '인증성공!'
		});
    } 
    
    function idGetEmail(){
    	if(id_check==false){
    		Swal.fire({
				icon: 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
				title: '인증을 받으세요'
			});
    		return;
    	}
    	$.ajax({
			  url:'<%=request.getContextPath()%>
		/login/idgetemail',
				type : "post",
				data : {
					email : getEmail,
					name : getName
				},
				success : function(data) {
					if (data == "true") {
						Swal.fire({
							icon : 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
							title : '아이디 이메일 발송~~!'
						});
						window.close();
					}
					if (data == "false") {
						Swal.fire({
							icon : 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
							title : '이메일과 이름이 다릅니다'
						});
					}
				},
				error : function(error) {
					Swal.fire({
						icon : 'error', // 여기다가 아이콘 종류를 쓰면 됩니다.
						title : '이메일 발송 실패'
					});
				}
			});

		}
	</script>
</body>


