<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!--이쁜 알럽트창 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">

<script type="text/x-handlebars-template" id="insert_list" >
	<div class="card  p-0" style="padding-bottom: 10px;margin-bottom: 10px;" id="removeInsert">
                <div class="card-header">
                   <h2 style="height: 20px;" class="card-title">
						<b>입고</b>
					</h2>
                    <div class="card-tools">
                        <div class="input-group input-group-sm" >
                           <input type="date" onchange="registChangeDate('1')" id="todayDate" value="{{cri.date}}">
                        </div>
                    </div>
                </div>
                <div class="card-body table-responsive p-0 mt-0" style="height: 245px;overflow: auto;">
                    <table
                        class="table table-hover text-nowrap card-outline">
                        <thead>
                            <tr>
                                <th style="text-align: center;" onload="textLength(2)">물품이름</th>
                                <th style="text-align: center;height: 24px;padding-bottom: 8px;padding-top: 0px;">
                                    	입고일
                                </th>
                                <th style="text-align: center;">입고량</th>
                                <th>발주번호</th>
                            </tr>
                        </thead>
                        <tbody>
                                  {{#each itemInsertList}}
                                    <tr>
                                        <td style="max-width:120px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">{{laundryArticlesName articlesCode}} </td>
                                        <td style="text-align: center">
                                        	{{prettifyDate insertDate}}
                                        </td>
                                        <td style="text-align: right;">{{itemCount }}({{laundryArticlesEach articlesCode}})</td>
                                        <td>{{orderNo}}</td>
                                    </tr>
								 {{/each}}
                        </tbody>
                    </table>
                </div>
              <div class="card-footer" id="registPaging">
			</div>
			</div>
</script>
<script type="text/x-handlebars-template" id="pagination-template" >
<nav aria-label="Navigation" id="pageItem">
<ul class="pagination justify-content-center m-0">
<li class="paginate_button page-item" onclick="numberChange(1)">
   <a href="javascript:page_go('{{pageurl 1}}')" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-double-left'></i>
   </a>
</li>
<li class="paginate_button page-item" onclick="numberChange({{#if prev}} {{prevPageNum}} {{/if}})">
   <a href="javascript:page_go('{{#if prev}}{{pageurl prevPageNum}}{{/if}}')" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-left'></i>
   </a>

</li>
{{url}}
{{#each pageNum}}
<li class="paginate_button page-item {{signActive this}}" onclick="numberChange({{this}})">
   <a href="javascript: page_go('{{pageurl this}}')" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      {{this}}
   </a>
</li>
{{/each}}

<li class="paginate_button page-item" onclick="numberChange({{#if next}}{{nextPageNum}}{{/if}})" >
   <a href="javascript:page_go('{{#if next}}{{pageurl nextPageNum}}{{/if}}')" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-right'></i>
   </a>
</li>
<li class="paginate_button page-item" onclick="numberChange({{realEndPage}})">
   <a href="javascript:page_go('{{pageurl realEndPage}}')" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-double-right'></i>
   </a>
</li>   
</ul>
</nav>
</script>

	<!-- 알림 sweetalert2 -->
	<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/sweetalert2/sweetalert2.all.min.js"></script>


<script >
let page= 1;

function registChangeDate(page){
	let date = event.target.value
	registList("<%=request.getContextPath()%>/branch/item/insertList?page="+page+"&date="+date)
}


function page_go(url){
	if(url==null||url.trim()==""){
		Swal.fire({
			icon : 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
			title : '페이지가 없습니다.'
		});
		return;
	}
	registList(url);
} 
function numberChange(number){
	page=number;
}
function registList(pageInfo){
	$.ajax({
		url : pageInfo,
		type : 'get',
		dataType : "json",
		success : function(dataMap) {
			
			
			let source = $("#insert_list").html();
			let pageSource = $("#pagination-template").html();
			
			let pageTemplate = Handlebars.compile(pageSource); 
			let template = Handlebars.compile(source); 
			
			let pageMaker=dataMap.pageMaker;
			let cri=dataMap.pageMaker.cri;
			let	itemInsertList =dataMap.itemInsertList;
			let laundryArticlesList=dataMap.laundryArticlesList;
			let laundryArticlesMap ={}
			
			console.log(dataMap);
			for(let i of laundryArticlesList){
				laundryArticlesMap[i.articlesCode]=i;
				
			}
			console.log(laundryArticlesMap)
			
			let pageNumArray = new Array(pageMaker.endPage-pageMaker.startPage+1);
		    for(let i=0; i<pageMaker.endPage-pageMaker.startPage+1;i++){
		        pageNumArray[i]=pageMaker.startPage+i;
	    	}
		
			
			pageMaker.pageNum=pageNumArray;
   			pageMaker.prevPageNum=pageMaker.startPage-1;
            pageMaker.nextPageNum=pageMaker.endPage+1;
            
            Handlebars.registerHelper({
			   "signActive":function(pageNum){
				   	
					 if(pageNum == page) return 'active';
			   },
               "pageurl":function(pageNum){
            	   return "<%=request.getContextPath()%>/branch/item/insertList?page="+pageNum;
               },"prettifyDate":function(timeValue){
            	      var dateObj=new Date(timeValue);
            	      var year=dateObj.getFullYear();
            	      var month=dateObj.getMonth()+1;
            	      var date=dateObj.getDate();
            	      return year+"/"+month+"/"+date;
            	},"laundryArticlesName":function(articlesCode){
            		return laundryArticlesMap[articlesCode].articlesName;
            	},"laundryArticlesEach":function(articlesCode){
            		return laundryArticlesMap[articlesCode].each;
            	}
			});
            
			let data={
					pageMaker:pageMaker,
					cri:cri,
					itemInsertList:itemInsertList,
					laundryArticlesMap:laundryArticlesMap,
			}
			
			let html = template(data);
			let pagehtml = pageTemplate(pageMaker);
			
			$("#appenRgist").innerHTML="";
			if($("#removeInsert")!=null){
				$("#removeInsert").remove()
			}
			if(document.querySelector("#pageItem")!=null){
				document.querySelector("#pageItem").remove()
			}
			
			$("#appenRegist").append(html)
			$("#registPaging").append(pagehtml);
			
			let todayDate = document.querySelector("#todayDate");
			todayDate.max = new Date().toISOString().split("T")[0];
		},
		error : function(error) {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}
</script>

