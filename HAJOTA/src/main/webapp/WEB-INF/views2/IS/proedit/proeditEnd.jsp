<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
		<c:if test="${n == 1}">
			alert("정보수정완료!");
			<%-- location.href="<%= request.getContextPath() %>/login/loginform.go"; --%>       
		</c:if>
</script>    