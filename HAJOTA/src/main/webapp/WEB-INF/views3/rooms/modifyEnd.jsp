<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
		<c:if test="${n == 1}">
			alert("숙소 수정 성공");
			location.href="<%= request.getContextPath() %>/listdetailtest.go?seq_lodge=" + ${seq_lodge};
		</c:if>
		
		<c:if test="${n == 0}">
			alert("숙소 수정 실패!!");
			javascript:history.back();
		</c:if>
</script>
    