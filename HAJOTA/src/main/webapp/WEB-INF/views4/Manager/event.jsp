<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>
  <title>Event List</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/TypeofCss/HS/HS.css">
</head>

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

/* 표 스타일 */
.tableA {
  margin: 0 0 40px 0;
  width: 80%;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
  display: table;
}
@media screen and (max-width: 580px) {
  .tableA {
    display: block;
  }
}

.table {
  margin: 0 0 40px 0;
  width: 100%;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
  display: table;
}
@media screen and (max-width: 580px) {
  .table {
    display: block;
  }
}


.row {
  display: table-row;
  background: #f6f6f6;
}
.row:nth-of-type(odd) {
  background: #e9e9e9;
}
.row.header {
  font-weight: 900;
  color: #ffffff;
  background: #ea6153;
}
.row.green {
  background: #27ae60;
}
.row.blue {
  background: #2980b9;
}
@media screen and (max-width: 580px) {
  .row {
    padding: 8px 0;
    display: block;
  }
}

.cell {
  padding: 6px 1px;
  display: table-cell;
}
@media screen and (max-width: 700px) {
  .cell {
    padding: 2px 12px;
    display: block;
  }
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
			searchFrm.action = "/hajota/eventManager.go";
			searchFrm.method = "GET";
			searchFrm.submit();
		}		
	}// end of goSearch()-----------------------------------------------
		
	function searchKeep(){
		<c:if test="${not empty colname && not empty search}">
			$("#colname").val("${colname}"); // 검색어 컬럼명을 유지시켜 주겠다.
			$("#search").val("${search}");   // 검색어를 유지시켜 주겠다.
		</c:if>
	}// end of searchKeep()---------------------------------------------
	
	function goDel(seq_event){
						
		var bool = confirm("게임을 중단시키겠습니까?");
		
	    if(bool) {
	    	var delrecoverFrm = document.delrecoverFrm;
	    	delrecoverFrm.seq_event.value = seq_event;
	    	delrecoverFrm.filename.value = "eventManager"; 
	    	delrecoverFrm.action = "eventDelete.go";
	    	delrecoverFrm.method = "post";
	    	delrecoverFrm.submit();
	    }		
	}// end of goDel(seq_event)----------------------------
	
	function goRecover(seq_event) {
		
		var bool = confirm("게임을 실행시키겠습니까?");
		
		    if(bool) {
		    	var delrecoverFrm = document.delrecoverFrm;
		    	delrecoverFrm.seq_event.value = seq_event;
		    	delrecoverFrm.filename.value = "eventManager";
		    	delrecoverFrm.action = "eventRecover.go";
		    	delrecoverFrm.method = "post";
		    	delrecoverFrm.submit();
		    }
			
	}// end of goRecover(seq_event)--------------------------
	
	function goEmail(email) {
		
		var bool = confirm("메일을 발송하시겠습니까?");
		
		    if(bool) {
		    	var emailFrm = document.emailFrm;
		    	emailFrm.email.value = email;
		    	emailFrm.filename.value = "eventManager";
		    	emailFrm.action = "birthEmail.go";
		    	emailFrm.method = "post";
		    	emailFrm.submit();
		    }
			
	}// end of goRecover(seq_event)--------------------------
	
	</script>

<div>
	<span style="font-size: 25px; font-weight: bold;">
	<img src="<%= request.getContextPath() %>/resources/images/HSSH/managericon.png" style="width: 50px; height: 50px;" />
	이벤트 페이지</span>
</div>
<div id="line" style="position:relative; top:10px; background-color:navy; height: 3px; "></div>

<div class="container" style="margin-top: 100px;">

	<div>
		<span style="font-size: 20px; font-weight: bold;">※쿠폰현황※</span>
	</div>

<c:if test="${couponList != null || empty couponList}">
	<div class="tableA">    
	    <div class="row header">
	      <div class="cell">
	        NO
	      </div>
	      <div class="cell">
	        EMAIL
	      </div>
	      <div class="cell">
	        쿠폰NAME
	      </div>
	      <div class="cell">
	        STARTDAY
	      </div>
	      <div class="cell">
	        ENDDAY
	      </div>
	      <div class="cell">
	        PERCENT
	      </div>
	      <div class="cell">
	        사용유무
	      </div>
	    </div>
	    <c:forEach var="event" items="${couponList}">
	    <div class="row">	    	
	      <div class="cell">
	        ${event.SEQ_COUPON}
	      </div>
	      <div class="cell">
	        ${event.EMAIL}
	      </div>
	      <div class="cell">
	        ${event.NAME}
	      </div>
	      <div class="cell">
	        ${event.STARTDAY}
	      </div>
	      <div class="cell">
	        ${event.ENDDAY}
	      </div>
	      <div class="cell">
	        ${event.PERCENT}%
	      </div>	      	
	  <c:if test="${event.STATUS == 0 }">
	 	  <div class="cell">
	        ${event.STATUS} 사용완료
	      </div>
	  </c:if>
	  <c:if test="${event.STATUS == 1 }">
	  	  <div class="cell">
	        ${event.STATUS} 사용가능
	      </div>
	  </c:if>
	  <c:if test="${event.STATUS == 2 }">
	  	  <div class="cell">
	        ${event.STATUS} 기간만료
	      </div>
	  </c:if>
	              
	    </div>
	   </c:forEach>
	</div>    
</c:if> 
		
	
<c:if test="${couponList == null || empty couponList}">
     	<ul class="list-group">
     		<li class="list-group-item active">EVENT LIST</li>
  		<li class="list-group-item">이벤트 현황이 없습니다.</li>
     	</ul>
</c:if>

	<div align="center" style="width: 400px; margin-left: 300px; ">
			${pagebar}
	</div>

	<!-- ===== 검색 폼 추가 ===== -->
	<div align="center" style="width: 300px; margin-left: 300px; position: relative; display: inline-block; ">
	<form name="searchFrm" style="margin-top: 10%;">
	<div class="styled-select yellow rounded" style="display: inline-block;">
		<select name="colname" id="colname">
			<option value="name">쿠폰이름</option>
			<option value="email">이메일</option>			
			<option value="percent">할인퍼센트</option>
		</select>
	</div>
	<div style="margin-top: -35px; margin-left: 210px; ">		
		<input type="text" name="search" id="search" size="40px"  placeholder="검색어 입력" style="display: inline-block;" />
		<img onClick="goSearch();" src="<%= request.getContextPath() %>/resources/images/HSSH/search.png" width="20px;" height="20px;" style="margin-top: -50px; margin-left: 170px; ">
	</div>
	</form>
	</div>

<br/><br/>
<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->


<div style="width: 1200px; position: relative; margin-left: -10%;">
<div style="display: inline-block; width: 50%;">
<div>
	<span style="font-size: 20px; font-weight: bold;">※이벤트게임※</span>
</div>
<div class="table">    
    <div class="row header green">
      <div class="cell">
        NO
      </div>
      <div class="cell">
        게임이름
      </div>
      <div class="cell">
        게임실행횟수
      </div>
      <div class="cell">
       사용가능유무
      </div>
      <div class="cell">
       정지&실행 버튼
      </div>
    </div>
    
    <c:forEach var="game" items="${eventGame}">
    <div class="row">
      <div class="cell">
       	${game.SEQ_EVENT}
      </div>
      <div class="cell">
        ${game.NAME}
      </div>
      <div class="cell">
        ${game.COUNT}
      </div>
      <c:if test="${game.STATUS == 0 }">
	 	  <div class="cell" style="color: red;">
	        게임중단 中
	      </div>
	  </c:if>
	  <c:if test="${game.STATUS == 1 }">
	  	  <div class="cell"  style="color: blue;">
	        게임실행 中
	      </div>
	  </c:if>
	  
	  <c:if test="${game.STATUS == 0 }">
	 	  <div class="cell">
	      <button type="button" class="button" onclick="javascript:goRecover('${game.SEQ_EVENT}')">게임실행</button>
	      </div>
	  </c:if>
	  <c:if test="${game.STATUS == 1 }">
	  	  <div class="cell">
          <button type="button" class="button" onclick="javascript:goDel('${game.SEQ_EVENT}')">게임정지</button>
      	  </div>
	  </c:if>
      
    </div>
	</c:forEach>
</div>
</div>
<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
<div style="display: inline-block; width: 40%; margin-left: 5%">
	<div>
		<span style="font-size: 20px; font-weight: bold; display: inline-block;">※오늘 생일인 회원목록※</span>
	</div>


	<div class="table">    
<c:if test="${birthUserList != null}">	
	    <div class="row header blue">
	      <div class="cell">
	        NO
	      </div>
	      <div class="cell">
	        EMAIL
	      </div>
	      <div class="cell">
	        NAME
	      </div>
	      <div class="cell">
	       BIRTHDAY
	      </div>
	      <div class="cell">
	       메일발송버튼
	      </div>
	    </div>
	    
	    <c:forEach var="birth" items="${birthUserList}">
	    <div class="row">
	      <div class="cell">
	       	${birth.SEQ_MEMBER}
	      </div>
	      <div class="cell">
	        ${birth.EMAIL}
	      </div>
	      <div class="cell">
	        ${birth.LAST_NAME}${birth.FIRST_NAME}
	      </div>
	      <div class="cell">
	        ${birth.BIRTHDAY}
	      </div>	
	 	  <div class="cell">
	      <button type="button" class="button" onclick="javascript:goEmail('${birth.EMAIL}')">메일발송</button>
	      </div>      
	    </div>
		</c:forEach>
	</c:if>	
	
	<c:if test="${birthUserList == null || empty birthUserList}">
 	<div class="row">
      	<div class="cell">
       		오늘 생일인 회원이 없습니다.
      	</div>
    </div>	
	</c:if>	
			
	</div>

</div>
</div>

<%-- 게임을 삭제/복구하는 폼생성하기 --%>
<form name="delrecoverFrm">
	<input type="hidden" name="seq_event" />
	<input type="hidden" name="filename" />
</form>

<%-- 이메일을 발송하는 폼생성하기 --%>
<form name="emailFrm">
	<input type="hidden" name="email" />
	<input type="hidden" name="filename" />
</form>

</div>




