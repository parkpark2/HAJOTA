<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
    	
		function goRegister() {
		
		var flagBool = false;
		
		$(".requiredInfo").each(function(){
			var data = $(this).val().trim();
			if(data.length == 0) {
				flagBool = true;
				// for 문에서의 continue 와 동일한 기능을 하는 것이
				// each(); 내에서는 return true; 이고
				// for 문에서의 break 와 동일한 기능을 하는 것이
				// each(); 내에서는 return false; 이다.
				return false;  // 마치 for문에서의 break; 와 동일한 기능임.
			}
		});
		
		 if(flagBool) {
			alert("필수입력란은 모두 입력하셔야 합니다.");
			event.preventDefault();	// click event 를 작동치 못하도록 한다.
		}
		else if(!$("#agree").is(":checked")) {  // $(":checked") 은 All checked input elements 을 말한다. 참조 w3school jQuery Selectors 볼것!!
			alert("이용약관에 동의하셔야 합니다.");
		//	alert($("#agree").is(":checked"));
			event.preventDefault(); // click event 를 작동치 못하도록 한다.
		}
		else {
		    var registerFrm = document.registerFrm;
		    registerFrm.method="post";
		    registerFrm.action="/hajota/memberRegisterFormEnd.go";
		    registerFrm.submit();
		} 
		
	}// end of goRegister(event)---------------------
	
</script>

<form name="registerFrm">

회원가입</br>
이메일<input type="text" name="email" id="email" required placeholder="abc@def.com" /></br>
비밀번호<input type="password" name="pwd" id="pwd" required /></br>
성<input type="text" name="last_name" id="last_name" required /></br>
이름<input type="text" name="first_name" id="first_name" required /></br>
생년월일<input type="text" name="birthday" id="birthday" required placeholder="00/00/00" /></br>
연락처<input type="text" name="tel" id="tel" required placeholder="01012345678" /></br>
가능한 언어를 선택해주세요 (중복가능)<br/>
	<label for="korea">한국어</label><input type="checkbox" name="seq_language_type" id="korea" value="1" />
	<label for="china">중국어</label><input type="checkbox" name="seq_language_type" id="china" value="2" />
	<label for="japan">일본어</label><input type="checkbox" name="seq_language_type" id="japan" value="3" />
	<label for="eng">영어</label><input type="checkbox" name="seq_language_type" id="eng" value="4" /></br>

<label for="agree">이용약관에 동의합니다</label>&nbsp;<input type="checkbox" id="agree" />

<button type="button" onclick="goRegister();"><img src="<%= request.getContextPath() %>/resources/images/ISJW/join.png" /></button>

</form>








