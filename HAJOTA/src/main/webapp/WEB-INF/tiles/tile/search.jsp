<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

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
		
		$("#pageNo").val("1");

		if (search_content.trim() == "" || numOfPeople.trim() == ""
				|| startDate.trim() == "" || endDate.trim() == "") {
			// TODO : 수정하자
			alert("모든 항목을 입력하셔야 합니다.");
			return;
		}
		
		else if(${sessionScope.loginuser == null}){
			alert("로그인이 필요합니다.");
			return;
		}

		var searchFrm = document.searchFrm;

		searchFrm.action = "/hajota/rooms/list.go";
		searchFrm.method = "POST";
		searchFrm.submit();
	}
</script>


</head>
<body>
	<div class="container">

		<div class="jumbotron text-center"
        style="margin-top: 110px; margin-bottom: 110px; padding: 40px; background: rgba(1, 1, 1, 0.3)">
        <h1 style="color: #eee; font-weight: 600">
           안녕하세요 <span style="color: rgba(41, 216, 70, 0.8)">HAJOTA</span>
        </h1>

			<p style="color: #eee">
           	국내 1,375,000개 이상의 숙소 특가 할인!!
          <br/><br/>
        </p>

			<form name="searchFrm">
	
        <p>
           <!-- 달력 띄우자 -->
           <span style="color: white;">
           <label><i class="fa fa-search"></i> Search</label>&nbsp;
           </span>
           <input type="text" id="search_content" name="search_content" placeholder="당산" size="10" style="height: 35px; " />&nbsp; 
           <span style="color: white; ">
           <label><i class="fa fa-male"></i> 인원</label>
           </span>
           <input type="text" id="numOfPeople" name="numOfPeople" placeholder="1" size="3" style="height: 35px; width: 35px;"/>&nbsp; 

           <span style="color: white;">           
           <label><i class="fa fa-calendar-o"></i> Check In</label>
           </span>
           <input type="text" class="datepicker" id="startDate"	name="startDate" placeholder="날짜선택" size="10" style="height: 35px; width: 130px;" />&nbsp; 
           <span style="color: white; ">
           <label><i class="fa fa-calendar-o"></i> Check Out</label>&nbsp;
           </span>
           <input type="text" class="datepicker" id="endDate" name="endDate"  placeholder="날짜선택" size="10" style="height: 35px; width: 130px;" />&nbsp; 
           <br/><br/>
    
           <button type="button" class="w3-button w3-margin-top" style="width: 200px; border-radius: 12px; background-color: #ea6153; color: white;" onclick="goSearch();">요금검색하기</button>
        	<input type="hidden" id="pageNo" name="pageNo"/>
        </p>
        </form>
        
       </div>
 
      </div>      
      
</body>
</html>