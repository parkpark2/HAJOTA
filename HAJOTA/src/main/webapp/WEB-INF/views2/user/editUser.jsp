<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/TypeofCss/JW/style.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<style>
	/* table#tblMemberRegister {
	     width: 90%;
	     border: solid gray 1px;
	     border-collapse: collapse;
	     margin: 10px;
	}
	
	th#th {
		 background-color: silver;
		 font-size: 13pt;	
	}
	
	table#tblMemberRegister td {
		border: solid gray 1px;
	}
	
	.star {color: red; 
	       font-weight: bold; 
	       font-size: 13pt;
	} */
	
	.panel{
  padding-bottom:10px;
  margin-top:100px;
}
	
</style>

<script src="<%= request.getContextPath() %>/resources/js/JW/jquery-2.0.0.js"></script>

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
			

			 document.edituserFrm.action = "/hajota/edituserEnd.go";
			 document.edituserFrm.method = "get";
			 document.edituserFrm.submit();
		}); // end of $("#btnJOIN").click(function(event){-----------------------
	});
	
	/*  function editUser() {
		 
			var pwd = $("#pwd").val(); 
			var first_name = $("#first_name").val(); 
			var last_name = $("#last_name").val(); 
			
			if(pwd.trim()=="") {
				 alert("비번을 입력하세요!!");
				 $("#pwd").val(""); 
				 $("#pwd").focus();
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
		  
	    	
	    var edituserFrm = document.edituserFrm;
	    edituserFrm.method="post";
	    edituserFrm.action="edituserEnd.go";
	    edituserFrm.submit();
			
	 } 	 */
		 

</script>
 <div>
		<div><a href="#">프로필 수정</a></div>
		<div><a href="#">예약현황</a></div>
		<div><a href="#">이용내역</a></div>
		<div><a href="#">wish-list</a></div>
		<div><a href="#">후기</a></div>
</div>



<div class="container">
	<div class="col-sm-6 col-sm-offset-3 panel panel-default request">
		<form name="edituserFrm">
			<h4 class="text-center">Edit User</h4>
			<div class="form-group">
				<label>Email</label> <input type="text" class="form-control"
					name="guest_email" id="guest_email"
					value="${sessionScope.loginuser.GUEST_EMAIL}" class="requiredInfo"
					readonly >
			</div>
			<div class="form-group">
				<label>Password</label> <input type="text" name="pwd" id="password" class="form-control" >
			</div>
			<div class="form-group">
				<label>Frist Name</label> <input type="text" name="first_name"
					id="first_name" value="${sessionScope.loginuser.FIRST_NAME}"
					class="form-control" />
			</div>
			<div class="form-group">
				<label>Last Name</label> <input type="text" name="last_name"
					id="last_name" value="${sessionScope.loginuser.LAST_NAME}"
					class="form-control" />
			</div>

			<div class="form-group text-center">
				<button type="button" class="btn btn-info" id="btneditUser">Edit</button>
			</div>
		</form>

	</div>
</div>
