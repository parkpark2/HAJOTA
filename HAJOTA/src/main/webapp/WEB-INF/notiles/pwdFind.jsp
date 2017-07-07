<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style type="text/css">
   
  #div_email {
  		width: 70%;
  		height: 15%;
  		margin-bottom: 5%;
  		margin-left: 10%;
  		position: relative;
  }
  
  #div_findResult {
  		width: 70%;
  		height: 15%;
  		margin-bottom: 5%;
  		margin-left: 10%;
  		position: relative;
  }
  
  #div_btnFind {
  		width: 70%;
  		height: 15%;
  		margin-bottom: 5%;
  		margin-left: 10%;
  		position: relative;
  }

</style>

<script type="text/javascript">
$(document).ready(function(){
	
	var method = "${method}";
	var email = "${email}";
	var n = "${n}";
	

	 if(method == "POST" && email != "" ) {
			var email = $("#email").val("${email}");
		}
	
	 
	//
	if(method=="POST" && n==1) {
		$("#div_btnFind").hide();
	}
	else if(method=="POST" && (n==-1 || n==0) ) {
		$("#div_btnFind").show();
	}
	
	
	$("#btnConfirmCode").click(function(){
		
		if( "${certificationCode}" == $("#input_confirmCode").val() ) {
			alert("인증성공 되었습니다.");
			
			var pwdFindFrm = document.pwdFindFrm;
			var email = $("#email").val();
			
			pwdFindFrm.action = "<%= request.getContextPath() %>/pwdConfirm.go";
			pwdFindFrm.method = "GET";   // 단순하게 폼만 띄워주는 것이므로
			pwdFindFrm.submit();
		}
		else {
			alert("인증코드값을 다시 입력하세요.");
			$("#input_confirmCode").val("");
		}
	});	
});


	function pwdFind() {
		var email = $("#email").val();

		if (email.trim() == "") {
			alert("이메일을 입력하세요!!");
		} else {

			var pwdFindFrm = document.pwdFindFrm;
			
			pwdFindFrm.action = "/hajota/pwdFind.go";
			pwdFindFrm.method = "POST";
			pwdFindFrm.submit();
		}
	}


</script>
</head>
<body>
	<form name="pwdFindFrm">
		<div id="div_email"  align="center">
			<span style="color: blue; font-size: 12pt;">이메일</span><br/>
			<input type="email" id="email" name="email" size="15" placeholder="abc@def.com" value="${email}"/> 
		</div>
		<div id="div_btnFind" align="center">
			<button type="button"  onclick="pwdFind();">찾기</button>
		</div>
		
		<div id="div_findResult" align="center">
			<c:if test="${n == 1}">
				<div id="pwdConfirmCodeDiv">
					인증코드가  ${email} 로 발송되었습니다 
					<input type="text" id="input_confirmCode" name="input_confirmCode">
					
					<button type="button" id="btnConfirmCode">인증하기</button>
				</div>
			</c:if>
			
			
			<c:if test="${n == 0}">
				<span style="color: red;"> 사용자 정보가 없습니다</span>
			</c:if>
			
			<c:if test="${n == -1}">
				<span style="color: red;">오류!</span>
			</c:if>
		
		</div>
		
		
		
		
	</form>
</body>
</html>