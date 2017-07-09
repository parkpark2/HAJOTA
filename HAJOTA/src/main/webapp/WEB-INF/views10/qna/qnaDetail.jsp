<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="<%= request.getContextPath() %>/resources/js/JW/jquery-2.0.0.js"></script>   
   
<style type="text/css">
table {
   border-collapse: collapse;
   width: 80%;
}
th{background-color: #5cb85c;
font-family: 'Helvetica Neue', Helvetica, Arial;
color: white;
 
}
th, td {
    padding: 8px;
    text-align: center;
    border: 1px solid gray;
}
tr:hover{background-color:#f5f5f5}

	.panel{
  padding-bottom:10px;
  margin-top:100px;
}

</style>

<script type="text/javascript">
    
    function goWrite(){
    	var addWriteFrm = document.addWriteFrm;
    	addWriteFrm.submit();
    }
    
</script>

<div style="position:relative; display:inline-block; border: solid 0px red; width: 1400px; margin-top: -330px; margin-left: 100px;">  

<div style="display:inline-block; border: solid 0px red; width: 40%;">
	<h1 style="font-size: 35px; font-weight: bold;">글내용보기</h1>
	
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
	<button type="button" style="background-color: #5cb85c; border-color: #4cae4c; color: white;" class="btn" onClick="javascript:location.href='<%= request.getContextPath() %>/questionList.go'">목록보기</button>
	<button type="button" style="background-color: #5cb85c; border-color: #4cae4c; color: white;" class="btn" onClick="javascript:location.href='<%= request.getContextPath() %>/edit.go?seq=${queinfo.SEQ_QUESTION}'">수정</button>
	<button type="button" style="background-color: #5cb85c; border-color: #4cae4c; color: white;" class="btn" onClick="javascript:location.href='<%= request.getContextPath() %>/del.go?seq=${queinfo.SEQ_QUESTION}'">삭제</button>
		
	<br/>
	<br/>
	
	
	
<%-- 	<!-- ===== #83. 댓글쓰기 폼 추가 ===== -->
	<form name="addWriteFrm" action="<%= request.getContextPath() %>/addComment.action" method="get">     
		     <input type="hidden" name="userid" value="${sessionScope.loginuser.userid}" readonly />
		 성명 : <input type="text" name="name" value="${sessionScope.loginuser.name}" class="short" readonly/>
	     댓글 : <input type="text" name="content" class="long" />
	    
	    <!-- 댓글에 달리는 원게시물 글번호(즉, 댓글의 부모글) -->
	    <input type="hidden" name="parentSeq" value="${boardvo.seq}" />    
	    
	    <button  type="button" onClick="goWrite();" >쓰기</button>    
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
	</table> --%>
</div>

<div style="display:inline-block; border: solid 0px red;  position:absolute; width: 60%; " >
	<h1 style="font-size: 35px; font-weight: bold;">답변글</h1>
	
	
	<table id="table" style="height: 164px; border: solid 0px red;">
			
			<c:if test="${ansinfo != null || not empty ansinfo}">
			
				<textarea rows="10" cols="50" style="border: solid 1px black; margin-left: 10%;" readonly> ${ansinfo.CONTENT}
				</textarea>
				
		
			</c:if>
			 <c:if test="${ansinfo == null || empty ansinfo}">
				<td align="center">답변글이 없습니다</td>
			</c:if>
			
		</table>
</div>


</div>








