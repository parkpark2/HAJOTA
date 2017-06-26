<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>숙소상세</title>
  
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link rel="stylesheet" href="<%= request.getContextPath()%>/resources/TypeofCss/HY/HY.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
	
}); // end of $(document).ready()-----------------------------------

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

    </script>

  
</head>

<body>
  <!-- multistep form -->
<form id="msform">
  <!-- progressbar -->
  <ul id="progressbar">
    <li class="active">숙소1</li>
    <li>숙소2</li>
    <li>숙소3</li>
    <li>숙소4</li>
    <li>숙소5</li>
    <li>숙소6</li>
    <li>숙소7</li>
  </ul>
  <!-- fieldsets -->
  <fieldset>
    <h2 class="fs-title">숙소1</h2>
    <h3 class="fs-subtitle">This is step 1</h3>
    <input type="text" name="email" placeholder="Email(이메일)" />
    <input type="text" id="roomsname" name="roomsname" placeholder="roomsname(숙소이름)" />
         숙소타입 : <select name="TYPE_LODGE">
	<option value="0" selected>타입선택</option>
	<option value="1">집전체</option>
	<option value="2">개인실</option>
	<option value="3">다인실</option>
	</select>
	건물 타입 : <select name="TYPE_BUILDING">
	<option value="0" selected>타입선택</option>
	<option value="1">아파트</option>
	<option value="2">개인주택</option>
	<option value="3">빌딩</option>
	</select><br/>
	최대 인원 : <select name="maxpeople">
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
    <h2 class="fs-title">숙소2</h2>
    <h3 class="fs-subtitle">We will never sell it</h3>
    상세주소 : <input type="text" id="sample4_postcode" placeholder="우편번호" readonly>
				 <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				 <input type="text" id="sample4_roadAddress" placeholder="도로명주소" readonly>
				 <input type="text" id="sample4_jibunAddress" placeholder="지번주소" readonly>
				 <input type="text" id="LAT" value="">
				 <input type="text" id="LNG" value="">
				 <span id="guide" style="color:#999"></span>
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button" value="Next" />
    
  </fieldset>
  
  <fieldset>
    <h2 class="fs-title">숙소3</h2>
    <h3 class="fs-subtitle">Your presence on the social network</h3>
    화장실 개수 : <select name="bathroomcount">
			  <option>1</option>
			  <option>2</option>
			  <option>3</option>
			  <option>4</option>
			  <option>4+</option>
			  </select> <br/>
	침실 개수 : <select name="bedroomcount">
			  <option>1</option>
			  <option>2</option>
			  <option>3</option>
			  <option>4</option>
			  <option>5</option>
			  <option>6</option>
			  <option>7+</option>
			</select> <br/>
	침대 개수 : <select name="bedcount">
			  <option>1</option>
			  <option>2</option>
			  <option>3</option>
			  <option>4</option>
			  <option>5</option>
			  <option>6</option>
			  <option>7</option>
			  <option>8+</option>
			</select> <br/>
	<input type="text" name="Hcheckin" placeholder="Hcheckin(숙소 체크인시간 )" /> <br/>
	<input type="text" name="Hcheckout" placeholder="Hcheckout(숙소 체크아웃 시간 )" /> <br/>
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button" value="Next" />
  </fieldset>
  
  
  <fieldset>
    <h2 class="fs-title">숙소4</h2>
    <h3 class="fs-subtitle">We will never sell it</h3>
    <input type="text" name="paddprice" placeholder="paddprice(추가인원요금)" />
	<input type="text" name="depositprice" placeholder="depositprice(보증금)" />
	<input type="text" name="cleanprice" placeholder="cleanprice(청소비)" />
	<input type="text" name="totalprice" placeholder="totalprice(총가격)" />
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button" value="Next" />
  </fieldset>
  
  
  <fieldset>
    <h2 class="fs-title">숙소5</h2>
    <h3 class="fs-subtitle">This is step 123123</h3>
   	시설 : 
   	<div style="display: flex;">
	<label for="elevator"><img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/elevator.png"></label>
	<br/><input type="checkbox" id="elevator" name="elevator" />
	<label for="wifi"><img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/wifi.png"></label>
	<br/><input type="checkbox" id="wifi" name="wifi" />
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
    <h2 class="fs-title">숙소6</h2>
    <h3 class="fs-subtitle">This is step 123123</h3>
   	숙소설명 :  <textarea class="autosize" > </textarea><br/>
	환불 정책 : <textarea class="autosize" > </textarea> <br/>
	숙소 규칙 : <textarea class="autosize" > </textarea> <br/> 
	<input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="button" name="next" class="next action-button" value="Next" />
  </fieldset>
  
   <fieldset>
    <h2 class="fs-title">숙소7</h2>
    <h3 class="fs-subtitle">We will never sell it</h3>    
	안전 설명 : <textarea class="autosize" > </textarea><br/>
	지역 설명 : <textarea class="autosize" > </textarea> <br/>
	메인이미지 :  <input type='file' name='mainimage' class='btn btn-default' /> <br/>
	서브 이미지 : <label for="spinnerOqty">파일갯수 : </label>
             <input id="spinnerOqty" value="0" style="width: 30px; height: 20px;">
    		 <div id="divfileattach"></div><br/>
    <input type="button" name="previous" class="previous action-button" value="Previous" />
    <input type="submit" name="submit" class="submit action-button" value="Submit" />
  </fieldset>
  
   
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
  <script src="<%= request.getContextPath()%>/resources/js/HY/index.js"></script>
</form>
  

</body>
</html>
