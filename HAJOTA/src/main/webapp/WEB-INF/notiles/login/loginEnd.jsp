<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
		<c:if test="${n == 1 && empty url}">
			alert("로그인 성공 !!");
			location.href="<%= request.getContextPath() %>/index.go";       
		</c:if>
		
		<c:if test="${n == -2}">
			alert("탈퇴된 회원 입니다 !!");
			location.href="<%= request.getContextPath() %>/index.go";       
		</c:if>
		
		<c:if test="${n == 0}">
			alert("암호가 틀립니다 !!");
			location.href="<%= request.getContextPath() %>/index.go";
			// 이전 페이지로 이동
		</c:if>
			
		<c:if test="${n == -1}">
			alert("회원가입 부터 먼저 하세요 !!");
			location.href="<%= request.getContextPath() %>/index.go";
			// 이전 페이지로 이동
	</c:if>	
</script>
    