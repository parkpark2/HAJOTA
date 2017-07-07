<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</head>
<body>
	
	<div>
		<span style="font-size: 35px; font-weight: bold;"><img src="<%= request.getContextPath() %>/resources/images/ISJW/user2.png" style="margin-left:-14%; width: 50px; height: 50px;" />&nbsp;결제 목록</span>
	</div>
	<div id="line"
		style="position: relative; top: 10px; background-color: navy; height: 3px; margin-left: 10%; width: 110%;"></div>

	<div style="padding-left: 10%; margin-top: 2%; margin-left: 20%;" >
	
	<table id="table" style="margin-top: 30px; margin-left: -24%; width: 150%;"> 
		<tr>
			<th>결제번호</th>
			<th>숙소번호</th>
			<th>이메일</th>
			<th>체크인</th>
			<th>체크아웃</th>
			<th>숙박인원수</th>
			<th>쿠폰번호</th>
			<th>총금액</th>
			<th>결제일자</th>
		</tr>
		
		<c:if test="${paymentList == null || empty paymentList}">
				<td colspan="9" style="text-align: center;">결제목록이  없습니다</td>
		</c:if>
		
		
		<c:forEach var="payment" items="${paymentList}" varStatus="status">
		<tr>
			<td align="center">${payment.SEQ_PAYMENT}</td>
			<td align="center">${payment.SEQ_LODGE}</td>
			<td align="center">${payment.EMAIL}</td>
			<td align="center">${payment.CHECKIN_DATE}</td>
			<td align="center">${payment.CHECKOUT_DATE}</td>
			<td align="center">${payment.CHECKIN_PERSON} 명</td>
			<c:if test="${payment.SEQ_COUPON == null || empty paymentList.SEQ_COUPON}">
				<td align="center">등록 된 쿠폰이 없습니다</td>
			</c:if>
			
			<c:if test="${!payment.SEQ_COUPON == null}">
				<td align="center">${paymentList.SEQ_COUPON}</td>
			</c:if>
			
			<td align="center">${payment.TOTAL_SALEPRICE} 원</td>
			<td align="center">${payment.SALESDATE}</td>
			
			
			
			
			
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