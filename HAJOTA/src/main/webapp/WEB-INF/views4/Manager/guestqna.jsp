<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<script type="text/javascript">

$(document).ready(function(){


});

	// 검색하는 메소드
	function goSearch(){
		
		var searchFrm = document.searchFrm;
		
		var search = $("#search").val();
		
		if(search.trim() == "") {
			alert("검색어를 입력하세요!!");
		}
		else {
			searchFrm.action = "/hajota/noticeManager.go";
			searchFrm.method = "GET";
			searchFrm.submit();
		}
		
	}
	
</script>

<style>
/* default tables */ 
table {
	width:100%;
	margin-bottom:10px;
}
table tr th, table tr td {
	padding:5px 10px; 
}
table tr th {
	background:navy none repeat-x scroll bottom left;
	color:#ffffff;
	border-top:2px solid navy;
}
table tr td {
	border-bottom:1px solid #dddddd;
}


/* default links */
a, a:visited { 
	color:#CC0047;
} 
a:hover { 
	color:#990036; 
}
	

/* centeral page */
div.page {
	clear:both;
	margin:0;
	padding:0;
	background-color:#ffffff;
}
div.page ul {
	font-size:0.95em;
	color:#333333;
}
div.page ul li {
	padding:2px 0;
}
div.page p {
	text-align:justify;
	font-family:Helvetica, Arial, sans-serif;
	color:#444444;
}

/* content */
div.page-wrap {
	padding:20px;
	clear:both;
	background-color:#fff;
}
div.content {
	float:left;
	width:65%;
	padding-right:20px;
}
div.content ul {
	font-size:0.9em;
	list-style:disc;
}
div.content ul li {
	padding-bottom:5px;
}

/* misc classes */
*:focus {
	outline:none;
}
.clear {
	clear:both;
}


</style> 

<div style="background-color: white; width:1800px; margin-left: -50px;">
	<span style="font-size: 25px; font-weight: bold; margin-left: 50px;">Q&A 페이지</span>
</div>

<div id="line" style="position:relative; top:10px; background-color:navy; height: 3px; width:1800px; ">
	
</div>

<div class="container" style="background-color: white; width:2000px; height:700px; margin-left:-40px;">
    <div class="pagewidth" style="background-color: white; width:1800px;">
	  <div style="background-color: white; width:1600px; margin-top:-20px;">
		<div class="content" style="background-color: white; width: 2000px; margin-top: 80px; margin-left:0px; margin-right:100px;">
			<div style="margin-left : 140px;">
				<button type="button" class="btn btn-primary" onClick="goAllqna();">전체 Q&A</button>
				<button type="button" class="btn btn-primary" onClick="goGuestqna();">게스트 Q&A</button>
				<button type="button" class="btn btn-primary" onClick="goHostqna();">호스트 Q&A</button>
			</div>
				
		<form name="guestqnaFrm">	
		     <table style="width: 1300px; margin-left: 140px; margin-top: 40px;">
		     	  <tr>
			        <th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white;">번호</span></th>
			        <th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white;">이메일</span></th>
			        <th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white; margin-left: 25px;">제목</span></th>
			        <th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white; margin-left: 25px;">내용</span></th>
			        <th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white; margin-left: 20px;">날짜</span></th>
			        <th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white;">삭제여부</span></th>
			     </tr> 
			
			    <c:if test="${guestqnaList != null || not empty guestqnaList}">
			    <c:forEach var="qna" items="${guestqnaList}">
			
			      <tr>
			        	<td>${qna.SEQ_QUESTION}</td>
			        	<td>${qna.GUEST_EMAIL}</td>
			        	<td>${qna.SUBJECT}</td>
			       		<td>${qna.CONTENT}</td>
			        	<td>${qna.WRITEDATE}</td>
			        	<td><button type="button" class="btn btn-primary" onClick="goDelete('${notice.SEQ_QUESTION}');">삭제</button></td>
			        	<%-- <td>${notice.STATUS}</td> --%>
				  </tr>
				       
			      </c:forEach>
			      </c:if>
			 </table>
		</form>
		
</div>
<!-- 정보가 없을 부분///////////////////////////////////////////////////////////////////////////////////////////// -->     
      <div style="margin-left:150px;">     
      <c:if test="${guestqnaList == null || empty guestqnaList}">
      	<tr>
      		<td colspan="6" style="margin-left:200px;">검색한 정보가 없습니다.</td>
      	</tr>
      </c:if>
	  </div>
	
  	 <!-- ===== 페이지바  ===== -->
	<div align="center" style="width: 400px; margin-left: 500px; ">
		${pagebar}
	</div>

	<div style="margin-bottom: 30px; margin-right: 180px; ">
  		<button type="button" class="btn btn-primary" style="float: right;" onClick="javascript:location.href='<%= request.getContextPath() %>/noticewriteManager.go'">글쓰기</button>
  	</div>
  	
	<br/>
	
	<!-- ===== 글검색 폼 추가 ===== -->
	<div align="center" style="width: 300px; margin-left: 300px; position: relative; display: inline-block; margin-top: -700px;">
	<form name="searchFrm" style="width:500px; margin-bottom: 50px; margin-top: -50px; margin-left: 150px;">
		<select name="colname" id="colname" >
			<option value="admin_id">아이디</option>
			<option value="subject">제목</option>
			<option value="content">내용</option>
		</select>
		<input type="text" name="search" id="search" size="40px" />
		<button type="button" class="btn btn-primary" onClick="goSearch();">검색</button>
	</form>
	</div>
	
	<form name="deleteFrm">
		<input type="hidden" name="seq_question" />
	</form>
	

</div>

</div>
</div>

