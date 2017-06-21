<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<title>호스트 등록</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
    </script>

</head>
<body>
<form name="hostFrm" enctype="multipart/form-data" method="post" action="/test/addtest.action">

	<div>
	숙소이름 : <input type="text" id="roomsname" name="roomsname" />
	</div>
	<div>
	방 타입 : <select name="TYPE_LODGE">
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
	</select>
	</div>
	<div>
	최대 인원 : <select>
	<option>1 명</option>
	<option>2 명</option>
	<option>3 명</option>
	<option>4 명</option>
	<option>5 명</option>
	<option>6 명</option>
	<option>7 명</option>
	<option>8 명</option>
	<option>9 명</option>
	<option>10 명</option>
	<option>11 명</option>
	<option>12 명</option>
	<option>13 명</option>
	<option>14+ 명</option>
	
	</select>
	</div>
	<div>상세주소 : <input type="text" id="sample4_postcode" placeholder="우편번호">
				 <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				 <input type="text" id="sample4_roadAddress" placeholder="도로명주소">
				 <input type="text" id="sample4_jibunAddress" placeholder="지번주소">
				 <input type="text" id="LAT" value="">
				 <input type="text" id="LNG" value="">
				 <span id="guide" style="color:#999"></span>
	</div>
	<div>
	보증금 : <br/>
	청소비 : <br/>
	총가격 : <br/>
	</div>
	<div>
	보증금 : <br/>
	청소비 : <br/>
	총가격 : <br/>
	</div>
	<div>
	화장실 개수 : <br/>
	침실 개수 : <br/>
	침대 개수 : <br/>
	숙소 체크인시간 : <br/>
	숙소 체크아웃 시간 : <br/>
	</div>
	<div>
	<input type="checkbox" id="elevator" name="" />
	<label for="elevator"><img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/elevator.png"></label>
	<input type="checkbox" id="wifi" name="" />
	<label for="wifi"><img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/wifi.png"></label>
	<input type="checkbox" id="airconditioner" name="" />
	<label for="airconditioner"><img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/airconditioner.png"></label>
	<input type="checkbox" id="heater" name="" />
	<label for="heater"><img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/heater.png"></label>
	<input type="checkbox" id="washingmachin" name="" />
	<label for="washingmachin"><img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/washingmachin.png"></label>
	<input type="checkbox" id="hairdry" name="" />
	<label for="hairdry"><img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/hairdry.png"></label>
	<input type="checkbox" id="television" name="" />
	<label for="television"><img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/television.png"></label>
	<input type="checkbox" id="essentialitem" name="" />
	<label for="essentialitem"><img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/essentialitem.png"></label>
	</div>
	<div>
	숙소설명 : <br/>
	환불 정책 : <br/>
	숙소 규칙 : <br/>
	안전 설명 : <br/>
	지역 설명 : <br/>
	</div>
	<div>
	메인이미지 : <br/>
	서브 이미지 : 		<label for="spinnerOqty">파일갯수 : </label>
  		            <input id="spinnerOqty" value="0" style="width: 30px; height: 20px;">
         		    <div id="divfileattach"></div><br/>
	</div>
	
	<div>
	<button type="button" onClick="goinsert();" style="width: 40px; height: 40px;"></button>
	</div>
</form>
</body>
</html>