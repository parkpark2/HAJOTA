<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>숙소상세</title>
  
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link rel="stylesheet" href="<%= request.getContextPath()%>/resources/TypeofCss/HY/HY.css">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

$(document).ready(function(){

	$("#spinnerOqty").spinner({
	      spin: function( event, ui ) {
	        if( ui.value > 10 ) {
	          $( this ).spinner( "value", 0 ); 
	          return false;
	        } 
	        else if ( ui.value < 0 ) {
	          $( this ).spinner( "value", 10 );
	          return false;
	        }
	      }
	    });
	
	
	$("#spinnerOqty").bind("spinstop", function(){
		// 스핀너는 이벤트가 "change" 가 아니라 "spinstop" 이다.
		var html = "";
		
		var spinnerOqtyVal = $("#spinnerOqty").val();
		
		if(spinnerOqtyVal == "0") {
			$("#divfileattach").empty();
			return;
		}
		else
		{
			for(var i=0; i<parseInt(spinnerOqtyVal); i++) {
				html += "<br/>";
				html += "<input type='file' name='attach' class='btn btn-default' />";
			}
			
			$("#divfileattach").empty();
			$("#divfileattach").append(html);	
		}
	});
	
	$("#roomprice").focusin(function(){
		$(this).val("");
	});
	
	$("#roomprice").focusout(function(){
		if(regNum($(this).val())) {
			var totalprice = Number($("#roomprice").val()) + Number($("#depositprice").val()) +	Number($("#cleanprice").val());
			$("#totalprice").val(totalprice);
		}
		
		else {
			$(this).val("0");
		}
	});
	
	
	
	$("#depositprice").focusin(function(){
		$(this).val("");
	});
	
	$("#depositprice").focusout(function(){
		if(regNum($(this).val())) {
			var totalprice = Number($("#roomprice").val()) + Number($("#depositprice").val()) +	Number($("#cleanprice").val());
			$("#totalprice").val(totalprice);
		}
		
		else {
			$(this).val("0");
		}
	});
	
	
	
	$("#cleanprice").focusin(function(){
		$(this).val("");
	});
	
	$("#cleanprice").focusout(function(){
		if(regNum($(this).val())) {
			var totalprice = Number($("#roomprice").val()) + Number($("#depositprice").val()) +	Number($("#cleanprice").val());
			$("#totalprice").val(totalprice);
		}
		
		else {
			$(this).val("0");
		}
	});
	
}); // end of $(document).ready()-----------------------------------

function regNum(target) {
	var regNumber = /^[0-9]+$/;
	
	if(target == "") {
		alert("금액을 입력해야 합니다");
		return false;
	}
	
	else if(!regNumber.test(target)) {
		alert("숫자만 입력이 가능합니다");
		return false;
	}
	
	return true;
}

var testaddress ="";

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample4_roadAddress').value = fullRoadAddr;
            document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
            
            testaddress = fullRoadAddr;
            /*
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guide').innerHTML = '';
            }
            */
            getgeocode(testaddress);
        }
    }).open();
}
function getgeocode(testaddress){
	var url = "http://maps.googleapis.com/maps/api/geocode/json?address="+testaddress+"&language=ko&sensor=false"
	
	$.getJSON(url, function (data) {
	    for(var i=0;i<data.results.length;i++) {
	        var LAT1 = data.results[i].geometry.location.lat;
	        var LNG1 = data.results[i].geometry.location.lng;
			
			document.getElementById("LAT").value = LAT1;
			document.getElementById("LNG").value = LNG1;
	    }
	});
}
function gotest(){
	location.href="http://maps.googleapis.com/maps/api/geocode/json?address="+testaddress+"&language=ko&sensor=false";
}
function goinsert(){
	
	document.hostFrm.submit();
}
function resize(obj) {
	  obj.style.height = "1px";
	  obj.style.height = (12+obj.scrollHeight)+"px";
}

function insertLodge() {
	
}
function gosubmit(){
	var msform = document.msform;
	
	msform.action = "/hajota/rooms/insertEnd.go";
	msform.method = "POST";
	msform.submit();
}

</script>

<style>
	textarea {
		height: 200px;
		resize: none;
	}
</style>

</head>

<body>
  <!-- multistep form -->
<form id="msform" name ="msform" enctype="multipart/form-data">
  <!-- progressbar -->
  <ul id="progressbar">
    <li class="active"> </li>
    <li> </li>
    <li> </li>
    <li> </li>
    <li> </li>
    <li> </li>
    <li> </li>
  </ul>
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">첫 번째 단계</h2>
    <!-- <h3 class="fs-subtitle"></h3> -->
    <!-- <input type="text" name="email" placeholder="Email(이메일)" /> -->
         숙소 이름 :
    <input type="text" id="roomsname" name="roomsname" placeholder="숙소 이름" required="required"/>
         숙소 형태 : <select id="TYPE_LODGE" name="TYPE_LODGE" required="required">
	<option value="1">집전체</option>
	<option value="2">개인실</option>
	<option value="3">다인실</option>
	</select>
	건물 형태 : <select id="TYPE_BUILDING" name="TYPE_BUILDING" required="required">
	<option value="1">아파트</option>
	<option value="2">개인주택</option>
	<option value="3">빌딩</option>
	</select><br/>
	최대 인원 : <select id="maxpeople" name="maxpeople" required="required">
	<option value="1">1 명</option>
	<option value="2">2 명</option>
	<option value="3">3 명</option>
	<option value="4">4 명</option>
	<option value="5">5 명</option>
	<option value="6">6 명</option>
	<option value="7">7 명</option>
	<option value="8">8 명</option>
	<option value="9">9 명</option>
	<option value="10">10 명</option>
	<option value="11">11 명</option>
	<option value="12">12 명</option>
	<option value="13">13 명</option>
	<option value="14">14+ 명</option>
	</select><br/>
	
    <input type="button" name="next" class="next action-button" value="Next" />
  </fieldset>
  
  <fieldset>
    <h2 class="fs-title">두 번째 단계</h2>
    <!-- <h3 class="fs-subtitle"></h3> -->
    	<input type="hidden" id="sample4_postcode" placeholder="우편번호" readonly required="required">
    	<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" required="required"><br>
    	 도로명 주소:
		<input type="text" id="sample4_roadAddress" name="roadAddress" placeholder="도로명주소" readonly required="required">
		상세 주소:
		<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" required="required">
		<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소" readonly="readonly" required="required">
		<input type="hidden" id="LAT" name="LAT" value="" required="required">
		<input type="hidden" id="LNG" name="LNG" value="" required="required">
		<span id="guide" style="color:#999"></span>
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button" value="Next" />
    
  </fieldset>
  
  <fieldset>
    <h2 class="fs-title">세 번째 단계</h2>
    <!-- <h3 class="fs-subtitle"></h3> -->
       화장실 개수 : <select id="bathroomcount" name="bathroomcount" required="required">
			  <option value="1">1</option>
			  <option value="2">2</option>
			  <option value="3">3</option>
			  <option value="4">4</option>
			  <option value="5">5+</option>
			  </select> <br/>
	침실 개수 : <select id="bedroomcount" name="bedroomcount" required="required">
			  <option value="1">1</option>
			  <option value="2">2</option>
			  <option value="3">3</option>
			  <option value="4">4</option>
			  <option value="5">5</option>
			  <option value="6">6</option>
			  <option value="7">7+</option>
			</select> <br/>
	침대 개수 : <select id="bedcount" name="bedcount" required="required">
			  <option value="1">1</option>
			  <option value="2">2</option>
			  <option value="3">3</option>
			  <option value="4">4</option>
			  <option value="5">5</option>
			  <option value="6">6</option>
			  <option value="7">7</option>
			  <option value="8">8+</option>
			</select> <br/>
	<div>
	체크인 :
	<select id="checkinHour" name="checkinHour" style="width: 20%; display: inline-block;">
		<c:set var="n" value="0" />
		
		<c:forEach begin="0" end="23">
			<option value="${n}" >${n}</option>
			<c:set var="n" value="${n+1}" />
		</c:forEach>
	</select>
	<span>시</span>&nbsp;
	
	<select id="checkinMin" name="checkinMin" style="width: 20%; display: inline-block;">
		<c:set var="n" value="0" />
		
		<c:forEach begin="0" end="59">
			<option value="${n}" >${n}</option>
			<c:set var="n" value="${n+1}" />
		</c:forEach>
	</select>
	<span>분</span>
	</div>
	
	<div>
	체크아웃 :
	<select id="checkoutHour" name="checkoutHour" style="width: 20%; display: inline-block;">
		<c:set var="n" value="0" />
		
		<c:forEach begin="0" end="23">
			<option value="${n}">${n}</option>
			<c:set var="n" value="${n+1}" />
		</c:forEach>
	</select>
	<span>시</span>&nbsp;
	
	<select id="checkoutMin" name="checkoutMin" style="width: 20%; display: inline-block;">
		<c:set var="n" value="0" />
		
		<c:forEach begin="0" end="59">
			<option value="${n}">${n}</option>
			<c:set var="n" value="${n+1}" />
		</c:forEach>
	</select>
	<span>분</span>
	</div>
	
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button" value="Next" />
  </fieldset>
  
  
  <fieldset>
    <h2 class="fs-title">네 번째 단계</h2>
    <!-- <h3 class="fs-subtitle"></h3> -->
	숙박비 :<br/>
    &#8361;&nbsp;&nbsp;<input type="text" id="roomprice" name="roomprice" placeholder="숙박비" required="required" style="width: 90%;" value="0"/>
   	보증금 :<br/>
	&#8361;&nbsp;&nbsp;<input type="text" id="depositprice" name="depositprice" placeholder="보증금" required="required" style="width: 90%;" value="0"/>
	청소비 :<br/>
	&#8361;&nbsp;&nbsp;<input type="text" id="cleanprice" name="cleanprice" placeholder="청소비" required="required" style="width: 90%;" value="0"/>
	총 가격:<br/>
	&#8361;&nbsp;&nbsp;<input type="text" id="totalprice" name="totalprice" placeholder="총 가격" readonly="readonly" required="required" style="width: 90%;" value="0"/>
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button" value="Next" />
  </fieldset>
  
  
  <fieldset>
    <h2 class="fs-title">다섯 번째 단계</h2>
    <!-- <h3 class="fs-subtitle"></h3> -->
   	시설 : 
   	<div style="display: flex;">
	<label for="elevator"><img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/elevator.png"></label>
	<br/><input type="checkbox" id="elevator" name="elevator" />
	<label for="wifi"><img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/wifi.png"></label>
	<br/><input type="checkbox" id="wifi" name="wifi"/>
	<label for="airconditioner"><img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/airconditioner.png"></label>
	<br/><input type="checkbox" id="airconditioner" name="airconditioner" />
	</div>
	<div style="display: flex;">
	<label for="heater"><img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/heater.png"></label>
	<br/><input type="checkbox" id="heater" name="heater" />
	<label for="washingmachin"><img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/washingmachin.png"></label>
	<br/><input type="checkbox" id="washingmachin" name="washingmachin" />
	<label for="hairdry"><img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/hairdry.png"></label>
	<br/><input type="checkbox" id="hairdry" name="hairdry" />
	</div>
	<div style="display: flex;">
	<label for="television"><img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/television.png"></label>
	<br/><input type="checkbox" id="television" name="television" />
	<label for="essentialitem"><img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/essentialitem.png"></label>
	<br/><input type="checkbox" id="essentialitem" name="essentialitem" />
	</div>
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button" value="Next" />
  </fieldset>
  
  <fieldset>
    <h2 class="fs-title">여섯 번째 단계</h2>
    <!-- <h3 class="fs-subtitle"></h3> -->
   	숙소 설명 :  <textarea class="autosize" id="rooms_explain" name="rooms_explain" required="required"> </textarea><br/>
	환불 정책 : <textarea class="autosize" id="refund_policy" name="refund_policy" required="required"> </textarea> <br/>
	숙소 규칙 : <textarea class="autosize" id="rooms_rule" name="rooms_rule" required="required"> </textarea> <br/> 
	<input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button" value="Next" />
  </fieldset>
  
   <fieldset>
    <h2 class="fs-title">마지막 단계</h2>
    <!-- <h3 class="fs-subtitle"></h3> -->    
	안전 설명 : <textarea class="autosize" id="safety_function" name="safety_function" required="required"> </textarea><br/>
	지역 설명 : <textarea class="autosize" id="local_information" name="local_information" required="required"> </textarea> <br/>
	메인 이미지 :  <input type='file' id='mainimage' name='mainimage' class='btn btn-default' required="required"/> <br/>
	서브 이미지 : <label for="spinnerOqty">파일갯수 : </label>
             <input id="spinnerOqty" value="0" min="0" max="4" style="width: 30px; height: 20px;">
    		 <div id="divfileattach"></div><br/>
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="submit" id="submit" name="submit" class="submit action-button" onclick="gosubmit();" value="Submit"/>
  </fieldset>
  
   
 <!--   <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script> -->
  <script src="<%= request.getContextPath()%>/resources/js/HY/index.js"></script>
</form>
  

</body>
</html>