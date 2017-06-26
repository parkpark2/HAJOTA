<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
 
 	$(document).ready(function(){
 		
 	});
 	
 	function goLogin() {
 		
 		var loginFrm = document.loginFrm;
 		
 		 loginFrm.action = "/hajota/loginEnd.go";
	     loginFrm.method = "post";
		 loginFrm.submit();
 	}
    	  	 
</script>

<form name="loginFrm">
이메일<input type="text" name="guest_email" id="guest_email" /> <br/>
비밀번호<input type="password" name="pwd" id="pwd" /> <br/>
<button type="button" onclick="goLogin()">로그인</button>
</form>



	
	





  