<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="<%= request.getContextPath() %>/resources/js/JW/jquery-2.0.0.js"></script>

<style type="text/css">
table {
    border-collapse: collapse;
    width: 90%;
}
th{background-color: #2980b9;
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


</script>
</head>


	<div>
		<span style="font-size: 35px; font-weight: bold;"><img src="<%= request.getContextPath() %>/resources/images/ISJW/user2.png" style="width: 50px; height: 50px; margin-left:-14%;" />&nbsp;나의 이용후기</span>
	</div>
	<div id="line"
		style="position: relative; top: 10px; background-color: navy; height: 3px; margin-left: 10%; width: 110%;"></div>

	<div style="padding-left: 10%; border: solid 0px red; margin-top: 2%; margin-left: 20%;" >
	
	<table id="table" style="margin-top: 30px; margin-left: -24%; width: 150%;"> 
		<tr>
			<th>후기번호</th>
			<th>이메일</th>
			<th>결제번호</th>
			<th>별점</th>
			<th>코멘트</th>
		</tr>
		
		<c:if test="${reviewList == null || empty reviewList}">
				<td colspan="5" style="text-align: center;">이용후기가 없습니다</td>
		</c:if>
		
		<c:forEach var="review" items="${reviewList}" varStatus="status">
		<tr>
			<td align="center">${review.SEQ_REVIEW}</td>
			<td align="center">${review.EMAIL}</td>
			<td align="center">${review.SEQ_PAYMENT}</td>
			<td align="center">${review.SCORE}</td>
			<td align="center">${review.COMMENT}</td>
						

		</tr>
		</c:forEach>
	</table>
	
	</div>
	
	
	<br/>
	
	<!-- ===== #115. 페이지바 보여주기 ===== -->
	<div align="center" style="width: 400px; margin-left: 100px; margin-right: auto;">
		${pagebar}
	</div>
	<br/>
	
</div>