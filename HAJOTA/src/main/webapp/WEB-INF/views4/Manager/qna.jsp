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
		searchFrm.action = "/hajota/qnaManager.go";
		searchFrm.method = "GET";
		searchFrm.submit();
	}
	
}
	
	// 검색어 컬럼명을 유지시켜주는 메소드
	function searchKeep(){
		<c:if test="${not empty colname && not empty search}">
			$("#colname").val("${colname}"); // 검색어 컬럼명을 유지시켜 주겠다.
			$("#search").val("${search}");   // 검색어를 유지시켜 주겠다.
		</c:if>
	}
	
	 // 공지사항을 삭제하는 메소드
	function goDelete(seq_question) {
		alert('정말 삭제하시겠습니까?');
		var deleteFrm = document.deleteFrm;
		deleteFrm.seq_question.value = seq_question;
	
		deleteFrm.action = "/hajota/qnadelete.go";
		deleteFrm.method = "POST";
		deleteFrm.submit();
	} 
	
	// 전체 보기
	function goAllqna() {
		
		var allqnaFrm = document.allqnaFrm;
		
		allqnaFrm.action = "/hajota/qnaManager.go";
		allqnaFrm.method = "GET";
		allqnaFrm.submit();
	}
	
	// guest list 보기
	function goGuestqna() {		
		location.href="/hajota/qnaguestManager.go";
	}
	
	// host qna list 보기
	function goHostqna() {		
		location.href="/hajota/qnahostManager.go";
	}
	
</script>

<style>
 
table {
	width:100%;
	margin-bottom:10px;
}
table tr th, table tr td {
	padding:5px 10px; 
}
table tr th {
	background:#669999 none repeat-x scroll bottom left;
	color:#ffffff;
	border-top:2px solid black;
}
table tr td {
	border-bottom:1px solid #dddddd;
}
/* 
a, a:visited { 
	color:#CC0047;
} 
a:hover { 
	color:#990036; 
}
	
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

div.page-wrap {
	padding:20px;
	clear:both;
	background-color:#fff;
}
*/
 div.content {
	float:left;
	width:65%;
	padding-right:5px;
}
/*
div.content ul {
	font-size:0.9em;
	list-style:disc;
}
 div.content ul li {
	padding-bottom:5px;
}
 
*:focus {
	outline:none;
}
.clear {
	clear:both;
} */

/* 이건 버튼 부분 */
.btn3d {
    transition:all .08s linear;
    position:relative;
    outline:medium none;
    -moz-outline-style:none;
    border:0px;
    margin-right:10px;
    margin-top:15px;
}
.btn3d:focus {
    outline:medium none;
    -moz-outline-style:none;
}
.btn3d:active {
    top:9px;
}
.btn-default {
    box-shadow:0 0 0 1px #ebebeb inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #adadad, 0 8px 0 1px rgba(0,0,0,0.4), 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#fff;
}
.btn-primary {
    box-shadow:0 0 0 1px #428bca inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #357ebd, 0 8px 0 1px rgba(0,0,0,0.4), 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#428bca;
}
 .btn-success {
    box-shadow:0 0 0 1px #5cb85c inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #4cae4c, 0 8px 0 1px rgba(0,0,0,0.4), 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#5cb85c;
}
 .btn-info {
    box-shadow:0 0 0 1px #5bc0de inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #46b8da, 0 8px 0 1px rgba(0,0,0,0.4), 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#5bc0de;
}
.btn-warning {
    box-shadow:0 0 0 1px #f0ad4e inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #eea236, 0 8px 0 1px rgba(0,0,0,0.4), 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#f0ad4e;
}
.btn-danger {
    box-shadow:0 0 0 1px #c63702 inset, 0 0 0 2px rgba(255,255,255,0.15) inset, 0 8px 0 0 #C24032, 0 8px 0 1px rgba(0,0,0,0.4), 0 8px 8px 1px rgba(0,0,0,0.5);
    background-color:#c63702;
}
.btn-label {position: relative;left: -15px;display: inline-block;padding: 6px 12px;background: rgba(0,0,0,0.15);border-radius: 3px 0 0 3px;}
.btn-labeled {padding-top: 0;padding-bottom: 0;}
.btn { margin-bottom:10px; }

</style> 

<div style="background-color: none; width:100%;">
	<span style="font-size: 25px; font-weight: bold;">
	   <img src="<%= request.getContextPath() %>/resources/images/HSSH/managericon.png" style="width: 50px; height: 50px;" />
	Q&A 전체 페이지</span>  
</div>
<br/>
<div id="line" style="position:relative; top:15%; background-color:navy; height: 3px; width:160%;"> 
	
</div>

<div class="container" style="background-color: none; width:70%; height:100%; margin-left:0%;">  
    <div class="pagewidth" style="background-color: none; width:100%; margin-left:0%;">
	  <div style="background-color: none; width:100%; margin-top:10%; margin-left:0%;">
		<div class="content" style="background-color: none; width: 100%; margin-top: 80px; height: 600px; margin-left:0%; margin-right:100px;">
			<div style="margin-left : 20%; margin-top:-10%">
				<button type="button" style="height:25%;" class="btn btn-primary btn-lg btn3d btn-labeled" onClick="goAllqna();">전체 Q&A</button>
				<button type="button" class="btn btn-primary btn-lg btn3d btn-labeled" onClick="goGuestqna();">게스트 Q&A</button>
				<button type="button" class="btn btn-primary btn-lg btn3d btn-labeled" onClick="goHostqna();">호스트 Q&A</button>
			</div>
			
		<form name="allqnaFrm">
		     <table style="width: 1300px; margin-left: 140px; margin-top: 32px;">
		     	  <tr>
					<th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white;">번호</span></th>
					<th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white; margin-left:40px;">이메일</span></th>
					<th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white; margin-left:80px;">제목</span></th>
					<th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white; margin-left:22px;">날짜</span></th>
					<th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white; margin-left:0px;">삭제여부</span></th>
					<th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white; margin-left:0px;">답변여부</span></th>
				  </tr>
			
			    <c:if test="${allqnaList != null || not empty allqnaList}">
			    <c:forEach var="qna" items="${allqnaList}">
			
			      <tr>
			        	<td>${qna.SEQ_QUESTION}</td>
			        	<td>${qna.EMAIL}</td>
			       		<td><a href="<%= request.getContextPath() %>/qnadetail.go?seq=${qna.SEQ_QUESTION}">${qna.SUBJECT}</a></td>
			        	<td>${qna.WRITEDATE}</td> 
			        	<td><button type="button" style="width:40%; height:3%;" class="btn btn-danger" onClick="goDelete('${qna.SEQ_QUESTION}');">삭제</button></td>		        	
			        	<td>
				        	<c:if test="${qna.REPLYSTATUS==1}">		        	
				        	&nbsp;&nbsp;<span style="color: red;">답변완료</span>			        	
				        	</c:if>
				        	
				        	<c:if test="${qna.REPLYSTATUS==0}">			        	
				        	&nbsp;&nbsp;미답변			        	
				        	</c:if>		        	
			        	</td>
				  </tr>
				       
			      </c:forEach>
			       </c:if>
			       
			      <c:if test="${allqnaList == null || empty allqnaList}">
			      	<tr>
			      		<td colspan="6" style="margin-left:20%;">검색한 정보가 없습니다.</td>
			      	</tr>
			      
			      </c:if>		     
			 </table>
		</form>
		
</div>

  	 <!-- ===== 페이지바  ===== -->
	<div align="center" style="width: 20%; margin-left: 95%;">
		${pagebar}
	</div>
  	
	<br/>
	
	<!-- ===== 글검색 폼 추가 ===== -->
	
	<div align="center" style="width: 300px; margin-left: 300px; position: relative; display: inline-block; margin-top: -700px;">
	<form name="searchFrm" style="width:500px; margin-bottom: 50px; margin-top: -50px; margin-left: 150px;">
		<select name="colname" id="colname"  style="background-color:#7BA7AB; border-radius: 20px; color: white;" >
			<option value="email">이메일</option>
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

