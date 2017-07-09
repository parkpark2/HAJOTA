<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

	<script type="text/javascript">
		<c:if test="${n == 1}">
			alert("글쓰기 성공!!");
			location.href="<%= request.getContextPath() %>/noticeManager.go"; 
		</c:if>
		
		<c:if test="${n != 1}">
			alert("글쓰기 실패!!");
			location.href="<%= request.getContextPath() %>/noticeManager.go";  
		</c:if>
	</script>



