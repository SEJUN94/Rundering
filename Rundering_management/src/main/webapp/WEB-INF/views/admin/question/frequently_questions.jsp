<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="frequentlyList" value="${dataMap.frequentlyList }" />

<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">
<style>
.content-header {
	padding: 10px 30px;
	padding-bottom: 1px;
}
</style>
</head>

<body>
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>자주 묻는 질문(FAQ)</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item active">FAQ</li>
						<li class="breadcrumb-item"><a href="#">Home</a></li>
					</ol>
				</div>
			</div>
		</div>
	</section>

	<div class="col-12">
		<div class="card">
			<div class="card-header">
				<div class="card-tools">
					<div class="input-group input-group-sm pr-3" style="width: 300px;">
						<select class="form-control col-md-4" name="searchType"
							id="searchType">
							<option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제목</option>
						</select> <input class="form-control" type="text" name="keyword"
							placeholder="검색어를 입력하세요." value="" /> <span
							class="input-group-append">
							<button class="btn btn-primary" type="button"
								onclick="list_go(1);" data-card-widget="search">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>
				</div>
			</div>


			<div class="card-body">
				<div class="col-12" id="accordion" style='cursor: pointer;'>
					<c:forEach items="${frequentlyList }" var="faq">
						<div class="card card-default card-outline">
							<a class="d-block w-100 collapsed" data-toggle="collapse"
								href="#abc${faq.faqno }" aria-expanded="false">
								<div class="card-header">
									<div class="row">
										<div class="col-sm-8">
											<h4 class="card-title w-100" id="hi" style="color: black;display:block;">${faq.question }</h4>
										</div>
									</div>
								</div>
							</a>
							<div id="abc${faq.faqno }" class="collapse"
								data-parent="#accordion" style="">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<h4 class="card-title w-100" id="hi1" style="color: black; display:block;">${faq.answer }</h4>
										</div>
										<div class="float-right hi3">
											<button type="button" id="modifyBtn" class="btn btn-warning"
												style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;"
												onclick="modify('${faq.question }','${faq.answer }')" data-toggle="modal" data-target="#modify">수정</button>
											<button type="button" id="removeBtn" class="btn btn-danger"
												style="padding: 0.25rem 0.5rem; font-size: .875rem; line-height: 1.5;"
												onclick="remove_go('${faq.faqno}');">삭제</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="card-footer row">
			<div style="width:900px;"><%@ include file="/WEB-INF/views/admin/question/pagination.jsp"%></div>
			<div><button class="btn btn-primary" data-toggle="modal" data-target="#regist" class="btn btn-primary">등록하기</button></div>
			</div>
		</div>

		<div class="modal fade" id="regist" style="display: none;" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">자주 묻는 질문 등록</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<div>
							<label for="question" style="margin:10px;">질문입력</label> <input type="text" id="q" name='question' class="form-control" value="">
						</div>
						<div>
							<label for="answer" style="margin:10px;">답변입력</label> <input type="text" id="a" 	name='answer' class="form-control" value="">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-replyno onclick="regist_go()" id="insertBtn">등록</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="modify" style="display: none;" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">자주 묻는 질문 수정</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<div>
							<label for="moq" style="margin:10px;">질문입력</label> <input type="text" id="moq" name='question' class="form-control" value="">
						</div>
						<div>
							<label for="moa" style="margin:10px;">답변입력</label> <input type="text" id="moa" name='answer' class="form-control" value="">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-replyno onclick="regist_go()" id="insertBtn">수정</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

					
		
			
			
	
<!-- 알림 sweetalert2 -->
<script	src="<%=request.getContextPath()%>/resources/bootstrap/plugins/sweetalert2/sweetalert2.all.min.js"></script>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>


<script>
var q = document.querySelector('#q');
var a = document.querySelector('#a');

function regist_go() {
	event.preventDefault();	//submit 이벤트를 막아 페이지 리로드를 방지
	 $.ajax({
		url: "<%=request.getContextPath()%>/admin/question/insert",
		data:{
			'question' : q.value,
			'answer' : a.value
			},
		type:'POST',
		success:function(ok){
            if(ok.toUpperCase() == "OK"){
        		Swal.fire({
					icon: 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
					title: '자주묻는 질문 등록완료!',
					text: '자주묻는 질문을 등록하였습니다.'
				});
                setTimeout(function(){location.reload();},2000);
             } else {
                Swal.fire({
                   icon: 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
                   title: '시스템 오류로 반려 할 수 없습니다.'
                });
            }
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}

function modify(question,answer){
	console.log(question);
	console.log(answer);
	var modalQ = document.querySelector('#moq');
	var modalA = document.querySelector('#moa');
	modalQ.value = question;
	modalA.value = answer;
}
	
function modify_go(faqno) {

	
	
	event.preventDefault();	//submit 이벤트를 막아 페이지 리로드를 방지
	 $.ajax({
		url: "<%=request.getContextPath()%>/admin/question/modify",
		data:{
			'faqno' : faqno
			},
		type:'POST',
		success:function(ok){
          if(ok.toUpperCase() == "OK"){
      		Swal.fire({
					icon: 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
					title: '자주 묻는 질문을 삭제했습니다!',
				});
      		  $('#questionmo').removeClass("d-flex");
      		  $('#answermo').removeClass("d-flex");
      		  hi.style.display = 'flex';
              setTimeout(function(){location.reload();},2000);
           } else {
              Swal.fire({
                 icon: 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
                 title: '시스템 오류로 반려 할 수 없습니다.'
              });
          }
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}
function remove_go(faqno) {
	event.preventDefault();	//submit 이벤트를 막아 페이지 리로드를 방지
	 $.ajax({
		url: "<%=request.getContextPath()%>/admin/question/remove",
		data:{
			'faqno' : faqno
			},
		type:'POST',
		success:function(ok){
           if(ok.toUpperCase() == "OK"){
       		Swal.fire({
					icon: 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
					title: '자주 묻는 질문을 삭제했습니다!',
				});
               setTimeout(function(){location.reload();},2000);
            } else {
               Swal.fire({
                  icon: 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
                  title: '시스템 오류로 반려 할 수 없습니다.'
               });
           }
		},
		error:function(error){
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}




</script>
</body>