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
	
	// host list 보기
	function goAllqna() {		
		location.href="/hajota/qnaManager.go";
	}
	
	// guest list 보기
	function goGuestqna() {		
		location.href="/hajota/qnaguestManager.go";
	}
	
	// 전체 host list 보기
	function goHostqna() {
		var hostqnaFrm = document.hostqnaFrm;
		
		hostqnaFrm.action = "/hajota/qnahostManager.go";
		hostqnaFrm.method = "GET";
		hostqnaFrm.submit();
	}
	
	// 게스트 qna를 삭제하는 함수
	function goDelete(seq_question) {
		
		alert("정말 삭제하시겠습니까?");
		var deleteFrm = document.deleteFrm;
		deleteFrm.seq_question.value = seq_question;
		
		deleteFrm.action = "/hajota/hostqnadeleteManager.go";
		deleteFrm.method = "POST";
		deleteFrm.submit();
	}
	
	// 검색하는 메소드
	function goSearch(){
		
		var searchFrm = document.searchFrm;
		
		var search = $("#search").val();
		
		if(search.trim() == "") {
			alert("검색어를 입력하세요!!");
		}
		else {
			searchFrm.action = "/hajota/qnahostManager.go";
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

<div style="background-color: none; width:100%;">
	<span style="font-size: 25px; font-weight: bold;">Q&A 호스트 페이지</span>  
</div>
<br/>
<div id="line" style="position:relative; top:15%; background-color:navy; height: 3px; width:160%;"> 
	
</div>

<div class="container" style="background-color: none; width:70%; height:100%; margin-left:0%;">  
    <div class="pagewidth" style="background-color: none; width:100%; margin-left:0%;">
	  <div style="background-color: none; width:100%; margin-top:10%; margin-left:0%;">
		<div class="content" style="background-color: none; width: 100%; margin-top: 80px; height: 600px; margin-left:0%; margin-right:100px;">
			<div style="margin-left : 20%; margin-top:-10%">
				<button type="button" class="btn btn-primary" onClick="goAllqna();">전체 Q&A</button>
				<button type="button" class="btn btn-primary" onClick="goGuestqna();">게스트 Q&A</button>
				<button type="button" class="btn btn-primary" onClick="goHostqna();">호스트 Q&A</button>
			</div>
			
		<form name="hostqnaFrm">
			<table style="width: 1300px; margin-left: 140px; margin-top: 40px;">
				<tr>
					<th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white;">번호</span></th>
					<th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white; margin-left:45px;">이메일</span></th>
					<th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white; margin-left:70px;">제목</span></th>
					<th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white; margin-left:35px;">내용</span></th>
					<th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white; margin-left:20px;">날짜</span></th>
					<th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white; margin-left:0px;">삭제여부</span></th>
					<th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white; margin-left:0px;">답변여부</span></th>
				</tr>
				
				<c:if test="${qnahostlist != null || not empty qnahostlist}">
					<c:forEach var="qnahost" items="${qnahostlist}">
						<tr>
							<td>${qnahost.SEQ_QUESTION}</td>
							<td>${qnahost.EMAIL}</td>
							<td>${qnahost.SUBJECT}</td>
							<td><a href="<%= request.getContextPath() %>/qnahostdetail.go?seq=${qnahost.SEQ_QUESTION}">${qnahost.CONTENT}</a></td>
							<td>${qnahost.WRITEDATE}</td>
							<td><button type="button" class="btn btn-primary" onClick="goDelete('${qnahost.SEQ_QUESTION}');">삭제</button></td>
							<td>
				        	<c:if test="${qnahost.REPLYSTATUS==1}">		        	
				        	&nbsp;&nbsp;답변완료			        	
				        	</c:if>
				        	
				        	<c:if test="${qnahost.REPLYSTATUS==0}">			        	
				        	&nbsp;&nbsp;미답변			        	
				        	</c:if>		        	
			        		</td>
						</tr>
					</c:forEach>
				</c:if>
				
				<c:if test="${qnahostlist == null || empty qnahostlist}">
			      	<tr>
			      		<td colspan="6" style="margin-left:200px;">검색한 정보가 없습니다.</td>
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
		<select name="colname" id="colname" >
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

