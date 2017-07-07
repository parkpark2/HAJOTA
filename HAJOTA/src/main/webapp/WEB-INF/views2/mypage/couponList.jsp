<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<head>

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
		<span style="font-size: 35px; font-weight: bold;">
		<img src="<%= request.getContextPath() %>/resources/images/ISJW/user2.png" style="margin-left:-14%; width: 50px; height: 50px;" />
		&nbsp;쿠폰 목록</span>
	</div>
	<div id="line"
		style="position: relative; top: 10px; background-color: navy; height: 3px; margin-left: 10%; width: 110%;"></div>
	
	<div style="padding-left: 10%; border: solid 0px red; margin-top: 2%; margin-left: 20%;">
	
	
	<table id="table" style="border: solid 0px red; margin-top: 30px; margin-left: -24%; width: 150%;">
		<tr>
			<th style="padding: 10px;">쿠폰번호</th>
			<th>이메일</th>
			<th>쿠폰명</th>
			<th>지급일</th>
			<th>만료일</th>
			<th>퍼센트</th> 
		</tr>
		
		<c:if test="${couponList == null || empty couponList}">
				<td colspan="6" style="text-align: center;">쿠폰이  없습니다</td>
		</c:if>
	
		<c:forEach var="coupon" items="${couponList}" varStatus="status">
		<tr>
			<td style="padding: 10px; align="center">${coupon.SEQ_COUPON}</td>
			<td align="center">${coupon.EMAIL}</td>
			<td align="center">${coupon.NAME}</td>
			<td align="center">${coupon.STARTDAY}</td>
			<td align="center">${coupon.ENDDAY}</td>
			<td align="center">${coupon.PERCENT} %</td>
		</tr>
		</c:forEach>
		
	</table>
	
	</div>
	
	
	<br/>
	
	<!-- ===== #115. 페이지바 보여주기 ===== -->
<%-- 	<div align="center" style="width: 400px; margin-left: 100px; margin-right: auto;">
		${pagebar}
	</div>
	<br/> --%>

</div>