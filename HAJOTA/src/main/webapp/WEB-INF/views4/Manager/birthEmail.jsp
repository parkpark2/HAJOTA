<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

	<script type="text/javascript">
		<c:if test="${n == 1}">
			alert("메일발송이 완료되었습니다!");
			location.href="<%= request.getContextPath() %>/eventManager.go";       
		</c:if>
	 	
		<c:if test="${n != 1}">
			alert("메일발송이 취소되었습니다!");
			javascript:history.back();
			// 이전 페이지로 이동
		</c:if>
	</script>