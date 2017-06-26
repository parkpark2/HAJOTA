<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<style>

</style>

<script type="text/javascript">
	$(document).ready(function(){
		$(".error").hide();
				
		$(".requiredInfo").each(function(){
			$(this).blur(function(){
				var data = $(this).val().trim(); 
				if(data.length == 0) {
				    $(this).parent().find('.error').show();  
				    $(":input").attr('disabled', true).addClass('bgcol'); 
				    $(this).attr('disabled', false).removeClass('bgcol');
				    
				    $("#btnRegister").attr('disabled', true);
				    
				    $(this).focus();
				}
				else {
					$(this).parent().find('.error').hide();
	                $(":input").attr('disabled', false).removeClass('bgcol'); 
				    $("#btnRegister").attr('disabled', false);
				}
			});
		});// end of $(".requiredInfo").each();
		
		
		$("#pwd").blur(function(){
    		
    		var pwd = $(this).val(); 
    		
    		var pattern = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
    		// 숫자/문자/특수문자/ 포함 형태의 8~15자리 이내의 암호 정규식 
    		
    		var bool = pattern.test(pwd);
    		
    		if(!bool) {
    		 // $(this).parent().find('.error').show();
    			$(this).next().show();
    			$(":input").attr('disabled', true).addClass('bgcol'); 
			    $(this).attr('disabled', false).removeClass('bgcol');
			    
			    $("#btnRegister").attr('disabled', true);
			    
			    $(this).val("");
			    $(this).focus();
    		}
    		else if(bool) {
   			 // $(this).parent().find('.error').hide();
    			$(this).next().hide();
    			$(":input").attr('disabled', false).removeClass('bgcol'); 
			    
			    $("#btnRegister").attr('disabled', false);
    		}
    		
    	});// end of $("#passwd").blur();
    	
    	
    	$("#pwdcheck").blur(function(){ 
    		
    		var pwd = $("#pwd").val();
    		var pwdcheck = $("#pwdcheck").val();
    		
    		if(pwd != pwdcheck) {
    		 // $(this).parent().find('.error').show();
    			$(this).next().show();
    			$(":input").attr('disabled', true).addClass('bgcol'); 
			    $(this).attr('disabled', false).removeClass('bgcol');
			    $("#pwd").attr('disabled', false).removeClass('bgcol');
			    
			    $("#btnRegister").attr('disabled', true);
			    
			    $("#pwd").val("");
			    $(this).val("");
			    $(this).focus();
    		}
    		else{
    		 // $(this).parent().find('.error').hide();
    			$(this).next().hide(); 
                $(":input").attr('disabled', false).removeClass('bgcol'); 
			    $("#btnRegister").attr('disabled', false);
    		}
    		
    	});// end of $("#passwdCheck").blur();
    	
    	
		$("#email").blur(function(){
			
    		var email = $("#email").val();
    		
    		var pattern = new RegExp(/^[0-9a-zA-Z]([\-.\w]*[0-9a-zA-Z\-_+])*@([0-9a-zA-Z][\-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9}$/g); 
    		// 이메일을 검사하는 정규표현식 
    		
    		var bool = pattern.test(email);
    		
    		if(!bool) {
    		 // $(this).parent().find('.error').show();	
    			$(this).next().show();
    			$(":input").attr('disabled', true).addClass('bgcol'); 
			    $(this).attr('disabled', false).removeClass('bgcol');
			    
			    $("#btnRegister").attr('disabled', true);
			    
			    $(this).val("");
			    $(this).focus();
    		}
    		else {
    		//	$(this).parent().find('.error').hide();	
    			$(this).next().hide();
    			$(":input").attr('disabled', false).removeClass('bgcol'); 
			    
			    $("#btnRegister").attr('disabled', false);
    		}
    		
    	});// end of $("#email").blur()-----------------
    	

/*    	
    	$("#idcheck").click(function(){
    	
    		// 팝업창 띄우기
    		var url = "idDuplicateCheck.do";
    		
    		window.open(url,"idcheck",
            "left=500px, top=100px, width=300px, height=200px, menubar=no, status=no, scrollbars=yes ");
    		
    		// 기본적으로 아무런 조건없이 
    		// 그냥 어떤 창을 띄우면 method 가 
    		// GET 방식으로 움직인다. 
    	});
*/
    	
});// end of $(document).ready()----------------
	
	
	
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
		    var frm = document.registerFrm;
			frm.method="post";
			frm.action="/hajota/memberRegisterFormEnd.go";
   			frm.submit();
		}
		
	}// end of goRegister(event)---------------------
	
</script>

<div class="container">
  <thead>
	<tr>
		<th colspan="2" id="th"><h2>회원가입 (<span style="font-size: 10pt; font-style: italic;"><span class="star">*</span>표시는 필수입력사항</span>)</h2></th><br/>
		<button type="button">f 페이스북 계정으로 가입하기</button>
	</tr>
	</thead>

<div align="center">
<form name="registerFrm">

<table id="tblMemberRegister">
	
	<tbody>
	<tr>
		<td style="width: 20%; font-weight: bold;">이메일&nbsp;<span class="star">*</span></td>
		<td style="width: 80%; text-align: left;">
		    <input type="text" name="guest_email" id="guest_email" class="requiredInfo" required placeholder="abc@def.com" /> 
			<span class="error">이메일은 필수입력 사항입니다.</span>
		</td>
	</tr>
	<tr>
		<td style="width: 20%; font-weight: bold;">비밀번호&nbsp;<span class="star">*</span></td>
		<td style="width: 80%; text-align: left;"><input type="password" name="pwd" id="pwd" class="requiredInfo" required />
		</td>
	</tr>
	<tr>
		<td style="width: 20%; font-weight: bold;">first_name&nbsp;<span class="star">*</span></td>
		<td style="width: 80%; text-align: left;"><input type="text" name="first_name" id="first_name" class="requiredInfo" placeholder="길동" /> 
		</td>
	</tr>
	<tr>
		<td style="width: 20%; font-weight: bold;">last_name&nbsp;<span class="star">*</span></td>
		<td style="width: 80%; text-align: left;"><input type="text" name="last_name" id="last_name" class="requiredInfo" placeholder="홍" /> 
		</td>
	</tr>
		<tr>
		<td style="width: 20%; font-weight: bold;">생년/월/일&nbsp;<span class="star">*</span></td>
		<td style="width: 80%; text-align: left;"><input type="text" name="birthday" id="birthday" class="requiredInfo" placeholder="00/00/00" /> 
		</td>
	</tr>

	<tr>
		<td colspan="2">
			<label for="agree">이용약관에 동의합니다</label>&nbsp;<input type="checkbox" id="agree" />
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center; vertical-align: middle;">
			<iframe src="<%= request.getContextPath() %>/resources/images/ISJW/agree.html" width="85%" height="150px" class="box" ></iframe>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center; vertical-align: middle;">
			<button type="button" id="btnRegister" style="background-color: #F5F5F5; border:none; width: 135px; height: 34px;" onClick="goRegister();"><img src="<%= request.getContextPath() %>/resources/images/ISJW/join.png" /></button>
		</td>
	</tr>
	</tbody>
</table>
</form>
</div>

