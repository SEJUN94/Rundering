<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/x-handlebars-template" id="out_list" >
	<div class="card  p-0" style="padding-bottom: 10px;margin-bottom: 10px;" id="removeOut">
                <div class="card-header">
                   <h2 style="height: 20px;" class="card-title">
						<b>출고 리스트</b>
					</h2>
                    <div class="card-tools">
                        <div class="input-group input-group-sm" >
                            <select class="form-control" name="laundryItemsCode"
                                id="laundryItemsCode" onchange="list_go(1);">
                                <option value="asd">asdaadas</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="card-body table-responsive p-0 mt-0" style="height: 245px;overflow: auto;">
                    <table
                        class="table table-hover text-nowrap card-outline">
                        <thead>
                            <tr>
                                <th style="text-align: center;">이름</th>
                                <th style="text-align: center;height: 24px;padding-bottom: 8px;padding-top: 0px;">
                                    	출고일
                                </th>
                                <th style="text-align: center;">출고량</th>
                                <th style="text-align: center;"> 취소</th>
                            </tr>
                        </thead>
                        <tbody>
                                  {{#each itemOutList}}
                                    <tr>
                                        <td >{{outlaundryArticlesName articlesCode}} </td>
                                        <td style="text-align: center">
                                        	{{outprettifyDate outDate}}
                                        </td>
                                        <td style="text-align: right;">{{itemcount }}({{outlaundryArticlesEach articlesCode}})</td>
                                        <td style="padding-top: 10px;padding-bottom: 5px; text-align:center;">
											<button type="button" class="btn btn-sm btn-warning" data-outitemcode="{{outItemCode}}" onclick="cancle()">취소 </button>
										</td>
                                    </tr>
								 {{/each}}
                        </tbody>
                    </table>
                </div>
              <div class="card-footer" id="outPaging">
			</div>
			</div>
</script>
<script type="text/x-handlebars-template" id="out_pagination-template" >
<nav aria-label="Navigation" id="OutpageItem">
<ul class="pagination justify-content-center m-0">
<li class="paginate_button page-item" onclick="out_numberChange(1)">
   <a href="javascript:out_page_go('{{outpageurl 1}}')" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-double-left'></i>
   </a>
</li>
<li class="paginate_button page-item" onclick="out_numberChange({{#if prev}} {{prevPageNum}} {{/if}})">
   <a href="javascript:out_page_go('{{#if prev}}{{outpageurl prevPageNum}}{{/if}}')" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-left'></i>
   </a>

</li>
{{url}}
{{#each pageNum}}
<li class="paginate_button page-item {{outsignActive this}}" onclick="out_numberChange({{this}})">
   <a href="javascript: out_page_go('{{outpageurl this}}')" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      {{this}}
   </a>
</li>
{{/each}}

<li class="paginate_button page-item" onclick="out_numberChange({{#if next}}{{nextPageNum}}{{/if}})" >
   <a href="javascript:out_page_go('{{#if next}}{{outpageurl nextPageNum}}{{/if}}')" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-right'></i>
   </a>
</li>
<li class="paginate_button page-item" onclick="out_numberChange({{realEndPage}})">
   <a href="javascript:out_page_go('{{outpageurl realEndPage}}')" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-double-right'></i>
   </a>
</li>   
</ul>
</nav>
</script>

<script >
let out_page=1;

function cancle(){
	let outItemCode= event.target.dataset.outitemcode;
	console.log(outItemCode)
	
	$.ajax({
		url : '<%=request.getContextPath()%>/branch/item/outcancel',
		type : 'get',
		data:{
			outItemCode:outItemCode,
			page:out_page
		},
		success : function(data) {
			console.log(data);
			out_page=data;
			out_page_go("<%=request.getContextPath()%>/branch/item/outlist?page="+out_page);
		},
		error : function(error) {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}



function out_page_go(url){
	if(url==null||url.trim()==""){
		alert("페이지가 없습니다");
		return;
	}
	out_List(url);
} 
function out_numberChange(number){
	out_page=number;
	
	
}
function out_List(pageInfo){
	$.ajax({
		url : pageInfo,
		type : 'get',
		dataType : "json",
		success : function(dataMap) {
			
			
			let source = $("#out_list").html();
			let pageSource = $("#out_pagination-template").html();
			
			let pageTemplate = Handlebars.compile(pageSource); 
			let template = Handlebars.compile(source); 
			
			let pageMaker=dataMap.pageMaker;
			let cri=dataMap.pageMaker.cri;
			let	itemOutList =dataMap.itemOutList;
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
            	  "outsignActive":function(pageNum){
            		  
 					 if(pageNum == out_page) return 'active';
 			   }, "outprettifyDate":function(timeValue){
             	      var dateObj=new Date(timeValue);
             	      var year=dateObj.getFullYear();
             	      var month=dateObj.getMonth()+1;
             	      var date=dateObj.getDate();
             	      return year+"/"+month+"/"+date;
             	},
               "outpageurl":function(pageNum){
            	   return "<%=request.getContextPath()%>/branch/item/outlist?page="+pageNum;
               },"outlaundryArticlesName":function(articlesCode){
            		return laundryArticlesMap[articlesCode].articlesName;
            	},"outlaundryArticlesEach":function(articlesCode){
            		return laundryArticlesMap[articlesCode].each;
            	}
			});
            
			let data={
					pageMaker:pageMaker,
					cri:cri,
					itemOutList:itemOutList,
					laundryArticlesMap:laundryArticlesMap,
			}
			
			let html = template(data);
			let pagehtml = pageTemplate(pageMaker);
			
			$("#appendOut").innerHTML="";
			if($("#removeOut")!=null){
				$("#removeOut").remove()
			}
			if(document.querySelector("#OutpageItem")!=null){
				document.querySelector("#OutpageItem").remove()
			}
			
			$("#appendOut").append(html)
			$("#outPaging").append(pagehtml);
		},
		error : function(error) {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}
</script>

