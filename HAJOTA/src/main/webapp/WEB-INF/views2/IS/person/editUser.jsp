<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>

</style>

<script type="text/javascript">
 
 	documnent.ready(function(){
 		
 	});
 	
 	function goEdit() {
 		
 		var editUserFrm = document.editUserFrm;
 		
 		editUserFrm.action = "/hajota/editUserEnd.go";
 		editUserFrm.method = "get";
 		editUserFrm.submit();
 	}
    
 	function goSignout() {
 		
 		var editUserFrm = document.editUserFrm;
 		
 		editUserFrm.action = "/hajota/signOut.go";
 		editUserFrm.method = "get";
 		editUserFrm.submit();
 	}
 	
</script>

<form name="editUserFrm">

이메일<input name="guest_email" id="guest_email" type="text" placeholder="Enter email" value="${sessionScope.loginuser.GUEST_EMAIL}" /><br/>
비밀번호<input name="pwd" id="pwd" type="password" placeholder="Enter password 1" /><br/>
비밀번호확인<input type="password" placeholder="Enter password 2" /><br/>
성<input name="last_name" id="last_name" type="text" placeholder="Enter last_name" value="${sessionScope.loginuser.LAST_NAME}" /><br/>
이름<input name="first_name" id="first_name" type="text" placeholder="Enter first_name" value="${sessionScope.loginuser.FIRST_NAME}" />

<button type="button" onclick="goEdit();" >수정하기</button>
<button type="reset" >취소하기</button>
<button type="button" onclick="goSignout();" >탈퇴하기</button>

</form>


