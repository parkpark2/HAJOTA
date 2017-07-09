<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
    border-bottom: 1px solid #ddd;
}
tr:hover{background-color:#f5f5f5}

	.panel{
  padding-bottom:10px;
  margin-top:100px;
}	 		

</style>

<script type="text/javascript">
	function goWrite() {
		// 유효성 검사는 생략 하겠음.
		var writeFrm = document.writeFrm;
		writeFrm.action = "/hajota/addEnd.go";
		writeFrm.method = "post";
		writeFrm.submit();
	}
</script>

<div style="margin-left: 10%; display: inline-block; border: solid 0px red; margin-top: -30%; width: 70%;">
	<h1 style="font-weight: bold;">질문하기</h1>
	<div style="position:relative; display: inline-block;">
    <form name="writeFrm" >	
    
    
          
		<table id="table" > 
			<tr>
				<th>이메일</th>
				<td>
				    <input type="text" class="form-control" id="email" name="email" value="${sessionScope.loginuser.EMAIL}"/>
					
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" class="long" size="59" /></td>  
			</tr>
			<tr>
            	<th>내용</th>
            	<td><input type="text" name="content" class="long" style="height: 200px; width: 555px;"></td>
         	</tr>
         	
		</table>
		<br/>
 
		<button type="button" style="background-color: #5cb85c; border-color: #4cae4c; color: white;" class="btn" onClick="goWrite();">쓰기</button>
		<button type="reset" style="background-color: #5cb85c; border-color: #4cae4c; color: white;" class="btn">취소</button>
		<button type="button" style="background-color: #5cb85c; border-color: #4cae4c; color: white;" class="btn" onClick="javascript:history.back();">뒤로가기</button>
	</form>
	</div>
	
	<div style="opacity: 0.5; display: inline-block; margin-left: 70%; margin-top: -70%;">
	<img src="<%=request.getContextPath()%>/resources/images/ISJW/qna3.png">
	</div>

</div>	



