<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="<%= request.getContextPath() %>/resources/js/JW/jquery-2.0.0.js"></script>

<style type="text/css">

	.panel{
  padding-bottom:10px;
  margin-top:100px;
}

</style>
    
<div style="border: solid 0px red; margin-top: 20px; margin-left: 100px; width: 60%;">
    <h1><span style="font-weight: bold;">HAJOTA가 지원하는 결제 수단에는 어떤 것들이 있나요?</span></h1><br>
    
  결제용 계좌가 등록된 국가에 따라 지원되는 결제 수단이 다릅니다.<br><br>
  
  예약 요청을 보내기 전에 결제 페이지에서 이용 가능한 결제 수단을 모두 확인하실 수
  있습니다. 거주하시는 국가를 선택하면, 모든 결제 정보가 표시됩니다.<br><br>
  
  오프라인 또는 현금 결제는 서비스 약관에 위배되며  HAJOTA 계정이 해지되는
  사유가 될 수 있습니다. HAJOTA 사이트 밖에서 결제하면, 회원님의 정보를 보호할
  수 없고 사기 등 보안 문제가 발생할 수 있기 때문입니다.<br><br>
  
  결제 수단은 다음과 같습니다.<br><br>
  
● 주요 신용카드와 선불카드(비자, 마스터카드, 아멕스, 디스커버, JCB)<br>
● 직불카드 중에 신용 결제가 가능한 카드<br>
● 페이팔(일부 국가에 한함)<br>
● 알리페이(중국)<br>
● 포스트페이(이탈리아)<br>
● Sofort Uberweisung(독일)<br>
● iDEAL(네덜란드)<br>
● Boleto Bancario, Hipercard, Elo, Aura(브라질)<br>
● PayU(인도)<br>
● 구글 지갑(미국 안드로이드 앱)<br>
● 애플 페이(iOS 앱)<br><br>

<button type="button" class="btn" style="background-color: white; border-color: #00a699; color: #00a699; font-weight: bold;'">결제 수단 추가하기</button><br><br>

도움이 되었나요? <a><span style="color: #5cb85c; cursor:pointer;">예</span></a> 또는 <a><span style="color: #5cb85c; cursor:pointer;">아니요</span></a>

</div>