<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<title>EVENT</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <meta name=description content="">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
  <!-- <link rel="import" href="http://www.polymer-project.org/components/paper-ripple/paper-ripple.html"> -->
  <link rel="import" href="https://www.polymer-project.org/0.5/components/paper-ripple/paper-ripple.html">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/TypeofCss/HS/style.css">
  <%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/TypeofCss/HS/meterial.css">--%>    
  <script src="<%=request.getContextPath() %>/resources/js/HS/jquery-2.1.3.min.js"></script>
  
 <script type="text/javascript">
 
     $(document).ready(function(){
    	 
        $("#couponbtn").hide();
        
     });
     
     function getCoupon(){
 			
		var bool = confirm("쿠폰을 받으시겠습니까?");
		
	    if(bool) {
	    	var percentFrm = document.percentFrm;
	    	percentFrm.filename.value = "coupon";
	    	percentFrm.action = "getCoupon.go";
	    	percentFrm.method = "post";
	    	percentFrm.submit();
	    }
 				
 	}
     
  </script>
  
</head>



<style>
html,body,h1,h2,h3,h4 {font-family:"Lato", sans-serif}
.mySlides {display:none}
.w3-tag, .fa {cursor:pointer}
.w3-tag {height:15px;width:15px;padding:0;margin-top:6px}
</style>


<body>

<!-- Links (sit on top) -->
<div class="w3-top" style="margin-top: 65px;">
  <div class="w3-row w3-large w3-light-green">
    <div class="w3-col s3">
      <a href="#" class="w3-button w3-block">TOP</a>
    </div>
    <div class="w3-col s3">
      <a href="#about2" class="w3-button w3-block">사다리게임</a>
    </div>
    <div class="w3-col s3">
      <a href="#plans" class="w3-button w3-block">돌려돌려</a>
    </div>
    <div class="w3-col s3">
      <a href="#contact" class="w3-button w3-block">생일이벤트</a>
    </div>
  </div>
</div>

<!-- 맨위 -->
<div class="w3-content" style="max-width:1100px;margin-top:80px;margin-bottom:80px">

  <div class="w3-panel">
    <h1><b>EVENT</b>    
      <i class="fa fa-cloud w3-text-blue w3-jumbo"></i> 
    </h1>
    <p>www.HAJOTA.com</p>
  </div>

<div class="w3-row-padding" style="margin-top:-100px;">
<div class="w3-center w3-padding-64">
      <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">이달의 할인 숙소</span>
</div>
  <div class="w3-third w3-margin-bottom">
      <div class="w3-card-4">
        <img src="<%=request.getContextPath() %>/resources/images/HSSH/event1.jpg" alt="John" style="width:100%">
        <div class="w3-container">
          <h3>I SETTE CONI</h3>
          <p class="w3-opacity">₩ 150,000</p>
          <p class="w3-large"><i class="fa fa-bath"></i> <i class="fa fa-phone"></i> <i class="fa fa-wifi"></i> <i class="fa fa-tv"></i> <i class="fa fa-glass"></i> <i class="fa fa-cutlery"></i></p>
          <p><button class="w3-button w3-light-grey w3-block">할인 숙소 보기</button></p>
        </div>
      </div>
    </div>

    <div class="w3-third w3-margin-bottom">
      <div class="w3-card-4">
        <img src="<%=request.getContextPath() %>/resources/images/HSSH/event2.jpg" alt="Mike" style="width:100%">
        <div class="w3-container">
          <h3>라마다 호텔 & 스위트</h3>
          <p class="w3-opacity">₩ 300,000</p>
          <p class="w3-large"><i class="fa fa-bath"></i> <i class="fa fa-phone"></i> <i class="fa fa-wifi"></i> <i class="fa fa-tv"></i> <i class="fa fa-glass"></i> <i class="fa fa-cutlery"></i></p>
          <p><button class="w3-button w3-light-grey w3-block">할인 숙소 보기</button></p>
        </div>
      </div>
    </div>

    <div class="w3-third w3-margin-bottom">
      <div class="w3-card-4">
        <img src="<%=request.getContextPath() %>/resources/images/HSSH/event3.jpg" style="width:100%">
        <div class="w3-container">
          <h3>JW 메리어트 동대문 스퀘어</h3>
          <p class="w3-opacity">₩ 70,000</p>
          <p class="w3-large"><i class="fa fa-bath"></i> <i class="fa fa-phone"></i> <i class="fa fa-wifi"></i> <i class="fa fa-tv"></i> <i class="fa fa-glass"></i> <i class="fa fa-cutlery"></i></p>
          <p><button class="w3-button w3-light-grey w3-block">할인 숙소 보기</button></p>
        </div>
      </div>
    </div>
  </div>
 </div>  
  
  <!-- 돌려돌려돌려판 -->
  <div class="w3-row-padding" id="plans">
	    <div class="w3-center w3-padding-64" style="margin-left: 30px;">
	      <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">돌려돌려판</span>
	      <c:if test="${dolGame == 1 }">
	      <input type='button' class="btn btn-primary" value='>>>START' id='spin' style="margin-left: 33px;"></input>
	      </c:if>
	  	</div>
	  	
  <c:if test="${dolGame == 0 }"> <!-- 이벤트종료  -->  
  <div >
		<span class="w3-xlarge w3-padding-16" style="color: #ea6153; margin-left: 43%;">이벤트가 종료되었습니다.</span>
    
  </div>
  </c:if>
  
  <c:if test="${dolGame == 1 }"> <!-- 이벤트사용중  -->  
  
     <c:if test="${dolWanrle == 0}"><!-- 이벤트참여無  -->  
	 <canvas id="canvas" width="500" height="500" style="margin-left: 37%;"></canvas>
	 
	 
	<form name="percentFrm">
		<input type="hidden" name="percent" id="coupon" />
		<input type="hidden" name="filename" />
	</form>
	 
 
  	 <img src="<%=request.getContextPath() %>/resources/images/HSSH/niddle.png" style=" height: 50px; margin-left: 49.6%; margin-top: -49.5%; position: relative; z-index: 1;">
     <input type='button' class="btn btn-success" id='couponbtn' value='>>>쿠폰받기' onclick="getCoupon();" style="margin-left: -5%; width: 10%; height: 50px;"></input>
  	 </c:if>
	  
	  <c:if test="${dolWanrle != 0}"> <!-- 이벤트참여有  -->  
	  <div>
			<span class="w3-xlarge w3-padding-16" style="color: #ea6153; margin-left: 41%;">이벤트에 이미 참여하셨습니다.</span>
	  </div>
	  </c:if>	
  		
  </c:if>
  
  </div> 
  
  <!-- 사다리 게임 -->
<div class="w3-row-padding" id="about2" style="margin-top:100px;">
<div class="w3-row w3-container">
<div class="w3-center w3-padding-64">
      <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">사다리 게임</span>
</div>
</div>
</div>

<c:if test="${sadaliGame == 1 }"> <!-- 이벤트사용중  --> 

	<c:if test="${sadaliWanrle == 0}"><!-- 이벤트참여無  -->  
		<div style="margin-top: 100px;">
		
		   <div class="start-form">     
		        <div class="landing-form">
		            <div class="group" >      
		              <input type="hidden" name="member" value="7" required>
		                    
		                <div id="button" style="margin-top: -450px; margin-left: 1050px;">
		                <button type="button" class="btn btn-primary">
		                  <div class="center" fit>>>>START</div>
		                  <paper-ripple fit></paper-ripple>
		                 </button> 
		                </div>
		            </div>
		        </div>
		   </div>		
		
		    <div id="ladder" class="ladder">
		        <div class="dim"></div>
		         <canvas class="ladder_canvas" id="ladder_canvas"></canvas>
		    </div>
		<script src="<%=request.getContextPath()%>/resources/js/HS/ladder.js"></script>		
		</div>
	</c:if>
	
	  <c:if test="${sadaliWanrle != 0}"> <!-- 이벤트참여有  -->  
	  <div>
			<span class="w3-xlarge w3-padding-16" style="color: #ea6153; margin-left: 42%;">이벤트에 이미 참여하셨습니다.</span>
	  </div>
	  </c:if>
	
</c:if>

  <c:if test="${sadaliGame == 0 }"> <!-- 이벤트종료  -->  
  <div >
		<span class="w3-xlarge w3-padding-16" style="color: #ea6153; margin-left: 43%;">이벤트가 종료되었습니다.</span>
  </div>
  </c:if>
  

  <!-- 생일이벤트 -->
  <div class="w3-center w3-padding-64"  style="margin-top: 10%;" id="contact">
    <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">생일이벤트</span>
  </div>


<img alt="생일이벤트" src="<%= request.getContextPath() %>/resources/images/HSSH/birthday.jpg" style="margin-left: 35%; margin-bottom: 3%;">



<script>

// 룰렛
var options = ["50%할인", "꽝!!", "30%할인", "꽝!!", "10%할인", "꽝!!", "20%할인" ,"꽝!!"];

var startAngle = 0;
var arc = Math.PI / (options.length / 2);
var spinTimeout = null;

var spinArcStart = 10;
var spinTime = 0;
var spinTimeTotal = 0;

var ctx;

document.getElementById("spin").addEventListener("click", spin);

function byte2Hex(n) {
  var nybHexString = "0123456789ABCDEF";
  return String(nybHexString.substr((n >> 4) & 0x0F,1)) + nybHexString.substr(n & 0x0F,1);
}

function RGB2Color(r,g,b) {
	return '#' + byte2Hex(r) + byte2Hex(g) + byte2Hex(b);
}

function getColor(item, maxitem) {
  var phase = 0;
  var center = 128;
  var width = 127;
  var frequency = Math.PI*2/maxitem;
  
  red   = Math.sin(frequency*item+2+phase) * width + center;
  green = Math.sin(frequency*item+0+phase) * width + center;
  blue  = Math.sin(frequency*item+4+phase) * width + center;
  
  return RGB2Color(red,green,blue);
}

function drawRouletteWheel() {
  var canvas = document.getElementById("canvas");
  if (canvas.getContext) {
    var outsideRadius = 200;
    var textRadius = 160;
    var insideRadius = 125;

    ctx = canvas.getContext("2d");
    ctx.clearRect(0,0,500,500);

    ctx.strokeStyle = "black";
    ctx.lineWidth = 2;

    ctx.font = 'bold 12px Helvetica, Arial';

    for(var i = 0; i < options.length; i++) {
      var angle = startAngle + i * arc;
      //ctx.fillStyle = colors[i];
      ctx.fillStyle = getColor(i, options.length);

      ctx.beginPath();
      ctx.arc(250, 250, outsideRadius, angle, angle + arc, false);
      ctx.arc(250, 250, insideRadius, angle + arc, angle, true);
      ctx.stroke();
      ctx.fill();

      ctx.save();
      ctx.shadowOffsetX = -1;
      ctx.shadowOffsetY = -1;
      ctx.shadowBlur    = 0;
      ctx.shadowColor   = "rgb(220,220,220)";
      ctx.fillStyle = "black";
      ctx.translate(250 + Math.cos(angle + arc / 2) * textRadius, 
                    250 + Math.sin(angle + arc / 2) * textRadius);
      ctx.rotate(angle + arc / 2 + Math.PI / 2);
      var text = options[i];
      ctx.fillText(text, -ctx.measureText(text).width / 2, 0);
      ctx.restore();
    } 

    //Arrow
    ctx.fillStyle = "black";
    ctx.beginPath();
    ctx.moveTo(250 - 4, 250 - (outsideRadius + 5));
    ctx.lineTo(250 + 4, 250 - (outsideRadius + 5));
    ctx.lineTo(250 + 4, 250 - (outsideRadius - 5));
    ctx.lineTo(250 + 9, 250 - (outsideRadius - 5));
    ctx.lineTo(250 + 0, 250 - (outsideRadius - 13));
    ctx.lineTo(250 - 9, 250 - (outsideRadius - 5));
    ctx.lineTo(250 - 4, 250 - (outsideRadius - 5));
    ctx.lineTo(250 - 4, 250 - (outsideRadius + 5));
    ctx.fill();
  }
}

function spin() {
  spinAngleStart = Math.random() * 10 + 10;
  spinTime = 0;
  spinTimeTotal = Math.random() * 3 + 4 * 4000;
  rotateWheel();
}

var text;

function rotateWheel() {
  spinTime += 30;
  if(spinTime >= spinTimeTotal) {
    stopRotateWheel();
    if(text != "꽝!!"){
    	$("#coupon").val(text);
    	$("#couponbtn").show();
    }
    else{
    	$("#coupon").val("");	
    }
    return;
  }
  var spinAngle = spinAngleStart - easeOut(spinTime, 0, spinAngleStart, spinTimeTotal);
  startAngle += (spinAngle * Math.PI / 180);
  drawRouletteWheel();
  spinTimeout = setTimeout('rotateWheel()', 30);
}

function stopRotateWheel() {
  clearTimeout(spinTimeout);
  var degrees = startAngle * 180 / Math.PI + 90;
  var arcd = arc * 180 / Math.PI;
  var index = Math.floor((360 - degrees % 360) / arcd);
  ctx.save();
  ctx.font = 'bold 30px Helvetica, Arial';
  text = options[index] 
  ctx.fillText(text, 250 - ctx.measureText(text).width / 2, 250 + 10);
  ctx.restore();

}

function easeOut(t, b, c, d) {
  var ts = (t/=d)*t;
  var tc = ts*t;
  return b+c*(tc + -3*ts + 3*t);
}

drawRouletteWheel();
</script>

</body>

 