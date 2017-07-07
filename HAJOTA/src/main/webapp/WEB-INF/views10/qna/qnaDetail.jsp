<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<style type="text/css">
	table, th, td, input, textarea {border: solid gray 1px;}
	
	#table, #table2 {border-collapse: collapse;
	 		         width: 600px;
	 		        }
	#table th, #table td{padding: 5px;}
	#table th{width: 120px; background-color: #DDDDDD;}
	#table td{width: 480px;}
	.long {width: 470px;}
	.short {width: 120px;} 	
	
	a{text-decoration: none;}	

</style>

<script type="text/javascript">
    
    function goWrite(){
    	var addWriteFrm = document.addWriteFrm;
    	addWriteFrm.submit();
    }
    
</script>

<div style="position:relative; display:inline-block; border: solid 1px red; width: 1800px;">

<div style="padding-left:10%; display:inline-block; border: solid 0px red;">
	<h1>글내용보기</h1>
	
	<table id="table">
		<tr>
			<th>글번호</th>
			<td>${queinfo.SEQ_QUESTION}</td>
		</tr>
		<tr>
			<th>글제목</th>
			<td>${queinfo.SUBJECT}</td>
		</tr>
		<tr>
           	<th>글쓴이</th>
           	<td>${queinfo.EMAIL}</td>
        	</tr>
		<tr>
			<th>글내용</th>
			<td>${queinfo.CONTENT}</td>
		</tr>
		<tr>
			<th>작성날짜</th>
			<td>${queinfo.WRITEDATE}</td>
		</tr>
	</table>

	
	<br/>
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/questionList.go'">목록보기</button>
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/edit.go?seq=${queinfo.SEQ_QUESTION}'">수정</button>
	<button type="button" onClick="javascript:location.href='<%= request.getContextPath() %>/del.go?seq=${queinfo.SEQ_QUESTION}'">삭제</button>
		
		
	<br/>
	<br/>
	
	
	
	<!-- ===== #83. 댓글쓰기 폼 추가 ===== -->
	<form name="addWriteFrm" action="<%= request.getContextPath() %>/addComment.action" method="get">     
		     <input type="hidden" name="userid" value="${sessionScope.loginuser.userid}" readonly />
		 성명 : <input type="text" name="name" value="${sessionScope.loginuser.name}" class="short" readonly/>
	     댓글 : <input type="text" name="content" class="long" />
	    
	    <!-- 댓글에 달리는 원게시물 글번호(즉, 댓글의 부모글) -->
	    <input type="hidden" name="parentSeq" value="${boardvo.seq}" />    
	    
	    <button type="button" onClick="goWrite();" >쓰기</button>    
	</form>
	
	<br/>
	<br/>
	<!-- ===== #93. 댓글 내용 보여주기 ===== -->
	<table id="table2">
		<c:forEach var="commentvo" items="${commentList}">
			<tr>
				<td>${commentvo.name}</td>
				<td>${commentvo.content}</td>
				<td>${commentvo.regDate}</td>
			</tr>
		</c:forEach>
	</table>
</div>

<div style="display:inline-block;  position:absolute; " >
	<h1>답변글</h1>
	
	<table id="table" style="height: 164px;">
			<tr>
			<c:if test="${ansinfo != null || not empty ansinfo}">
				<td style="position: absolute; border: none; padding-left: 2%;" >${ansinfo.CONTENT}</td>
			</c:if>
			<c:if test="${ansinfo == null || empty ansinfo}">
				<td align="center">답변글이 없습니다</td>
			</c:if>
			</tr>
		</table>
</div>


</div>








