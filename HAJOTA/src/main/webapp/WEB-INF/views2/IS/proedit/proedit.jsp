<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
</style>

<script type="text/javascript">

	$(document).ready(function(){
			
		});
		
		function goEdit() {
			
			var proEdit = document.proEdit;
			
			proEdit.action = "/hajota/proeditEnd.go";
			proEdit.method = "post";
			proEdit.submit();
			
		}

</script>

<form name="proEdit">
    
    <div>
    
    	이메일(예:insang89@naver.com)<input type="text" name="guest_email" id="guest_email" /> <br/>
    	이름(예:인상)<input type="text" name="first_name" id="first_name" /> <br/>
    	성(예:유)<input type="text" name="last_name" id="last_name" /> <br/>
    	생년월일(예:89/12/03)<input type="text" name="birthday" id="birthday" /> <br/>
    	비밀번호<input type="password" name="pwd" id="pwd" />
    	<button type="button" onclick="goEdit()">수정하기</button>&nbsp;&nbsp;<button type="reset">취소하기</button>
    	
    </div>
    
</form>     