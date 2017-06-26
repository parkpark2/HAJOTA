<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	$(document).ready(function(){
		
	}


</script>

<form name="registerFrm">

	<div style="border: 3px; border-color: red; border-width: 1px; border-style: solid;">
	
	<div style="border: 3px; border-color: red; border-width: 1px; border-style: solid;">
	<h2>필수사항</h2><br/>
	</div>
	
	
	<br/>
	
	
	<div style="border: 3px; border-color: red; border-width: 1px; border-style: solid;">
	이름(예:길동)
	<input type="text" name="first_name" id="first_name" class="" required />
	
	<br/><br/>
	
	성(예:홍)
	<input type="text" name="last_name" id="last_name" class="" required />
	
	<br/><br/>
	
	공개 프로필에는 성을 제외한 이름만 표시됩니다. 예약 요청 시 때 호스트는 회원님의 성과 이름을 모두 확인할 수 있습니다.
	
	<br/><br/>
	
	성별
	<select>
		<option value="남">남</option>
		<option value="여">여</option>
	</select>
	
	<br/><br/>
	
	이 자료는 통계 목적으로 사용되며 다른 회원들에게 절대 공개되지 않습니다.
	
	<br/><br/>
	
	이메일주소
	<input type="text" /> 인증하기 선효한테 물어보기
	
	<br/><br/>
	
	이메일 주소는 다른 hajota 회원에게 공개되지 않습니다. <a href="">더 알아보기.</a>
	
	<br/><br/>
	
	전화번호
	<select>
		<option value="010">010</option>
	</select>
	-
	<input type="text" /> - <input type="text" />
	
	<br/><br/>
	
	예약이 완료될 경우에만 공유됩니다. 번호가 공유되면 개인적으로 연락할 수 있습니다.
	
	<br/><br/>
	
	선호하는 언어
	<select>
		<option value="한국어">한국어</option>
		<option value="english">english</option>
		<option value="日本語">日本語</option>
	</select>
	
	<br/><br/>
	
	이 언어로 메시지를 보내겠습니다.
	
	<br/><br/>
	
	선호하는 통화 단위
	<select>
		<option value="KRW">KRW</option>
		<option value="EUR">EUR</option>
		<option value="JPY">JPY</option>
		<option value="USD">USD</option>
	</select>
	
	이 통화 단위로 요금이 표시됩니다.
	
	<br/><br/>
	
	거주 도시
	<input type="text" value="예: 프랑스 파리, 뉴욕 브루클린, 일리노이주 시카고" />
	
	<br/><br/>
	
	자기소개
	<input type="text" />
	
	<br/><br/>
	
	hajota는 사람들 간의 관계를 기반으로 만들어졌습니다. 회원님이 어떤 사람인지 알려주세요. <br/><br/>
	좋아하는 활동들을 공유해 주세요. 가장 좋아하는 여행지, 책, 영화, TV 프로그램, 음악, 음식 등 뭐든지 좋습니다. <br/><br/>
	회원님은 어떤 스타일의 게스트 또는 호스트인가요? <br/><br/>
	인생의 좌우명은 무엇인가요?	
	
	</div>
	
	<br/>
	
	<div style="border: 3px; border-color: red; border-width: 1px; border-style: solid;">
	<h2>선택사항</h2><br/>
	</div>
	
	<div>
	학교
	<input type="text" />
	
	<br/><br/>
	
	직업
	<input type="text" />
	
	<br/><br/>
	
	시간대
	<select>
		<option value="(GMT+09:00) Seoul">(GMT+09:00) Seoul</option>
		<option value="(GMT+09:00) Sapporo">(GMT+09:00) Sapporo</option>
		<option value="(GMT+09:00) Osaka">(GMT+09:00) Osaka</option>
		<option value="(GMT+08:00) Ulaan Bataar">(GMT+08:00) Ulaan Bataar</option>
	</select>
	
	</br>
	
	거주지 시간대
	
	<br/><br/>
	
	
	</div>
	
	
	</div>
	
	
</form>	
	
	
	
	
	