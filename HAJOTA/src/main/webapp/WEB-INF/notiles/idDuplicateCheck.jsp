<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 ID 검사하기</title>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/TypeofCss/JW/style.css">

<script type="text/javascript">

	function goCheck() {
		
		var email = document.getElementById("email");
		
		if(!email.value || email.value.trim()=="" ) {
		// 자바스크립트에서 null 은 false 로 인식한다.	
		    alert("이메일을 입력하세요!!");
		    email.value = "";
		    email.focus();
		}
		else {
			var frmIdDuplicateCheck = document.frmIdDuplicateCheck; 
			frmIdDuplicateCheck.action="idDuplicateCheck.go";
			frmIdDuplicateCheck.method="post"
			frmIdDuplicateCheck.submit();	
		}
		
	}// end of goCheck()--------------
	
	
	function setEmail(email) {
		var openerfrm = opener.document.joinFrm;
		// opener 는 팝업창을 열게한 부모창을 말한다.
		// 여기서 부모창은 memberRegisterForm.jsp 회원가입 페이지이다.
		openerfrm.join_email.value = email;
		openerfrm.join_pwd.focus();
		
		self.close();
		// 여기서 self 는 팝업창 자기자신을 말한다.
		// 지금의 self 는 idDuplicateCheck.jsp 페이지 이다.
	}

</script>

</head>
<body style="background-color: #fff0f5;">
<span style="font-size:10pt; font-weight: bold;">${method}</span>	

<c:if test="${method == 'GET'}">
<form name="frmIdDuplicateCheck">
	<table style="width: 95%; height: 90%;">
		<tr>
			<td style="text-align: center;">
					이메일을 입력하세요<br style="line-height: 200%;"/>
					<input type="text" id="email" name="email" size="20" class="box" /><br style="line-height: 300%;"/>
					<button type="button" class="box" onClick="goCheck();">확인</button>
			</td>
		</tr>
	</table>
</form>
</c:if>

<c:if test="${method == 'POST'}">

	<c:if test="${isUseuserid == 0}">
		<br style="line-height: 200%"/>
		<br style="line-height: 200%"/>   
		<div align="center">
			EMAIL로 [<span style="color:red; font-weight: bold;">${email}</span>]를 사용할 수 있습니다.
			<br/><br/><br/>
			<button type="button" onClick="setEmail('${email}');">닫기</button>
		</div>
	</c:if>
	
	<c:if test="${isUseuserid == 1}">
			<br style="line-height: 200%"/>   
			<div align="center">
				<span style="color:red; font-weight: bold;">[${email}]는 이미 사용중입니다.</span>
			<br/>
			
			<form name="frmIdDuplicateCheck" action="idDuplicateCheck.go" method="post">
	          <table style="width: 95%; height: 90%;">
		      <tr>
			     <td style="text-align: center;">
					이메일을 입력하세요<br style="line-height: 200%;"/>
					<input type="text" id="email" name="email" size="20" class="box" /><br style="line-height: 300%;"/>
					<button type="button" class="box" onClick="goCheck();">확인</button>
				 </td>
		      </tr>
	          </table>
            </form>
			</div>
	</c:if>

</c:if>

</body>
</html>





