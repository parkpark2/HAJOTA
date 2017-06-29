<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
 
 	documnent.ready(function(){
 		
 	});

 	function bye() {
 		var byeFrm = document.byeFrm;
 		
 		byeFrm.action = "/hajota/HostsignOutEnd.go";
 		byeFrm.method = "POST";
 		byeFrm.submit();
 	}

</script> 	

탈퇴 이유를 선택해주세요.<br/>

<form name="byeFrm">

<c:if test="${list != null || not empty list}">
<select id="host_reason_value" name="host_reason_value">
<c:forEach var="host_reason" items="${list}">

	<option value="${host_reason.SEQ_HOST_WITHDRAW_REASON}">${host_reason.WITHDRAW_REASON}</option>
	

</c:forEach>
 	</select>
</c:if> 	
 	
</form>

<button type="button" onclick="bye();">탈퇴하기</button>

