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
		<span style="font-size: 35px; font-weight: bold; "><img src="<%= request.getContextPath() %>/resources/images/ISJW/user2.png" style="margin-left:-10%; width: 50px; height: 50px;" />&nbsp;WISH-LIST</span>
	</div>
	<div id="line"
		style="position: relative; top: 10px; background-color: navy; height: 3px; margin-left: 14%; width: 95%;"></div>

	<div style="padding-left: 10%; border: solid 0px red; margin-top: 2%; margin-left: 24%;" >
	
	<table id="table" style="margin-top: 30px; margin-left: -24%; width: 130%;"> 
		<tr>
			<th>위시번호</th>
			<th>숙소번호</th>
			<th>이메일</th>
		</tr>
		
		<c:if test="${wishList == null || empty wishList}">
				<td colspan="3" style="text-align: center;">wish-list 가 없습니다</td>
		</c:if>
		
		
			<c:forEach var="wish" items="${wishList}" varStatus="status">
				<tr>
					<td align="center">${wish.SEQ_LODGE_WISH}</td>
					<td align="center">${wish.SEQ_LODGE}</td>
					<td align="center">${wish.EMAIL}</td>
				</tr>
			</c:forEach>
		

		</table>
	
	</div>
	
</div>	
	<br/>
	
	<!-- ===== #115. 페이지바 보여주기 ===== -->
	<div align="center" style="width: 400px; margin-left: 100px; margin-right: auto;">
		${pagebar}
	</div>
	<br/>
	
	