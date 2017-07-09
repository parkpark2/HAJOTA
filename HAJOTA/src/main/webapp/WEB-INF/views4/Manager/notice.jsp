<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>
  <title>Bootstrap Example</title>
  <!-- <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1"> -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <%-- <link rel="" href="<%= request.getContextPath() %>/resources/TypeofCss/SH/board.css" type="text/css" /> --%>
</head>

<script type="text/javascript">

$(document).ready(function(){

	searchKeep();

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
		
	// 검색어 컬럼명을 유지시켜주는 메소드
	function searchKeep(){
		<c:if test="${not empty colname && not empty search}">
			$("#colname").val("${colname}"); // 검색어 컬럼명을 유지시켜 주겠다.
			$("#search").val("${search}");   // 검색어를 유지시켜 주겠다.
		</c:if>
	}
	
	// 공지사항을 삭제하는 메소드
	function goDelete(seq_notice) {
		alert('정말 삭제하시겠습니까?');
		var deleteFrm = document.deleteFrm;
		deleteFrm.seq_notice.value = seq_notice;

		deleteFrm.action = "/hajota/delete.go";
		deleteFrm.method = "POST";
		deleteFrm.submit();
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
	<span style="font-size: 25px; font-weight: bold;">공지사항 페이지</span>  
</div>
<br/>
<div id="line" style="position:relative; top:15%; background-color:navy; height: 3px; width:160%;"> 
	
</div>

<div class="container" style="background-color: none; width:70%; height:100%;">  
    <div class="pagewidth" style="background-color: none; width:100%; margin-left:0%;">
	  <div style="background-color: none; width:100%; margin-top:10%; margin-left:0%;">
		<div class="content" style="background-color: none; width: 100%; margin-top: 80px; height: 600px; margin-left:0%; margin-right:100px;">
		
		     <table style="width: 1300px; margin-left: -1%; margin-top: 2%;">
		     	  <tr>
			        <th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white;">번호</span></th>
			        <th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일</span></th>
			        <th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white; margin-left: 25px;">제목</span></th>
			        <th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white; margin-left: 25px;">내용</span></th>
			        <th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white; margin-left: 20px;">날짜</span></th>
			        <th><span style="font-size: 15px; color: black; font-weight: bold; text-align: center; color: white;">삭제여부</span></th>
			     </tr> 
			
			    <c:if test="${noticeList != null || not empty noticeList}">
			    <c:forEach var="notice" items="${noticeList}">
			
			      <tr>
			        	<td>${notice.SEQ_NOTICE}</td>
			        	<td>${notice.EMAIL}</td>
			        	<td>${notice.SUBJECT}</td>
			       		<td><a href="<%= request.getContextPath() %>/noticedetail.go?seq=${notice.SEQ_NOTICE}">${notice.CONTENT}</a></td>
			        	<td>${notice.WRITEDATE}</td>
			        	<td><button type="button" class="btn btn-primary" onClick="goDelete('${notice.SEQ_NOTICE}');">삭제</button></td>
				  </tr>
				       
			      </c:forEach>
			      </c:if>
			      
			      <c:if test="${noticeList == null || empty noticeList}">
			      	<tr>
			      		<td colspan="6" style="margin-left:200px;">검색한 정보가 없습니다.</td>
			      	</tr>
			      </c:if>
			 </table>
      </div>

  	 <!-- ===== 페이지바  ===== -->
	<div align="center" style="width: 20%; margin-left: 75%;">
		${pagebar}
	</div>

	<div style="margin-right: -100%;">
  		<button type="button" class="btn btn-primary" style="float: right; margin-top:-5%" onClick="javascript:location.href='<%= request.getContextPath() %>/noticewriteManager.go'">글쓰기</button>
  	</div>
  	
	<br/>
	
	<!-- ===== 글검색 폼 추가 ===== -->
	<div align="center" style="width: 300px; margin-left: 300px; position: relative; display: inline-block; margin-top: -700px;">
	<form name="searchFrm" style="width:500px; margin-bottom: 50px; margin-top: -50px; margin-left: 10%;">
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
		<input type="hidden" name="seq_notice" />
	</form>
	
</div>

</div>
</div>




