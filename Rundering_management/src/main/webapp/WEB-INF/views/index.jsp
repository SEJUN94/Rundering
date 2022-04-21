<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if('${loginEmployee.employeeId}'){
		if('${loginEmployee.branchCode}'=='000000'){
			location.href="<%=request.getContextPath() %>/admin/homde";
		}else{
			location.href="<%=request.getContextPath() %>/branch/home";
		}
	}else{
		location.href="<%=request.getContextPath() %>/common/loginform.do";
	}
</script>