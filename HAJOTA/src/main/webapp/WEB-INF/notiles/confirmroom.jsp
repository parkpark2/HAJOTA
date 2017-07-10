<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>숙소상세</title>
  
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link rel="stylesheet" href="<%= request.getContextPath()%>/resources/TypeofCss/HY/confirmroom.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>  
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

$(document).ready(function(){
	var roomp = document.getElementById("c_room_price").value;
	$("#updownprice").val(document.getElementById("people").value*parseInt(roomp/10));
	
	$("#add").click(function(){
		if(document.getElementById("people").value <15){
		document.getElementById("people").value = parseInt(document.getElementById("people").value) + 1
		$("#updownprice").val(document.getElementById("people").value*parseInt(roomp/10));
		}
		else{
			alert("최대인원입니다")
		}
	});
	$("#sub").click(function(){
		if(document.getElementById("people").value >=2){
		document.getElementById("people").value = document.getElementById("people").value - 1
		$("#updownprice").val(document.getElementById("people").value*parseInt(roomp/10));
		}
		else{
			alert("인원은 1명이상이여야합니다")
		}
	});
	
	$("#enddate").blur(function(){/* 숙소 체크인 체크아웃 차이 */
		var startarr = $("#startdate").val().split('-');
		var endarr = $("#enddate").val().split('-');
		var startdate = new Date(startarr[0],startarr[1],startarr[2]);
		var enddate = new Date(endarr[0],endarr[1],endarr[2]);
		var day = 1000*60*60*24;
		var diff = (enddate-startdate);
		var caldate = parseInt(diff/day);
		
		$("#dateprice").val(caldate*roomp);
	});
	
	$(".cal").click(function(){
		var updownprice = $("#updownprice").val();
		var depositprice = $("#depositprice").val();
		var cleanprice = $("#cleanprice").val();
		var dateprice = $("#dateprice").val();
		alert(updownprice);
		alert(depositprice);
		alert(cleanprice);
		alert(dateprice);
		$("#totalsaleprice").val(parseInt(updownprice)+parseInt(depositprice)+parseInt(cleanprice)+parseInt(dateprice));
		
	});
	
}); // end of $(document).ready()-----------------------------------

function goinsert(){
	
	var hostFrm = document.hostFrm;
	
	hostFrm.submit();
}
function resize(obj) {
	  obj.style.height = "1px";
	  obj.style.height = (12+obj.scrollHeight)+"px";
	}
var IMP = window.IMP; // 생략가능
IMP.init('imp27018068');

function gopay(){
IMP.request_pay({
    pg : 'kicc', //아임포트 관리자에서 기본PG만 설정하신 경우는 생략 가능
    pay_method : 'card', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)  ({},{})
    merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
    name : '주문명:결제테스트',
    amount : /* $("#totalsaleprice").val() */10,
    buyer_email : 'tiqmfh91@naver.com',
    buyer_name : '박효윤',
    buyer_tel : '010-9691-4788', //누락되면 카드사 인증에 실패할 수 있으니 기입해주세요
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456'
}, function(rsp) {
    if ( rsp.success ) {
    	var msg = '결제가 완료되었습니다.';
		msg += '\n고유ID : ' + rsp.imp_uid;
		msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		msg += '\결제 금액 : ' + rsp.paid_amount;
		msg += '카드 승인번호 : ' + rsp.apply_num;
		/* 이곳에서 insert를 처리하겟다. */

		alert(msg);
		insert();
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        
        alert(msg);
    }
});
}

function gopayphone(){
	
IMP.request_pay({
    pg : 'kicc', //아임포트 관리자에서 기본PG만 설정하신 경우는 생략 가능
    pay_method : 'phone', //card(신용카드), trans(실시간계좌이체), vbank(가상계좌), phone(휴대폰소액결제)
    merchant_uid : 'merchant_' + new Date().getTime(), //상점에서 관리하시는 고유 주문번호를 전달
    name : '주문명:결제테스트',
    amount : /* $("#totalsaleprice").val() */10,
    buyer_email : 'tiqmfh91@naver.com',
    buyer_name : '박효윤',
    buyer_tel : '010-9691-4788', //누락되면 카드사 인증에 실패할 수 있으니 기입해주세요 ({},{})
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456'
}, function(rsp) {
    if ( rsp.success ) {
    	var msg = '결제가 완료되었습니다.';
		msg += '\n고유ID : ' + rsp.imp_uid;
		msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		msg += '\결제 금액 : ' + rsp.paid_amount;
		msg += '카드 승인번호 : ' + rsp.apply_num;
		/* 이곳에서 insert를 처리하겟다. */
		
		alert(msg);
		insert();
		self.close();
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
        
        alert(msg);
        
    }
});
} 

function insert(){
	 var totalsaleprice = $("#totalsaleprice").val(); 
	 var people = $("#people").val(); 
	 var startdate = $("#startdate").val(); 
	 var enddate = $("#enddate").val(); 
	 var cupon = $("#coupon").val();
	 var email = $("#c_email").val();
	 var roomno = $("#c_roomno").val();
	 alert(email);
	 alert(roomno);
	 alert(cupon);
	 alert(startdate);
	 alert(enddate);
	 alert(people);
	 alert(totalsaleprice);
	 
	 
	 $.ajax({
		 
		url : "/hajota/addtrip.go",
		data : {email : email,
				roomno : roomno,
				cupon : cupon,
				startdate : startdate,
				enddate : enddate,
				people : people,
				totalsaleprice : totalsaleprice},
		dataType : "JSON",
		success : function(){
			alert("결제완료");
		},
		error : function(){
			alert("결제실패");
		}
	 });
	 
	
	
}

    </script>

  
</head>

<body>
  <!-- multistep form -->
<form id="msform" name="msform" >
  <!-- progressbar -->
  <ul id="progressbar">
    <li class="active">STEP1</li>
    <li>STEP2</li>
    <li>STEP3</li>
    
  </ul>
  <!-- fieldsets -->
  <!-- 인원수 별가격 -->
  <fieldset>
    <h2 class="fs-title">인원수는?</h2>
    <h3 class="fs-subtitle">This is step 1</h3>
    <button style="width: 30px; height: 30px; border: none; background: none; position: absolute; margin-left: -10%; margin-top: 3%;" type="button" id="sub"><img style="width: 30px; height: 30px;" src="<%=request.getContextPath() %>/resources/images/JHHY/minus.png"></button>
    <input style="width: 60px; text-align: center; " type="text" id="people" name="people"  min="1" max="15" value="1" size="10" readonly />
    <button style="width: 30px; height: 30px; border: none; background: none; position: absolute; margin-left: 1%; margin-top: 2.9%;" id="add" type="button"><img style="width: 30px; height: 30px;" src="<%=request.getContextPath() %>/resources/images/JHHY/add.png"></button>
	<input type="text" id="updownprice" />
	<select id="coupon">
	<c:forEach var="cupon" items="${cuponlist}">
	<option value="${cupon.couponno}"> ${cupon.name} , ${cupon.percent}% , ${cupon.endday}</option>
	</c:forEach>
	</select>
	
    <input type="button" style="margin-left: 0%" name="next" class="next action-button" value="Next" />
  </fieldset>
  <!-- fieldsets -->
  <!-- 날짜 -->
  <fieldset>
    <h2 class="fs-title">날짜는?</h2>
    <h3 class="fs-subtitle">This is step 2</h3>
    checkin : <input type="date" id="startdate" name="startdate" />
    checkout : <input type="date" id="enddate" name="enddate" />
    <input type="text" id="dateprice" />
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button cal" value="Next" />
    
  </fieldset>
  <!-- fieldsets -->
  <!-- 총계산 -->
  <fieldset>
    <h2 class="fs-title">총가격은?</h2>
    <h3 class="fs-subtitle">This is step 3</h3>
         보증금 : <input type="text" id="depositprice" value="${depositprice}" />
         청소비 : <input type="text" id="cleanprice" value="${cleanprice}" />
    <input type="text" id="totalsaleprice" name="totalsaleprice"  />
	<button type="button"  style="width: 30px; height: 30px;" onclick="gopay();">카드</button>
	<button type="button"  style="width: 30px; height: 30px;" onclick="gopayphone();">핸드폰</button>
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="submit" name="submit" class="submit action-button" value="Submit" onclick="goaddd();"  />
    </fieldset>
    <input type="hidden" id="c_email" name="email" value="${email}" />
	<input type="hidden" id="c_roomno" name="roomno" value="${roomno}" />
	<input type="hidden" id="c_cuponseq" name="cuponseq" value="${cupon}" />
	<input type="hidden" id="c_totalprice" name="totalprice" value="${totalprice}" />
	<input type="hidden" id="c_depositprice" name="depositprice" value="${depositprice}" />
	<input type="hidden" id="c_room_price" name="room_price" value="${roomprice}" />
	<input type="hidden" id="c_cleanprice" name="cleanprice" value="${cleanprice}" />
  <script src="<%= request.getContextPath()%>/resources/js/HY/index.js"></script>
</form>
<form id="payroomfrm" name="payroomfrm" >
    <input type="hidden" id="c_email" name="email" value="${email}" />
	<input type="hidden" id="c_roomno" name="roomno" value="${roomno}" />
    <input type="hidden" id="totalsaleprice" name="A_totalsaleprice"  />  
    <input type="hidden" id="people" name="A_people">
    <input type="hidden" id="startdate" name="A_startdate" />
    <input type="hidden" id="enddate" name="A_enddate" />
    <input type="hidden" name="couponno"  />
  </form>  

</body>
</html>
