<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">

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
			searchFrm.action = "/hajota/hostManager.go";
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
		
		    var bool = confirm("호스트를 정말로 탈퇴시키겠습니까?");
		
		    if(bool) {
		    	var delrecoverFrm = document.delrecoverFrm;
		    	delrecoverFrm.email.value = email;
		    	delrecoverFrm.filename.value = "hostManager"; 
		    	delrecoverFrm.action = "hostDelete.go";
		    	delrecoverFrm.method = "post";
		    	delrecoverFrm.submit();
		    }
			
		}// end of goEdit(idx)-------   
		
		
		function goRecover(email) {
			
			var bool = confirm("호스트를 정말로 복구하시겠습니까?");
			
			    if(bool) {
			    	var delrecoverFrm = document.delrecoverFrm;
			    	delrecoverFrm.email.value = email;
			    	delrecoverFrm.filename.value = "hostManager";
			    	delrecoverFrm.action = "hostRecover.go";
			    	delrecoverFrm.method = "post";
			    	delrecoverFrm.submit();
			    }
				
		}// end of goRecover(idx)-------  
	
</script>

<div>
	<span style="font-size: 25px; font-weight: bold;">
	<img src="<%= request.getContextPath() %>/resources/images/HSSH/managericon.png" style="width: 50px; height: 50px;" />
	호스트관리 페이지</span>
</div>
<div id="line" style="position:relative; top:10px; background-color:navy; height: 3px; "></div>

<div class="container" style="margin-top: 100px;">

<c:if test="${hostList != null || not empty hostList}">
    <c:forEach var="host" items="${hostList}">

	<ul class="list-group" style="width: 250px; display:inline-block;">
	
		<c:if test="${host.STATUS == 0 }">
			  <li  class="list-group-item active" style="background-color: #ea6153; height: 80px;">
			  <img src="<%= request.getContextPath() %>/resources/images/HSSH/guest.png" style="width: 50px; height: 50px;" />
			  &nbsp;&nbsp;&nbsp;${host.LAST_NAME} ${host.FIRST_NAME} 
			  <a href="javascript:goRecover('${host.EMAIL}')">
			  <img src="<%= request.getContextPath() %>/resources/images/HSSH/ref.png" style="width: 30px; height: 30px; margin-left: 185px; margin-top: -90px;"  />
			  </a> 
			  </li>
		</c:if>
			
		<c:if test="${host.STATUS != 0 }">							
			  <li class="list-group-item active" style=" height: 80px;">
			  <img src="<%= request.getContextPath() %>/resources/images/HSSH/guest.png" style="width: 50px; height: 50px;" />
			  &nbsp;&nbsp;&nbsp;${host.LAST_NAME} ${host.FIRST_NAME} 
			 <a href="javascript:goDel('${host.EMAIL}')">
			  <img src="<%= request.getContextPath() %>/resources/images/HSSH/xmark.png" style="width: 30px; height: 30px; margin-left: 50px; margin-top: -25px;"  />
			 </a> <br/>
	         </li>
	         
	    </c:if>
	    
	  <li class="list-group-item">Email> ${host.EMAIL}</li>
	  <li class="list-group-item">Birth> ${host.BIRTHDAY}</li>
	  <c:if test="${host.STATUS == 0 }">
	  <li class="list-group-item">STATUS> ${host.STATUS} 탈퇴 </li>
	  </c:if>
	   <c:if test="${host.STATUS == 1 }">
	  <li class="list-group-item">STATUS> ${host.STATUS} 활동중 </li>
	  </c:if>
	  <li class="list-group-item">TEL> ${host.TEL}</li>
	</ul>
	
	</c:forEach>
</c:if>
	
<c:if test="${hostList == null || empty hostList}">
      	<ul class="list-group">
      		<li class="list-group-item active">HOST LIST</li>
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
			<option value="grade">등급</option>
		</select>
	</div>
	<div style="margin-top: -35px; margin-left: 210px; ">		
		<input type="text" name="search" id="search" size="40px"  placeholder="검색어 입력" style="display: inline-block;" />
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
