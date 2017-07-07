<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", Arial, Helvetica, sans-serif}
.myLink {display: none}
</style>
<body class="w3-light-grey">

<!-- Navigation Bar --> 
 <div class="w3-top w3-bar w3-white w3-border-bottom w3-xlarge">
 <a href="<%=request.getContextPath()%>/index.go">
  <img src="<%= request.getContextPath() %>/resources/images/oneofall/logo.png" style="width:200px; height:60px; margin-left: 30px;"/>
</a>
               <label><i class="fa fa-search-plus" style="margin-left: 270px;"></i></label>&nbsp;              
               <input type="text" id="search" name="search" placeholder="Search" size="10" style="height: 30px;" />&nbsp; 
        
               <label><i class="fa fa-male"></i></label>&nbsp;           
               <input type="text" id="search" name="search" placeholder="1" size="3" style="height: 30px;"/>&nbsp; 
             
               <label><i class="fa fa-calendar-o"></i></label>&nbsp;            
               <input type="text" class="datepicker" name="startDate" placeholder="Check In" size="10" style="height: 30px;" />&nbsp; 
               
               <label><i class="fa fa-calendar-o"></i></label>&nbsp;              
               <input type="text" class="datepicker" name="endDate"  placeholder="Check Out" size="10" style="height: 30px;" />&nbsp; 
              
<a href="#" class="w3-button w3-hover-white w3-text-white" style="background-color: #0099ff; width: 50px; height: 50px;"><i class="fa fa-search"></i></a>

<a href="<%= request.getContextPath() %>/index.go">
  <img src="<%= request.getContextPath() %>/resources/images/oneofall/South Korea.png" style=" margin-left:100px;"/> </a>
<a href="<%= request.getContextPath() %>/indexChinese.go">
  <img src="<%= request.getContextPath() %>/resources/images/oneofall/China.png" style="margin-left: 10px;"/> </a>
<a href="<%= request.getContextPath() %>/indexJapanese.go">  
   <img src="<%= request.getContextPath() %>/resources/images/oneofall/Japan.png" style="margin-left: 10px;"/> </a>
<a href="<%= request.getContextPath() %>/indexEnglish.go">   
  <img src="<%= request.getContextPath() %>/resources/images/oneofall/USA.png" style="margin-left: 10px;"/> </a>
  
  <a href="#" class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large" title="question"><i class="fa fa-question-circle"></i></a>
  <a href="#" class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large" title="Join"><i class="fa fa-user-plus"></i></a>
  <a href="#" class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large" title="Login"><i class="fa fa-user"></i></a>

 </div>

</body>

