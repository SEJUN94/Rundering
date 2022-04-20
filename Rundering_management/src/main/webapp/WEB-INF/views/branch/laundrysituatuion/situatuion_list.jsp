<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<body>
							
	
		<div class="row ml-2 mr-2">
			
			<div class="col-12">
			<div class="card-header" style="padding :10px;">
				<div class=" float-right">
							<div class="input-group input-group-sm float-right ">
								<div class="input-group-sm selectWidth">
									<select class="form-control" name="searchType" id="searchType">
										<option value="tcw">전 체</option>
										<option value="t">제 목</option>
										<option value="w">작성자</option>
										<option value="c">내 용</option>
										<option value="tc">제목+내용</option>
										<option value="cw">작성자+내용</option>
										<option value="tcw">작성자+제목+내용</option>
									</select>
								</div>
								<div class="input-group-sm textWidth">
									<input class="form-control " type="text" name="keyword"
										placeholder="검색어를 입력하세요." value="">
								</div>
								<span class="input-group-append">

									<button class="btn btn-primary" type="button"
										onclick="list_go(1);" data-card-widget="search">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
						</div>
					</div>
					</div>
				<div class="card card-primary card-outline">
					<div class="card-header">
						<h3 class="card-title">세탁 현황 관리</h3>
						<div class="card-tools">
							<div class="input-group input-group-sm">
								<div class="input-group-sm selectWidth">
									<select class="form-control" name="searchType" id="searchType">
										<option value="tcw">전 체</option>
										<option value="t">제 목</option>
										<option value="w">작성자</option>
										<option value="c">내 용</option>
										<option value="tc">제목+내용</option>
										<option value="cw">작성자+내용</option>
										<option value="tcw">작성자+제목+내용</option>
									</select>
								</div>
								<span class="input-group-append">

									<button class="btn btn-primary" type="button"
										onclick="list_go(1);" data-card-widget="search">
										상태변경
									</button>
								</span>
							</div>
						</div>
					</div>


				<table class="table table-hover text-nowrap">
					<thead>
						<tr>
							<th class="width10">주문번호</th>
							<th class="width10">이름</th>
							<th class="width15">주소</th>
							<th class="width40">요청사항</th>
							<th class="width10">세탁물 상태</th>
							<th class="width10">배송예정일</th>
							<th class="width5"><input type="checkbox"></th>

						</tr>
					</thead>
					<tbody>
						<tr class="mouseHover">
							<td>11121</td>
							<td>백관우</td>
							<td>대전 유성구 반석동</td>
							<td class="textCut"
								data-text="얼룩이 뭍어있어요 깨끗하게 딱아주세요asdasdasdasdasdsadasd">얼룩이
								뭍어있어요 깨끗하게 딱아주세요...</td>
							<td>세탁중</td>
							<td>2일</td>
							<td><input type="checkbox" name="" id=""></td>

						</tr>
						<tr class="mouseHover">
							<td>11121</td>
							<td>백관우</td>
							<td>대전 유성구 반석동</td>
							<td class="textCut"
								data-text="얼룩이 뭍어있어요 깨끗하게 딱아주세요asdasdasdasdasdsadasd">얼룩이
								뭍어있어요 깨끗하게 딱아주세요...</td>
							<td>세탁중</td>
							<td>2일</td>
							<td><input type="checkbox" name="" id=""></td>

						</tr>
						<tr class="mouseHover">
							<td>11121</td>
							<td>백관우</td>
							<td>대전 유성구 반석동</td>
							<td class="textCut"
								data-text="얼룩이 뭍어있어요 깨끗하게 딱주세요asdasdasdasdsdsadasd">얼룩이
								뭍어있어요 깨끗하게 딱주세요a...</td>
							<td>세탁중</td>
							<td>2일</td>
							<td><input type="checkbox" name="" id=""></td>

						</tr>
						<tr class="mouseHover">
							<td>11121</td>
							<td>백관우</td>
							<td>대전 유성구 반석동</td>
							<td class="textCut"
								data-text="얼룩이 뭍어있어요 깨끗하게 세요asdasdasdasdasdsadasd">얼룩이
								뭍어있어요 깨끗하게 세요asd...</td>
							<td>세탁중</td>
							<td>2일</td>
							<td><input type="checkbox" name="" id=""></td>

						</tr>
						<tr class="mouseHover">
							<td>11121</td>
							<td>백관우</td>
							<td>대전 유성구 반석동</td>
							<td class="textCut"
								data-text="얼룩이 뭍어있어요하게 딱아주세요asdasdasdasdasdsad">얼룩이 뭍어있어요하게
								딱아주세요asd...</td>
							<td>세탁중</td>
							<td>2일</td>
							<td><input type="checkbox" name="" id=""></td>

						</tr>

					</tbody>
				</table>

				<div class="card-footer">
					<nav aria-label="Contacts Page Navigation">
						<ul class="pagination justify-content-center m-0">
							<li class="page-item"><a class="page-link" href="#"> <i
									class="fas fa-angle-left"></i>
							</a></li>
							<li class="page-item"><a class="page-link" href="#"> <i
									class="fas fa-angle-double-left"></i>
							</a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#"> <i
									class="fas fa-angle-right"></i>
							</a></li>
							<li class="page-item"><a class="page-link" href="#"> <i
									class="fas fa-angle-double-right"></i>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<div class="card ">
						<div class="card-header">
							<h3 class="card-title">요청사항</h3>
							<div class="float-right ">
									<button type="button" class="btn btn-sm btn-primary"
										data-toggle="modal" data-target="#modal-lg" style ="width:  50px">답변</button>
								</div>
						</div>
						<div class="ml-2 mr-2">
							<div class="col-12 float-left">
								<div class="form-group">
									<label for="exampleInputBorder ml-2" id="requestText"
										class="mt-3">얼룩이 뭍어있어요 깨끗하게 세요asdasdasdasdasdsadasd</label>
								</div>
								

							</div>
						</div>
						<div class="modal fade" id="modal-lg" style="display: none;"
							aria-hidden="true">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title">Large Modal</h4>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
									</div>
									<div class="modal-body">
										<p>One fine body…</p>
									</div>
									<div class="modal-footer justify-content-between">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary">Save
											changes</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
   
    let texts= document.querySelectorAll(".textCut");
    
    let textContent = document.querySelector("#requestText");
    for (let i of texts){
        if(i.dataset.text.length>20){
            i.innerHTML=i.dataset.text.substring(0,20)+"..."
        }else{
            i.innerHTML=i.dataset.text
        }
        
        
    }
    let mouseHover = document.querySelectorAll(".mouseHover");
    for(let i of mouseHover){
        i.addEventListener("click",function(){
            textContent.innerHTML=event.target.parentElement.children[3].dataset.text
        })
    }
    
</script>

	<script>
	function statusChange(){
		alert("상태변경 확인 alert");
	}
</script>
</body>
