<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/x-handlebars-template" id="item_list">
		
			<div id="removeItem">
                <div class="card-header">
                   <h2 style="height: 20px;" class="card-title">
						<b>재고 리스트</b>
					</h2>
                    <div class="card-tools">
                        <div class="input-group input-group-sm" >
                        </div>
                    </div>
                </div>
                <div class="card-body table-responsive p-0 mt-0" style="height: 600px;overflow: auto;">
                    <table
                        class="table table-hover text-nowrap card-outline">
                        <thead>
                            <tr>
                                <th style="text-align: center;">물품이름</th>
                                <th style="text-align: center;height: 24px;padding-bottom: 8px;padding-top: 0px;">
                                    <div class="input-group input-group-sm" >
                                        <select class="form-control" style="width: 60px;" name="laundryItemsCode"  id="laundryItemsCode" onchange="list_go(1);">
											{{#each clcodeList}}                                           	 
                                             	<option value="{{comCode}}">{{comCodeNm }}</option>
                                            {{/each}}
                                         </select>
                                     </div>
                                </th>
                                <th style="text-align: center;">물품량</th>
                            </tr>
                        </thead>
                        <tbody>
						{{#each itemList}}
                               <tr>
                               		<td style="text-align: left">{{articlesName}}</td>
                               		<td style="text-align: center;">{{clcodeNm clcode}}</td>
                               		<td style="text-align: right;">{{supplyCount}}({{getEach}})</td>
                               </tr>     
						{{/each}}
                        </tbody>
                    </table>
                </div>
              <div class="card-footer" id="itemPaging" >
			</div>
            </div>
             
         </script>
<script type="text/x-handlebars-template" id="item_pagination-template" >
<nav aria-label="Navigation" id="itemPageItem">
<ul class="pagination justify-content-center m-0">
<li class="paginate_button page-item" onclick="item_numberChange(1)">
   <a href="javascript:item_page_go('{{itempageurl 1}}')" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-double-left'></i>
   </a>
</li>
<li class="paginate_button page-item" onclick="item_numberChange({{#if prev}} {{prevPageNum}} {{/if}})">
   <a href="javascript:item_page_go('{{#if prev}}{{itempageurl prevPageNum}}{{/if}}')" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-left'></i>
   </a>

</li>
{{url}}
{{#each pageNum}}
<li class="paginate_button page-item {{itemsignActive this}}" onclick="item_numberChange({{this}})">
   <a href="javascript: out_page_go('{{itempageurl this}}')" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      {{this}}
   </a>
</li>
{{/each}}

<li class="paginate_button page-item" onclick="item_numberChange({{#if next}}{{nextPageNum}}{{/if}})" >
   <a href="javascript:out_page_go('{{#if next}}{{itempageurl nextPageNum}}{{/if}}')" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-right'></i>
   </a>
</li>
<li class="paginate_button page-item" onclick="item_numberChange({{realEndPage}})">
   <a href="javascript:out_page_go('{{itempageurl realEndPage}}')" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
      <i class='fas fa-angle-double-right'></i>
   </a>
</li>   
</ul>
</nav>
</script>         
         
 
<script >
let item_page=1;





function item_page_go(url){
	if(url==null||url.trim()==""){
		alert("페이지가 없습니다");
		return;
	}
	item_List(url);
} 
function item_numberChange(number){
	item_page=number;
	
	
}
function item_List(pageInfo){
	$.ajax({
		url : pageInfo,
		type : 'get',
		dataType : "json",
		success : function(dataMap) {
			
			
			let source = $("#item_list").html();
			let pageSource = $("#item_pagination-template").html();
			
			let pageTemplate = Handlebars.compile(pageSource); 
			let template = Handlebars.compile(source); 
			
			let pageMaker=dataMap.pageMaker;
			let cri=dataMap.pageMaker.cri;
			let	itemList =dataMap.itemList;
			
			console.log(dataMap);
			
			for(let i of itemList){
				i.getEach=i.each
			}
			
			let pageNumArray = new Array(pageMaker.endPage-pageMaker.startPage+1);
		    for(let i=0; i<pageMaker.endPage-pageMaker.startPage+1;i++){
		        pageNumArray[i]=pageMaker.startPage+i;
	    	}
		  
			
			pageMaker.pageNum=pageNumArray;
   			pageMaker.prevPageNum=pageMaker.startPage-1;
            pageMaker.nextPageNum=pageMaker.endPage+1;
            
            Handlebars.registerHelper({
            	  "itemsignActive":function(pageNum){
            		  
 					 if(pageNum == item_page) return 'active';
 			   }, "itemprettifyDate":function(timeValue){
             	      var dateObj=new Date(timeValue);
             	      var year=dateObj.getFullYear();
             	      var month=dateObj.getMonth()+1;
             	      var date=dateObj.getDate();
             	      return year+"/"+month+"/"+date;
             	},
               "itempageurl":function(pageNum){
            	   return "<%=request.getContextPath()%>/branch/item/itemlist?page="+pageNum;
               },"clcodeNm":function(clcode){
               		for(let i of dataMap.CLCODEList){
               			if(clcode==i.comCode){
               				return i.comCodeNm
               			}
               		}
            	}
            	
			});
            
			let data={
					pageMaker:pageMaker,
					cri:cri,
					itemList:itemList,
					clcodeList:dataMap.CLCODEList
					
			}
			
			let html = template(data);
			let pagehtml = pageTemplate(pageMaker);
			
			$("#appenditem").innerHTML="";
			if($("#removeitem")!=null){
				$("#removeitem").remove()
			}
			if(document.querySelector("#itemPageItem")!=null){
				document.querySelector("#itemPageItem").remove()
			}
			
			$("#appenditem").append(html)
			$("#itemPaging").append(pagehtml);
		},
		error : function(error) {
			AjaxErrorSecurityRedirectHandler(error.status);
		}
	});
}
</script>
 