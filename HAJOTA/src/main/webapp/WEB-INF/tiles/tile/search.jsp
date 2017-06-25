<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$(".datepicker").datepicker({

		});
	});

	function goSearch() {
		var search_content = $("#search_content").val();
		var numOfPeople = $("#numOfPeople").val();
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();

		if (search_content.trim() == "" || numOfPeople.trim() == ""
				|| startDate.trim() == "" || endDate.trim() == "") {
			// TODO : 수정하자
			alert("모든 항목을 입력하셔야 합니다.");
			return;
		}

		var searchFrm = document.searchFrm;

		searchFrm.action = "/hajota/rooms/list.go";
		searchFrm.method = "GET";
		searchFrm.submit();
	}
</script>
</head>
<body>
	<div class="container">

		<!-- Main component for a primary marketing message or call to action -->
		<div class="jumbotron text-center"
			style="margin-top: 110px; margin-bottom: 110px; padding: 40px; background: rgba(1, 1, 1, 0.3)">
			<h1 style="color: #eee; font-weight: 600">
				Visit <span style="color: rgba(41, 216, 70, 0.8)">Orlando</span>
			</h1>

			<p style="color: #eee">
				Here you'll find all the latest news, <br>events and general
				information on travelling to Orlando.
			</p>

			<form name="searchFrm">
				<p>
					<!-- 달력 띄우자 -->
					<input type="text" id="search_content" name="search_content"
						placeholder="도시, 지역, 숙소 검색" size="10" />&nbsp; <input type="text"
						id="numOfPeople" name="numOfPeople" placeholder="숙박 인원" size="10" />&nbsp;
					<input type="text" class="datepicker" id="startDate"
						name="startDate" placeholder="체크인" size="10" />&nbsp; <input
						type="text" class="datepicker" id="endDate" name="endDate"
						placeholder="체크아웃" size="10" />&nbsp; <a
						class="btn btn-lg btn-default" href="#" role="button"
						onclick="goSearch();">View Latest News »</a>
				</p>
			</form>
		</div>

	</div>
</body>
</html>