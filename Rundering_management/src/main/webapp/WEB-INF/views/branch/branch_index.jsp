<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>



<title>메인페이지</title>

<head></head>

<body>
	<iframe name="ifr" src="" frameborder="0" style= "width: 100%; height:85vh;"></iframe>
	
	<script>
			
	console.log(history.pushState);
	
		function goPage(url,menuCode){
			
			getNotification();
			
			document.querySelector('iframe[name="ifr"]').src=url;
			

			// HTML5 지원브라우저에서 사용 가능
			if (typeof (history.pushState) == 'function') {
				//현재 주소를 가져온다.
				var renewURL = location.href;
				//현재 주소 중 .부분이 있다면 날려버린다.
				renewURL = renewURL.substring(0, renewURL.indexOf(".") );

				if (menuCode != 'B000000') {
					renewURL += "?menuCode=" + menuCode;
				}
				//페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
				history.pushState(menuCode, null, renewURL);
			} else {
				location.hash = "#" + menuCode;
			}
			
			
		} 
		
	</script>
	
	<script>
	// window.onload() => 콘텐츠 (이미지, CSS, 스크립트 등)를 포함하여 전체 페이지가 로드된 후! 시작 됩니다.
		 window.onload=function(){
			goPage('<%= request.getContextPath() %>${menu.menuUrl}','${menu.menuCode}');
			
		} 
	</script>
	
	<script>
	//알림 가져오기
	function getNotification(){
		$.getJSON("<%=request.getContextPath() %>/notification", function(dataMap){
			displayItems(dataMap.notificationList, dataMap.notificationTypeMap);
		});
	}
	
	// Update the list with the given items
	function displayItems(items,namemap) {
	  const container = document.querySelector('.notificationli');
	  
	  console.log(items.length);
		if(!items.length){
			 container.innerHTML = `
				 <a class="nav-link" data-toggle="dropdown" href="#" aria-expanded="false"> 
					<i class="far fa-bell"></i> 
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" style="left: inherit; right: 0px;">
						<span class="dropdown-item dropdown-header"></span>
			 <div class="dropdown-divider"></div>
					<div class="d-flex justify-content-center text-muted pb-1">
						<span>
							알림 내역이 없습니다.
						</span>
					</div>`;
		} else{		
	  
		  let firsthtml = `<a class="nav-link" data-toggle="dropdown" href="#" aria-expanded="false"> 
								<i class="far fa-bell"></i> 
								<span class="badge badge-warning navbar-badge">${'${items.length}'}</span>
							</a>
								<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" style="left: inherit; right: 0px;">
									<span class="dropdown-item dropdown-header">읽지 않은 알림 ${'${items.length}'}개</span>`;
									
		  let lasthtml = `<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item dropdown-footer">모두 읽음 처리</a>
						  </div>`;
		  container.innerHTML = firsthtml + items.map(item => createHTMLString(item,namemap)).join('') + lasthtml;
		}
	}	
	
	// Create HTML list item from the given data item
	function createHTMLString(item,namemap) {
		let iconClass =  "";
		if(item.ntcnknd == 'NT'){
			iconClass = "fas fa-bullhorn mr-2";
		}else if(item.ntcnknd == 'SG'){
			iconClass = "fas fa-comment-dots mr-2";
		}else if(item.ntcnknd == 'BA'){
			iconClass = "fas fa-building mr-2";
		}else if(item.ntcnknd == 'AS'){
			iconClass = "fas fa-tools mr-2";
		}else if(item.ntcnknd == 'PC'){
			iconClass = "fas fa-tasks mr-2";
		}
		  
	  return `
	 	<div class="dropdown-divider"></div>
		<a href="${'${item.ntcnclickhourUrl}'}" class="dropdown-item">
			<i class="${'${iconClass}'}"></i>
			 새 ${'${namemap[item.ntcnknd]}'} <span class="float-right text-muted text-sm">${'${item.occrrncdehour}'}</span>
		</a>
	    `;
	}


	</script>
	
	
</body>
