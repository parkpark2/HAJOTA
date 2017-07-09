<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>
#search {background: #A3D0C3;}
#search {
  width: 200px;
  height: 30px;
  padding-left: 10px;
  border: 2px solid #7BA7AB;
  border-radius: 5px;
  outline: none;
  background: #F9F0DA;
  color: #9E9C9C;
}


/* select */
.styled-select {
   height: 29px;
   overflow: hidden;
   width: 100px;
}

.styled-select select {
   background: #7ba7ab;
   border: none;
   font-size: 14px;
   height: 29px;
   padding: 5px; 
   width: 100px;
}
.yellow  { background-color:#7BA7AB;}
.yellow select  { color: #ffffff; }
.rounded {
   -webkit-border-radius: 20px;
   -moz-border-radius: 20px;
   border-radius: 20px;
}

</style>


<script type="text/javascript">

$(document).ready(function(){
	searchKeep();
});

	function goSearch(){
		
		var searchFrm = document.searchFrm;		
		var search = $("#search").val();
		
		if(search.trim() == "") {
			alert("검색어를 입력하세요!!");
		}
		else {
			searchFrm.action = "/hajota/guestManager.go";
			searchFrm.method = "GET";
			searchFrm.submit();
		}		
	}
		
	function searchKeep(){
		<c:if test="${not empty colname && not empty search}">
			$("#colname").val("${colname}"); // 검색어 컬럼명을 유지시켜 주겠다.
			$("#search").val("${search}");   // 검색어를 유지시켜 주겠다.
		</c:if>
	}
	
	function goDel(email) {
		
		    var bool = confirm("게스트를 정말로 탈퇴시키겠습니까?");
		
		    if(bool) {
		    	var delrecoverFrm = document.delrecoverFrm;
		    	delrecoverFrm.email.value = email;
		    	delrecoverFrm.filename.value = "guestManager"; 
		    	delrecoverFrm.action = "guestDelete.go";
		    	delrecoverFrm.method = "post";
		    	delrecoverFrm.submit();
		    }
			
		}// end of goEdit(idx)-------   
		
		
		function goRecover(email) {
			
			var bool = confirm("게스트를 정말로 복구하시겠습니까?");
			
			    if(bool) {
			    	var delrecoverFrm = document.delrecoverFrm;
			    	delrecoverFrm.email.value = email;
			    	delrecoverFrm.filename.value = "guestManager";
			    	delrecoverFrm.action = "guestRecover.go";
			    	delrecoverFrm.method = "post";
			    	delrecoverFrm.submit();
			    }
				
		}// end of goRecover(idx)-------  
	
</script>

<div>
	<span style="font-size: 25px; font-weight: bold;">게스트관리 페이지</span>
</div>
<div id="line" style="position:relative; top:10px; background-color:navy; height: 3px; "></div>

<div class="container" style="margin-top: 100px;">

<c:if test="${guestList != null || not empty guestList}">
    <c:forEach var="guest" items="${guestList}">

	<ul class="list-group" style="width: 250px; display:inline-block;">
	
		<c:if test="${guest.STATUS == 0 }">
			  <li  class="list-group-item active" style="background-color: #ea6153; height: 80px;">
			  <img src="<%= request.getContextPath() %>/resources/images/HSSH/guest.png" style="width: 50px; height: 50px;" />
			  &nbsp;&nbsp;&nbsp;${guest.LAST_NAME} ${guest.FIRST_NAME} 
			  <a href="javascript:goRecover('${guest.EMAIL}')">
			  <img src="<%= request.getContextPath() %>/resources/images/HSSH/ref.png" style="width: 30px; height: 30px; margin-left: 185px; margin-top: -90px;"  />
			  </a> 
			  </li>
		</c:if>
			
		<c:if test="${guest.STATUS != 0 }">							
			  <li class="list-group-item active" style="height: 80px;">
			  <img src="<%= request.getContextPath() %>/resources/images/HSSH/guest.png" style="width: 50px; height: 50px;" />
			  &nbsp;&nbsp;&nbsp;${guest.LAST_NAME} ${guest.FIRST_NAME} 
			 <a href="javascript:goDel('${guest.EMAIL}')">
			  <img src="<%= request.getContextPath() %>/resources/images/HSSH/xmark.png" style="width: 30px; height: 30px; margin-left: 70px; margin-top: -25px;"  />
			 </a> <br/>
	         </li>
	         
	    </c:if>
	    
	  <li class="list-group-item">Email  > ${guest.EMAIL}</li>
	  <li class="list-group-item">Birth  > ${guest.BIRTHDAY}</li>
	  <c:if test="${guest.STATUS == 0 }">
	  <li class="list-group-item">STATUS > ${guest.STATUS} 탈퇴 </li>
	  </c:if>
	   <c:if test="${guest.STATUS == 1 }">
	  <li class="list-group-item">STATUS > ${guest.STATUS} 활동중 </li>
	  </c:if>
	</ul>
	
	</c:forEach>
</c:if>
	
<c:if test="${guestList == null || empty guestList}">
      	<ul class="list-group">
      		<li class="list-group-item active">GUEST LIST</li>
	  		<li class="list-group-item">정보가 없습니다.</li>
      	</ul>
</c:if>

<div align="center" style="width: 400px; margin-left: 300px; ">
		${pagebar}
</div>

	
	<!-- ===== 글검색 폼 추가 ===== -->
	<div align="center" style="width: 300px; margin-left: 300px; position: relative; display: inline-block; ">
	<form name="searchFrm" style="margin-top: 10%;">
	<div class="styled-select yellow rounded" style="display: inline-block;">
		<select name="colname" id="colname">
			<option value="email">이메일</option>
			<option value="first_name">이름</option>
			<option value="birthday">생일</option>
		</select>
	</div>
	<div style="margin-top: -35px; margin-left: 210px; ">		
		<input type="text" name="search" id="search" size="40px" placeholder="검색어 입력" style="display: inline-block;" />
		<img onClick="goSearch();" src="<%= request.getContextPath() %>/resources/images/HSSH/search.png" width="20px;" height="20px;" style="margin-top: -50px; margin-left: 170px; ">
	</div>	
	</form>
	</div>
	

</div>

<!-- -------------------------------------------------header end------------------------------------------------------- -->

</div>
</div>
</div>
</div>
</div>
</div>

<%-- 회원정보 삭제/복구하는 폼생성하기 --%>
<form name="delrecoverFrm">
	<input type="hidden" name="email" />
	<input type="hidden" name="filename" />
</form>
