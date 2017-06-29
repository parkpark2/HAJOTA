<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
 
 	documnent.ready(function(){
 		
 	});

 	function signOut() {
 		var signOutFrm = document.signOutFrm;
 		
 		signOutFrm.action = "/hajota/HostsignOutEnd.go";
 		signOutFrm.method = "POST";
 		signOutFrm.submit();
 	}

</script> 	

탈퇴 이유를 선택해주세요.<br/>

<form name="signOutFrm">

<c:if test="${list != null || not empty list}">
<select id="reason_value" name="reason_value">
<c:forEach var="reason" items="${list}">

	<option value="${reason.SEQ_WITHDRAW_REASON}">${reason.WITHDRAW_REASON}</option>

</c:forEach>
 	</select>
</c:if> 	
 	
</form>

<button type="button" onclick="signOut();">탈퇴하기</button>

