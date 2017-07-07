<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="<%= request.getContextPath() %>/resources/js/JW/jquery-2.0.0.js"></script>
<style>

.panel{
	 padding-bottom:10px;
	 margin-top:100px;
}
	
.ng-button { background:green; color: white; text-decoration:none; padding:6px;
transition:1s; height: 25px; box-shadow: 1px 1px 1px 1px black; border: 1px solid black;
border-radius: 20px;
}
.ng-button:hover { background:black; color:white; text-decoration:none; border:1px solid;
border-radius: 0px;
}


</style>



<script type="text/javascript">
	$(document).ready(function(){
		
		$("#btneditUser").click(function(event){
   		 
   		 /* if(${sessionScope.loginuser != null}) {
   			 alert("이미 로그인을 하신 상태 입니다 !!");
				 $("#guest_email").val(""); 
				 $("#pwd").val("");
				 $("#guest_email").focus();
				 event.preventDefault();
				 return; 
   		 } */
			 
			var pwd = $("#password").val(); 
			var first_name = $("#first_name").val(); 
			var last_name = $("#last_name").val(); 
			var tel = $("#telephone").val(); 
			
			
			   if(pwd.trim()=="") {
				 alert("비밀번호를 입력하세요!!");
				 $("#password").val(""); 
				 $("#password").focus();
				 event.preventDefault();
				 return;
			 }   
			 
			if(first_name.trim()=="") {
				 alert("이름을 입력하세요!!");
				 $("#first_name").val(""); 
				 $("#first_name").focus();
				 event.preventDefault();
				 return;
			 }
			
			if(last_name.trim()=="") {
				 alert("성을 입력하세요!!");
				 $("#last_name").val(""); 
				 $("#last_name").focus();
				 event.preventDefault();
				 return;
			 }
			
			if(tel.trim()=="") {
				 alert("연락처를 입력하세요!!");
				 $("#telephone").val(""); 
				 $("#telephone").focus();
				 event.preventDefault();
				 return;
			 }
			

			 document.edituserFrm.action = "/hajota/edituserEnd.go";
			 document.edituserFrm.method = "get";
			 document.edituserFrm.submit();
		}); // end of $("#btnJOIN").click(function(event){-----------------------
	});
	
	
		 

</script> 

<div>
   <span style="font-size: 35px; font-weight: bold;"><img src="<%= request.getContextPath() %>/resources/images/ISJW/user2.png" style="margin-left:-5%; width: 50px; height: 50px;" />&nbsp;정보수정</span>
</div>
<div id="line" style="position:relative; top:10px; background-color:navy; height: 3px; margin-left: 20%; "></div>

	<div style="padding-left: 5%; padding-top: 3%;border: solid 0px red; margin-top: 2%; background-color: white; width: 60%; margin-left: 20%;"  >
	
		<form name="edituserFrm" style="width: 90%; height: 90%;"> 
			
			<div class="form-group">
				<label style="margin-left: 20%;">Email</label> <input type="text" style="margin-left:18%; margin-left: 20%;" class="form-control" name="email" id="email"
					value="${sessionScope.loginuser.EMAIL}" class="requiredInfo" readonly >
			</div>
			<div class="form-group">
				<label style="margin-left: 20%;">pwd</label> <input type="text" name="pwd" id="password" class="form-control" style="margin-left: 20%;">
			</div> 
			<div class="form-group">
				<label style="margin-left: 20%;">Frist Name</label> <input type="text" style="margin-left: 20%;" name="first_name"
					id="first_name" value="${sessionScope.loginuser.FIRST_NAME}"
					class="form-control" />
			</div>
			<div class="form-group">
				<label style="margin-left: 20%;">Last Name</label> <input type="text" name="last_name" style="margin-left: 20%;"
					id="last_name" value="${sessionScope.loginuser.LAST_NAME}"
					class="form-control" />
			</div>
			
			<div class="form-group">
				<label style="margin-left: 20%;">Tel</label> <input type="text" name="tel" style="margin-left: 20%;"
					id="telephone" value="${sessionScope.loginuser.TEL}"
					class="form-control" />
			</div>

			<div class="form-group text-center" class="row">
				<button type="button" class="ng-button" id="btneditUser" style="margin-left:36%; width: 19%; height:0%;">Edit</button>
			</div>
		</form>

	</div>

</div>