<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">
	table, th, td, input, textarea {border: solid gray 1px;}
	
	#table {border-collapse: collapse;
	 		width: 600px;
	 		}
	#table th, #table td{padding: 5px;}
	#table th{width: 120px; background-color: #DDDDDD;}
	#table td{width: 480px;}
	.long {width: 470px;}
	.short {width: 120px;} 		

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

<div style="padding-left: 10%; border: solid 0px red;">
	<h1>질문하기</h1>
	
	<%-- 
	<form name="writeFrm" action="<%= request.getContextPath() %>/addEnd.action" method="post"> 
	--%>
	<!-- ===== #132. 파일첨부하기
	              먼저 위의 문장을 주석처리한 후 아래와 같이 한다.
	            enctype="multipart/form-data" 을 해주어야만 파일첨부가 된다.!!! ===== -->
    <form name="writeFrm" enctype="multipart/form-data">	      
		<table id="table">
			<tr>
				<th>이메일</th>
				<td>
				    <input type="text" class="form-control" id="email" name="email" value="${sessionScope.loginuser.EMAIL}" readonly />
					
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" class="long" /></td>
			</tr>
			<tr>
            	<th>내용</th>
            	<td><textarea name="content" class="long" style="height: 200px;"></textarea></td>
         	</tr>
         	
         	<!-- ===== #133. 파일첨부 타입 추가하기 ===== -->
         	<!-- <tr>
         		<th>파일첨부</th>
         		<td><input type="file" name="attach" /></td>
         	</tr> -->
         	
		</table>
		<br/>
		
		<!-- ===== #120. 답변글쓰기인 경우
		                   부모글의 seq 값인 fk_seq 값과
		                   부모글의 groupno 값과
		                   부모글의 depthno 값을 hidden 타입으로 보내준다. ===== -->
		<input type="hidden" name="fk_seq"  value="${fk_seq}" />                   		
		<input type="hidden" name="groupno" value="${groupno}" />
		<input type="hidden" name="depthno" value="${depthno}" />

		<button type="button" onClick="goWrite();">쓰기</button>
		<button type="button" onClick="javascript:history.back();">취소</button>
	</form>

</div>	



