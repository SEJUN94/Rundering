<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	if('${loginEmployee.employeeId}'){
		if('${loginEmployee.branchCode}'=='000000'){
			location.href="<%=request.getContextPath() %>/admin/index";
		}else{
			location.href="<%=request.getContextPath() %>/branch/index";
		}
	}else{
		location.href="<%=request.getContextPath() %>/common/loginform.do";
	}
</script>