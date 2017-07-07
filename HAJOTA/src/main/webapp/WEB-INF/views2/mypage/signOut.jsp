<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.panel{
  padding-bottom:20px;
  margin-top:100px;
}
</style>
<script type="text/javascript">

    documnent.ready(function(){
       
    });

    function signOut() {
       var signOutFrm = document.signOutFrm;
       
       signOutFrm.action = "/hajota/signOutEnd.go";
       signOutFrm.method = "POST";
       signOutFrm.submit();
    }

</script>

<body>
	<div>
		<div>
			<span style="font-size: 35px; font-weight: bold;"><img src="<%=request.getContextPath()%>/resources/images/ISJW/user2.png" style="width: 50px; height: 50px; margin-left:-15%;" />&nbsp;탈퇴 이유를 선택해주세요</span>
		</div>
		<div id="line" style="position: relative; top: 10px; background-color: navy; height: 3px; margin-left: 10%; width: 110%;"></div><br/>

			
		<div style="text-align: center; margin-top:5%; border: solid 0px red;">
		지금까지 이용해주셔서 감사드립니다!</br>
		<span style="color:red;">'탈퇴'</span>하시기 전 아래 유의사항을</br> 확인해주세요.
		<br/><br/><br/>
		</div>


		<div align="center" style="height: 300px;">
			<form name="signOutFrm" style="width: 100%; margin-right: 100px;">
				<c:if test="${list != null || not empty list}">
					<select style="height: 50px;" id="reason_value" name="reason_value">
						<c:forEach var="reason" items="${list}">

							<option style="background:black; color:white; font-size:14pt" value="${reason.SEQ_WITHDRAW_REASON}">${reason.WITHDRAW_REASON}</option>

						</c:forEach>
					</select>
				</c:if><button type="button" style="margin-left:80%;" class="btn btn-info" id="btneditUser" onclick="signOut();">탈퇴하기</button>
			</form>
		</div>
	</div>
</body>













