<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
		<c:if test="${n == 1}">
			alert("호스트 회원탈퇴 성공 !!");
			location.href="<%= request.getContextPath() %>/index.go";       
		</c:if>

		<c:if test="${n != 1}">
			alert("호스트 회원탈퇴 실패 !!");
			javascript:history.back();
		</c:if>			
</script>