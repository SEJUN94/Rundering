<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--이쁜 알럽트창 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">


<script type="text/x-handlebars-template" id="reply-template">
	<section class="content" id="replyRemoveTag">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
		{{#replyList}}
					<div class="timeline" style="margin:0px">
							<div style="margin-right:0px">
								<i class="fas fa-user bg-{{replyRegister memberno}}"></i>
								<div class="timeline-item" style="margin-right:0px;">
									<span class="time" style="padding:0px"><i class="fas fa-clock"></i> {{prettifyDate registDate}}
						
									<button class="btn btn-sm btn-warning" onclick="replyModifyModal()" data-toggle="modal" data-target="#modal-modify"  data-ordermemberno="{{orderMemberNo}}" data-replyno="{{replyno}}" data-replynoseq="{{replynoSeq}}" data-memberno="{{memberno}}" data-replycontent="{{replyContent}}"  >수정</button>
									<button class="btn btn-sm btn-danger" data-ordermemberno="{{orderMemberNo}}" data-replyno="{{replyno}}" data-replynoseq="{{replynoSeq}}" data-memberno="{{memberno}}" onclick="replyRemove()">삭제</button>
									</span>
									 {{replyContent}}
								</div>
						   </div>
					</div>
		{{/replyList}}
			 </div>
		  </div>
		</div>
	</section>
</script>

	<!-- 알림 sweetalert2 -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/sweetalert2/sweetalert2.all.min.js"></script>

<script >

function replyList(replyNo,orderMemberNo){
	   $.ajax({
	        url:"<%=request.getContextPath()%>/branch/reply/list",
	        type:"get",
	        data:{
	        	replyno:replyNo,
	        },
	        dataType:"json",
	        success:function(dataMap){
	        	let source = $("#reply-template").html(); 
	        	let template = Handlebars.compile(source);
	        	let replyList = new Array() ;
	        	for(let i of dataMap.replyList){
	        		i.orderMemberNo=orderMemberNo;
	        		replyList.push(i)
	        	}
	        	
				let data = {
						replyList:replyList	
				}
				Handlebars.registerHelper({
					   "prettifyDate":function(timeValue){
					      var dateObj=new Date(timeValue);
					      var year=dateObj.getFullYear();
					      var month=dateObj.getMonth()+1;
					      var date=dateObj.getDate();
					      return year+"/"+month+"/"+date;
					   },
					   "replyRegister":function(writer){
						   if(writer==orderMemberNo){
							   return 'yellow';
						   }
						   return 'gray'
					   }
					});
	        	let html = template(data);
	        	if($('#replyRemoveTag')!=null){
	        		$('#replyRemoveTag').remove();	
	        	}
				
	        	$('#replyTag').append(html);
	        },
	        error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
			}
	    }); 
	
	//주문 회원번호와 댓글 작성 회원번호가 다를시 작성자는 직원이란걸 유추할수 있다
}
</script>

<script>
function registReply(){
    let replyContent= document.querySelector("#replyContent").value;
    let replyno =  event.target.dataset.replyno
    let memberNo =  event.target.dataset.memberno
    if(replyno==null||replyno==""){
    	return;
    }
    if(replyContent==null || replyContent.trim()==""){
        return
    }
     $.ajax({
        url:"<%=request.getContextPath()%>/branch/reply/regist",
        type:"post",
        data:{
        	replyno:replyno,
        	replyContent:replyContent
        },
        success:function(data){
        	$("#replyContent").val("");
        	$('#modal-lg').modal('hide');
        	replyList(replyno,memberNo);
        	Swal.fire({
				icon : 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
				title : '답변 등록'
			});
        },
        error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
    }); 
}
</script>
<script>
function replyModifyModal(){
	let btn= document.querySelector("#modifyBtn");
	btn.dataset.replyno=event.target.dataset.replyno;
	btn.dataset.replynoseq=event.target.dataset.replynoseq;
	document.querySelector("#replyModifyContent").value=event.target.dataset.replycontent;
	btn.dataset.ordermemberno=event.target.dataset.ordermemberno;
	//console.log(btn);
}
</script>

<script>
function replyModify(){
	//data-replyno="{{replyno}}" data-replynoseq={{replynoSeq}} data-replycontent=
	let replyno=event.target.dataset.replyno;
	let replynoSeq=event.target.dataset.replynoseq;
	let memberNo=event.target.dataset.ordermemberno;
	let replyContent= document.querySelector("#replyModifyContent").value;
	
	$.ajax({
        url:"<%=request.getContextPath()%>/branch/reply/modify",
        type:"post",
        data:{
        	replyno:replyno,
        	replynoSeq:replynoSeq,
        	replyContent:replyContent
        },
        success:function(data){
        	$("#replyModifyContent").val("");
        	$('#modal-modify').modal('hide');
        	replyList(replyno,memberNo);
        	Swal.fire({
				icon : 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
				title : '수정 등록'
			});
        },
        error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
    }); 
}
function replyRemove(){
	//console.log(event.target)
	let replyno=event.target.dataset.replyno
	let replynoSeq=event.target.dataset.replynoseq
	let memberNo=event.target.dataset.ordermemberno
	
	$.ajax({
        url:"<%=request.getContextPath()%>/branch/reply/remove",
        type:"post",
        data:{
        	replyno:replyno,
        	replynoSeq:replynoSeq
        },
        success:function(data){
        	Swal.fire({
				icon : 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
				title : '답변 삭제'
			});
        	replyList(replyno,memberNo);
        },
        error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
    }); 
	
}

</script>
