<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

	<script type="text/javascript">
		<c:if test="${n == 1}">
			alert("수정 성공!!");
			location.href="<%= request.getContextPath() %>/noticeManager.go"; 
		</c:if>
		 
		<c:if test="${n != 1}">
			alert("수정 실패!!");
			location.href="<%= request.getContextPath() %>/noticeManager.go";  
		</c:if>
	</script>



