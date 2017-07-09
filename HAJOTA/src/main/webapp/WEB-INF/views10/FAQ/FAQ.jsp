<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
    padding: 15px; 
    text-align: left;
    border-bottom: 1px solid #ddd;
}
tr:hover{background-color:#f5f5f5}

.panel{
  padding-bottom:10px;
  margin-top:100px;
}
        
</style>

<div>
     <span style="font-size: 35px; font-weight: bold;"><img src="<%= request.getContextPath() %>/resources/images/ISJW/user2.png" style="width: 50px; height: 50px; margin-left:13%;" />&nbsp;FAQ</span>
</div>
<div id="line"
		style="position: relative; top: 10px; background-color: #5cb85c; height: 3px; margin-left: 20%;"></div>

	<div style="padding-left: 10%; margin-top: -3%; margin-left: 20%;" >
	
	<table id="table" style="margin-top: 30px; margin-left: -14%; width: 114%;" > 
			
			<tr>			
				<td><img src="<%=request.getContextPath()%>/resources/images/ISJW/FAQimage.png" width="3%;" height="8%;"><a href="<%= request.getContextPath() %>/FAQdetail.go">&nbsp;호스트로서 확정된 예약을 어떻게 변경하나요?</a></td></br>
			</tr>
			<tr>
				<td><img src="<%=request.getContextPath()%>/resources/images/ISJW/FAQimage.png" width="3%;" height="8%;"><a href="">&nbsp;예약 요금은 어떻게 결정되나요?</a></td>
			</tr>
			<tr>
				<td><img src="<%=request.getContextPath()%>/resources/images/ISJW/FAQimage.png" width="3%;" height="8%;"><a href="">&nbsp;환불 정책이 무엇인가요?</a></td>
			</tr>
			<tr>
				<td><img src="<%=request.getContextPath()%>/resources/images/ISJW/FAQimage.png" width="3%;" height="8%;"><a href="">&nbsp;보증금은 어떻게 처리되나요?</a></td>
			</tr>
			<tr>
				<td><img src="<%=request.getContextPath()%>/resources/images/ISJW/FAQimage.png" width="3%;" height="8%;"><a href="">&nbsp;예약을 취소하려면 어떻게 하나요?</a></td>
			</tr>
			<tr>
				<td><img src="<%=request.getContextPath()%>/resources/images/ISJW/FAQimage.png" width="3%;" height="8%;"><a href="">&nbsp;해결 센터란 무엇인가요?</a></td>
			</tr>
			<tr>
				<td><img src="<%=request.getContextPath()%>/resources/images/ISJW/FAQimage.png" width="3%;" height="8%;"><a href="">&nbsp;정상참작이 가능한 상황 정책이란 무엇인가요?</a></td>
			</tr>
			
			

	</table>
	</br>
	</br>
	<div style="border: solid 0px red; text-align: center; margin-left: -16%;">
          <button type="button" style="background-color: #5cb85c; border-color: #4cae4c; color: white;" class="btn" onClick="javascript:history.back();">뒤로가기</button>&nbsp;
    </div>      
</div>





