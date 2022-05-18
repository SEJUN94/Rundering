<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--이쁜 알럽트창 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.1.9/dist/sweetalert2.min.css">

<body>

<!-- 알림 sweetalert2 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/sweetalert2/sweetalert2.all.min.js"></script>

<script>
	Swal.fire({
		icon : 'warning', // 여기다가 아이콘 종류를 쓰면 됩니다.
		title : '해당하는 세탁주문이 없습니다'
	});
	window.close();
	</script>
</body>
