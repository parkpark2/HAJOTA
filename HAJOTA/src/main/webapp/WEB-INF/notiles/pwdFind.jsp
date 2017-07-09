<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
		<div id="div_email" style="border: solid 0px red; " align="center">
			<p style="font-size: 15px;  ">고객님의 이메일 주소를 입력해 주세요.<br/>비밀번호 재설정을 위한 링크를 보내드리도록 하겠습니다.</p>
			
			<br/><br/><span style="margin-left: -30%; font-weight: bold; font-size: 13pt;">이메일</span><br/>
			<input type="text" id="email" name="email" size="20" placeholder="insang@google.com" value="${email}" style="height: 25px;" /> 
		</div>
		<div id="div_btnFind" align="center">
			<button type="button" class="btn btn-primary" onclick="pwdFind();">찾기</button>
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