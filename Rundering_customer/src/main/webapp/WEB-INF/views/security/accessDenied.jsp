<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!--이쁜 알럽트창 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.all.min.js"></script>


<script>
Swal.fire({
	icon : 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
	title : '권한이 없습니다.'
});
	if (window.opener) {
		window.close();
	} else {
		history.go(-1);
	}
</script>