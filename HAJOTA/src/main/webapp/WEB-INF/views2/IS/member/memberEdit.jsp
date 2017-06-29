<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>

</style>

<script type="text/javascript">
 
 	documnent.ready(function(){
 		
 	});
 	
 	
 	
 	function goEdit() {
 		
 		var memberEditFrm = document.memberEditFrm;
 		
 		memberEditFrm.action = "/hajota/memberEditEnd.go";
 		memberEditFrm.method = "get";
 		memberEditFrm.submit();
 	}
    
 	
 	function goSignout() {
 		
 		 var grade = "${sessionScope.loginuser.GRADE}"; 
 		
 		 // 호스트이면
 		 if(grade == 8) {
 		
 			alert("호스트입니다.");
 			
 		var memberEditFrm = document.memberEditFrm;
 		memberEditFrm.action = "/hajota/HostsignOut.go";
 		memberEditFrm.method = "get";
 		memberEditFrm.submit();
 		}
 		
 		// 게스트이면
 		if(grade == 9) {
 			
 			alert("게스트입니다.");
 			
		var memberEditFrm = document.memberEditFrm;
 		memberEditFrm.action = "/hajota/signOut.go";
 		memberEditFrm.method = "get";
 		memberEditFrm.submit();
 		}  
 		
 	}
 	
</script>

<form name="memberEditFrm">

이메일<input name="email" id="email" type="text" placeholder="email을 입력해주세요" value="${sessionScope.loginuser.EMAIL}" /><br/>
비밀번호<input name="pwd" id="pwd" type="password" placeholder="비밀번호를 입력해주세요" /><br/>
비밀번호확인<input type="password" placeholder="비밀번호를 입력해주세요" /><br/>
성<input name="last_name" id="last_name" type="text" placeholder="성을 입력해주세요" value="${sessionScope.loginuser.LAST_NAME}" /><br/>
이름<input name="first_name" id="first_name" type="text" placeholder="이름을 입력해주세요" value="${sessionScope.loginuser.FIRST_NAME}" /><br/>
생일<input name="birthday" id="birthday" type="text" placeholder="생일을 입력해주세요" value="${sessionScope.loginuser.BIRTHDAY}" /><br/>
연락처<input name="tel" id="tel" type="text" placeholder="연락처를 입력해주세요" value="${sessionScope.loginuser.TEL}" /><br/>
등급<input name="grade" id="grade" type="text" value="${sessionScope.loginuser.GRADE}" /><br/>
가입날짜<input name="regidate" id="regidate" type="text" value="${sessionScope.loginuser.REGIDATE}" /><br/>

<button type="button" onclick="goEdit();" >수정하기</button>
<button type="reset" >취소하기</button>
<button type="button" onclick="goSignout('');" >탈퇴하기</button>

</form>







