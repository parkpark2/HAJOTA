<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript">
$(document).ready(function(){

});

function goconfirmroom(){
	
	 var gsWin = window.open('about:blank','payviewer','width=500,height=500,top=500,left=500');
     var frm =document.tripFrm;
     frm.action = '/hajota/confirmroom.go';
     frm.target ="payviewer";
     frm.method ="get";
     frm.submit();
	
	
}


</script>

</head>
<body>
<div id="header" >

				<div class="top" style="height: 50%">

					 <!-- Logo -->
						<div id="logo">
							<span class="image avatar48"><img src="<%= request.getContextPath() %>/resources/images/JHHY/avatar.jpg" /></span>
							<h1 id="title">${listdetail.hostname}`S<br/> 아늑하고 편안한<br/> ${listdetail.roomname}</h1>
							<p></p>
						</div>
 
					<!-- Nav -->
						<nav id="nav">
							<!--

								Prologue's nav expects links in one of two formats:

								1. Hash link (scrolls to a different section within the page)

								   <li><a href="#foobar" id="foobar-link" class="icon fa-whatever-icon-you-want skel-layers-ignoreHref"><span class="label">Foobar</span></a></li>

								2. Standard link (sends the user to another page/site)

								   <li><a href="http://foobar.tld" id="foobar-link" class="icon fa-whatever-icon-you-want"><span class="label">Foobar</span></a></li>

							-->
							<ul>
								<li><a href="#top" id="top-link" class="skel-layers-ignoreHref"><span class="icon fa-home">개요</span></a></li>
								<li><a href="#portfolio" id="portfolio-link" class="skel-layers-ignoreHref"><span class="icon fa-th">숙소상세</span></a></li>
								<li><a href="#about" id="about-link" class="skel-layers-ignoreHref"><span class="icon fa-user">위치정보</span></a></li>
								<li><a href="#contact" id="contact-link" class="skel-layers-ignoreHref"><span class="icon fa-envelope">호스트</span></a></li>
							</ul>
						</nav>

				</div>
				<form name="tripFrm">
					  <button type="button" id="confirmroom" onclick="goconfirmroom();" style="margin-right: 30%; margin-bottom: 40%;">예약할래?</button>
					
		        <!-- 이메일 -->
				<input type="hidden" id="roomno" name="roomno" value="${listdetail.roomno}" /><!-- 숙소시퀀스 -->
				<input type="hidden" id="depositprice" name="depositprice" value="${listdetail.depositprice}" /><!-- 보증금 -->
				<input type="hidden" id="cleanprice" name="cleanprice" value="${listdetail.cleanprice}" /><!-- 청소비 -->
				<input type="hidden" id="roomprice" name="roomprice" value="${listdetail.roomprice}" /><!-- 1박숙박비 -->
				<input type="hidden" id="cuponseq" name="cuponseq" value="2" /><!-- 쿠폰시퀀스 -->
				<input type="hidden" id="totalprice" name="totalprice" value="${listdetail.totalprice}" /><!-- 총가격시퀀스 --> 
				</form>
				<div class="bottom" >

					<!-- Social Icons -->
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
							<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
							<li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
						</ul>

				</div>

			</div>

    
</body>
</html>