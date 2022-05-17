<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>



<body>

<!--이쁜 알럽트창 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>

<script>
	Swal.fire({
		icon: 'success', // 여기다가 아이콘 종류를 쓰면 됩니다.
		title: '회원등록에 성공했습니다.',
		text: '로그인 페이지로 이동합니다.' 
	});
	window.opener.location.href="<%=request.getContextPath()%>/loing";

</script>

</body>