<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<script>

	function goSearch() {
		var search_content = $("#search_content").val(); 
		var numOfPeople = $("#numOfPeople").val();
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		
		$("#pageNo").val("1");

		if (search_content.trim() == "" || numOfPeople.trim() == ""
				|| startDate.trim() == "" || endDate.trim() == "") {
			// TODO : 수정하자
			alert("모든 항목을 입력하셔야 합니다.");
			return;
		}

		var searchFrm = document.searchFrm;

		searchFrm.action = "/hajota/rooms/list.go";
		searchFrm.method = "POST";
		searchFrm.submit();
	}
	
	$(document).ready(function() {
		$("#search_content").val("${search_content}");
		$("#numOfPeople").val("${numOfPeople}");
		$("#startDate").val("${startDate}");
		$("#endDate").val("${endDate}");
	});	
</script>


   <!-- Navigation Bar -->
    <div class="w3-top w3-bar w3-white w3-border-bottom w3-xlarge" style="background-color: white; z-index :100;">
    <a href="<%=request.getContextPath()%>/index.go">
      <img src="<%=request.getContextPath()%>/resources/images/oneofall/logo.png"
         style="width: 200px; height: 60px; margin-left: 30px;" /> 
      </a>
         
    <!--  <label><i class="fa fa-search-plus" style="margin-left: 100px;"></i></label>&nbsp; --> 
      <input type="text" id="search_content" name="search_content" placeholder="search" size="10" style="height: 30px; width: 8%; margin-left: 2%; margin-top: 1%;" />&nbsp; 
    <!-- <label><i class="fa fa-male"></i></label>&nbsp; -->
      <input type="text" id="numOfPeople" name="numOfPeople" placeholder="1" size="3" style="height: 30px; width: 2%;  margin-top: 1%;" />&nbsp; 
    <!--  <label><i class="fa fa-calendar-o"></i></label>&nbsp;  -->
      <input type="text" class="datepicker" id="startDate"	name="startDate" placeholder="Check In" size="10" style="height: 30px; width: 8%; margin-top: 1%;" />&nbsp; 
    <!--  <label><i class="fa fa-calendar-o"></i></label>&nbsp;  -->
      <input type="text" class="datepicker" id="endDate" name="endDate" placeholder="Check Out" size="10" style="height: 30px; width: 8%; margin-top: 1%;" />&nbsp; 
       
  
      
      <a href="#" class="<!-- w3-button w3-hover-white w3-text-white -->" style="background-color: #0099ff; width: 3%; height: 40px;">
      <i class="fa fa-search"  onclick="goSearch();"></i></a> 
      
      <a href="<%=request.getContextPath()%>/index.go"> 
     <img src="<%=request.getContextPath()%>/resources/images/oneofall/South Korea.png" style="margin-left: 3%;" />
      </a> 
      <a href="<%=request.getContextPath()%>/indexChinese.go"> 
      <img src="<%=request.getContextPath()%>/resources/images/oneofall/China.png" style="margin-left: 10px;" />
      </a> 
      <a href="<%=request.getContextPath()%>/indexJapanese.go"> 
      <img src="<%=request.getContextPath()%>/resources/images/oneofall/Japan.png" style="margin-left: 10px;" /> 
      </a>
      <a href="<%=request.getContextPath()%>/indexEnglish.go"> 
      <img src="<%=request.getContextPath()%>/resources/images/oneofall/USA.png" style="margin-left: 10px;" />
	  </a>
   
         <a href="<%=request.getContextPath()%>/callview.go" class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large"
         title="Q&A"><i class="fa fa-question-circle"></i></a>
      
		
       <c:if test="${sessionScope.loginuser != null}">
       
       <!-- 게스트로 로그인했을때 -->
	       	 <c:if test="${sessionScope.loginuser.GRADE == '9'}">
	         <a style="color: red; font-weight: bold; font-size: 15px; margin-left: 10%;">
	            환영합니다♥ </a>
	         <a style="color: navy; font-weight: bold; font-size: 15px;">
	            ${sessionScope.loginuser.LAST_NAME}${sessionScope.loginuser.FIRST_NAME} 게스트님
	         </a>	       
	       
	       	 <a href="<%=request.getContextPath()%>/coupon.go"
	            class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large"
	            title="EVENT"><i class="fa fa-heart"></i></a>	
	       
	       
	         <a href="<%=request.getContextPath()%>/logout.go"
	            class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large"
	            title="LOGOUT"><i class="fa fa-sign-out"></i></a>
	      
	         <a href="<%=request.getContextPath()%>/editUser.go"
	            class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large" title="MYPAGE"> 
	            <img src="<%=request.getContextPath()%>/resources/images/ISJW/user.png" width="35px;" height="35px;" />
	         </a>
	      	</c:if>  
      	
      	<!-- 호스트로 로그인했을때 -->
	      	<c:if test="${sessionScope.loginuser.GRADE == '8'}">
	         <a style="color: red; font-weight: bold; font-size: 15px; margin-left: 10%;">
	            환영합니다♥ </a>
	         <a style="color: navy; font-weight: bold; font-size: 15px;">
	            ${sessionScope.loginuser.LAST_NAME}${sessionScope.loginuser.FIRST_NAME} 호스트님
	         </a>	       
	       
	         <a href="<%=request.getContextPath()%>/logout.go"
	            class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large"
	            title="LOGOUT"><i class="fa fa-sign-out"></i></a>
	      
	         <a href="<%=request.getContextPath()%>/rooms/insert.go" class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large"
         		title="HOSTING"><i class="fa fa-globe"></i></a> 
	      
	         <a href="<%=request.getContextPath()%>/editUser.go"
	            class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large" title="MYPAGE"> 
	            <img src="<%=request.getContextPath()%>/resources/images/ISJW/user.png" width="35px;" height="35px;" />
	         </a>
	         
	         
	         
	      	</c:if>	 	
	      	     
      </c:if>
   </div>   
   

  
  
  
  
  