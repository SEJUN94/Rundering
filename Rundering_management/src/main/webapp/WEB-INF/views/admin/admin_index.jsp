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
			document.querySelector('iframe[name="ifr"]').src=url;
			

			// HTML5 지원브라우저에서 사용 가능
			if (typeof (history.pushState) == 'function') {
				//현재 주소를 가져온다.
				var renewURL = location.href;
				//현재 주소 중 .부분이 있다면 날려버린다.
				renewURL = renewURL.substring(0, renewURL.indexOf(".") );

				if (menuCode != 'A000000') {
					renewURL += "?menuCode=" + menuCode;
				}
				//페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
				history.pushState(menuCode, null, renewURL);
			} else {
				location.hash = "#" + menuCode;
			}
			
			getNotification();
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
		
	}
	</script>
	
	
</body>
