<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
.myLink {display: none}

	.mydiv {display: inline-block; 
	        position: relative; 
	        top: 30px; 
	        line-height: 150%; 
	        border: solid 0px green;
	       }
	
	.mydisplay {display: block;}
	       	
	.myfont {font-size: 14pt;}
	
	option {
    font-weight: normal;
    display: block;
    white-space: pre;
    min-height: 1.2em;
    padding: 0px 2px 1px;
}

select {
    -webkit-appearance: menulist;
    box-sizing: border-box;
    align-items: center;
    white-space: pre;
    -webkit-rtl-ordering: logical;
    color: black;
    background-color: white;
    cursor: default;
    border-width: 1px;
    border-style: solid;
    border-color: initial;
    border-image: initial;
}
user agent stylesheet
input, textarea, select, button {
    text-rendering: auto;
    color: initial;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    margin: 0em 0em 0em 0em;
    font: 13.3333px Arial;
}
user agent stylesheet
input, textarea, select, button, meter, progress {
    -webkit-writing-mode: horizontal-tb;
}
	
</style>

<script type="text/javascript">
 
     $(document).ready(function(){
    	 
    	
 $("#btnLOGIN").click(function(event){
    		 
    		 if(${sessionScope.loginuser != null}) {
    			 alert("이미 로그인을 하신 상태 입니다 !!");
 				 $("#guest_email").val(""); 
 				 $("#pwd").val("");
 				 $("#guest_email").focus();
 				 event.preventDefault();
 				 return; 
    		 }
 			 
    		 var guest_email = $("#guest_email").val(); 
 			 var pwd = $("#pwd").val(); 
 			
 			 if(guest_email.trim()=="") {
 			 	 alert("이메일을 입력하세요!!");
 				 $("#guest_email").val(""); 
 				 $("#guest_email").focus();
 				 event.preventDefault();
 				 return;
 			 }
 			
 			 if(pwd.trim()=="") {
 				 alert("비밀번호를 입력하세요!!");
 				 $("#pwd").val(""); 
 				 $("#pwd").focus();
 				 event.preventDefault();
 				 return;
 			 }

 			 document.loginFrm.action = "/hajota/loginEnd.go";
 			 document.loginFrm.method = "post";
 			 document.loginFrm.submit();
 		}); // end of $("#btnLOGIN").click();-----------------------
 		
 		
 		$("#pwd").keydown(function(event){
 			
 			if(event.keyCode == 13) { // 엔터를 했을 경우
 			
			if(${sessionScope.loginuser != null}) {
    			 alert("이미 로그인을 하신 상태 입니다 !!");
 				 $("#guest_email").val(""); 
 				 $("#pwd").val("");
 				 $("#guest_email").focus();
 				 event.preventDefault();
 				 return; 
    		 }	
 				
 			var userid = $("#guest_email").val(); 
 			var pwd = $("#pwd").val(); 
 			
 			if(guest_email.trim()=="") {
 				alert("이메일을 입력하세요!!");
 				$("#guest_email").val(""); 
 				$("#guest_email").focus();
 				event.preventDefault();
 				return;
 			}
 			
 			if(pwd.trim()=="") {
 				alert("비밀번호를 입력하세요!!");
 				$("#pwd").val(""); 
 				$("#pwd").focus();
 				event.preventDefault();
 				return;
 			}
 			
 			document.loginFrm.action = "/hajota/loginEnd.go";
			document.loginFrm.method = "post";
			document.loginFrm.submit();
 			
 			}
 		}); // end of $("#pwd").keydown();-----------------------
    	 
    });
     
     
     function goJoin() {
 		var joinFrm = document.joinFrm;
 		joinFrm.submit();
 	}
     
     
     

</script>

<body class="w3-light-grey">

<!-- Navigation Bar --> 
 <div class="w3-bar w3-white w3-border-bottom w3-xlarge">
  <img src="<%= request.getContextPath() %>/resources/images/oneofall/logo.png" style="width:200px; height:60px; margin-left: 30px;"/>

               <label><i class="fa fa-search-plus" style="margin-left: 100px;"></i></label>&nbsp;              
               <input type="text" id="search" name="search" placeholder="search" size="10" style="height: 30px;" />&nbsp; 
        
               <label><i class="fa fa-male"></i></label>&nbsp;           
               <input type="text" id="search" name="search" placeholder="1" size="3" style="height: 30px;"/>&nbsp; 
             
               <label><i class="fa fa-calendar-o"></i></label>&nbsp;            
               <input type="text" class="datepicker" name="startDate" placeholder="Check In" size="10" style="height: 30px;" />&nbsp; 
               
               <label><i class="fa fa-calendar-o"></i></label>&nbsp;              
               <input type="text" class="datepicker" name="endDate"  placeholder="Check Out" size="10" style="height: 30px;" />&nbsp; 
              
<a href="#" class="w3-button w3-hover-white w3-text-white" style="background-color: #0099ff; width: 50px; height: 50px;"><i class="fa fa-search"></i></a>
<a href="<%= request.getContextPath() %>/index.go">
  <img src="<%= request.getContextPath() %>/resources/images/oneofall/South Korea.png" style=" margin-left:100px;"/>
 </a> 
 <a href="<%= request.getContextPath() %>/indexChinese.go">
  <img src="<%= request.getContextPath() %>/resources/images/oneofall/China.png" style="margin-left: 10px;"/> 
  </a>
   <img src="<%= request.getContextPath() %>/resources/images/oneofall/Japan.png" style="margin-left: 10px;"/> 
  <img src="<%= request.getContextPath() %>/resources/images/oneofall/USA.png" style="margin-left: 10px;"/>
   
		<c:if test="${sessionScope.loginuser != null }">
		<a style="color: red; font-weight: bold; font-size: 15px; margin-left: 180px;">
		 환영합니다♥ 
		 </a>
		 <a style="color: navy; font-weight: bold; font-size: 15px;">
		 ${sessionScope.loginuser.FIRST_NAME}${sessionScope.loginuser.LAST_NAME}님 </a>
		
		</c:if>
  
  <!-- !!!!호스트가 로그인 했을 경우에만 나오도록 나중에 바꾸기!!!!! -->
  <a href="#" class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large" title="HOSTING"><i class="fa fa-globe"></i></a>
   
  <a href="#" class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large" title="question"><i class="fa fa-question-circle"></i></a>

  <c:if test="${sessionScope.loginuser == null}">
  <a data-toggle="modal" data-target="#joinModal" class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large" title="Join"><i class="fa fa-user-plus"></i></a>
  <a data-toggle="modal" data-target="#myModal" class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large" title="Login"><i class="fa fa-user"></i></a>
  </c:if>

  <c:if test="${sessionScope.loginuser != null}">
  <a href="<%=request.getContextPath()%>/logout.go" class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large" title="LOGOUT"><i class="fa fa-sign-out"></i></a>
  </c:if>
  
 </div>

</body>

<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">


		<!-- Modal content-->
		<div style="width:100%; margin: auto; border: solid 0px red; class="modal-content">
		<br/>
		<div style="width:80%; margin-top:10%; margin-left:10%; height:300px; border: solid 0px blue; background-color:white; ">
				<form class="gooleLogin">
					<div>
						<button type="button" class="close" data-dismiss="modal">
							&times;</button>
					</div>
					<div align="center" style="width: 90%;">
						<button>
							<span class="icon"></span> <span>구글계정으로 로그인</span>
						</button>
					</div>
				</form>
				
			<form name="loginFrm">
				<div class="mydiv" style="margin-left: 5%;">
					<input placeholder="이메일" class="mydisplay form-control" type="text"
						name="guest_email" id="guest_email" size="20"> <input
						placeholder="비밀번호" class="mydisplay form-control"
						style="margin-top: 15px;" type="password" name="pwd" id="pwd"
						size="20">
				</div>
				
				<div>
					<br><br>&nbsp;&nbsp;&nbsp;&nbsp;
					<label> <input type="checkbox" size="20">비밀번호 저장
					</label>
				</div>
				<div class="mydiv" style="margin-left: 10%;">
					<button class="btn btn-success"
						style="width: 100px; font-size: 14pt;" type="button" id="btnLOGIN">로그인</button>
				</div>
			</form>

			<!-- <div class="modal-body">
									<p>Some text in the modal.</p>
								</div> -->


			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		
		</div>
		</div>


	</div>
</div>



<!-- joinModal -->
<div class="modal fade" id="joinModal" role="dialog">
	<div class="modal-dialog">


		<!-- Modal content-->
		<!-- <div style="width:90%; margin: auto; border: solid 0px red; class="modal-content"> -->
		
		<div style="width:90%; margin-top:10%; margin-left:10%; height:400px; border: solid 0px blue; background-color:white; ">
				
				<div>
					<div>
						<button type="button" class="close" data-dismiss="modal">
							&times;</button>
					</div>
					<div align="center" style="width: 90%;">
						<button>
							<span class="icon"></span><span>구글계정으로 회원가입</span>
						</button>
					</div>
				</div>
				
			
			<form name="joinFrm" action="<%= request.getContextPath() %>/joinEnd.go" method="post" style="width: 80%;">
				<div>
					<input placeholder="이메일주소" class="mydisplay form-control" style="margin-top: 15px;" type="text" name="guest_email" id="guest_email" size="20"> 
					<input placeholder="이름" class="mydisplay form-control" style="margin-top: 15px;" type="text" name="last_name" id="last_name" size="20">
					<input placeholder="성" class="mydisplay form-control" style="margin-top: 15px;" type="text" name="first_name" id="first_name" size="20">
					<input placeholder="비밀번호설정" class="mydisplay form-control" style="margin-top: 15px;" type="password" name="pwd" id="pwd" size="20">
					<input class="mydisplay form-control" style="margin-top: 15px;" type="date" name="birthday" id="birthday" size="20"> 	
				</div>
				
				<div align="center" style="margin-top:70px; height: 20px;">
					<button class="btn btn-success2" style="width: 100px; font-size: 14pt;" type="button"  onClick="goJoin();">회원가입</button>
				</div>
			</form>
				
			
			<div align="right">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
			
		
		</div>
		<!-- </div> -->


	</div>
</div>