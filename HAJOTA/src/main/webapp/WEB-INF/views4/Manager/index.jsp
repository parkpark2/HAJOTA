<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js">
 
</script> 

<script type="text/javascript">

	$(document).ready(function() {
		google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);
        
        sumList();
	});
	
	// 함수 부분
    function sumList() {
		var year = $("#selectYear").val();
		
		 $.ajax({
			url : "/hajota/sumManagerEnd.go",
			dataType : "JSON",
			method : "GET",
			data : {
				year : year				
			},			
			success : function(param1) {
				//drawChart(data);
				 sumList2(param1); 
				
			}
		}); 
	}
     
    function sumList2(param1) {
    	var year = $("#selectYear").val();
    	
    	$.ajax({
    		url : "/hajota/sumManagerEnd2.go",
			dataType : "JSON",
			method : "GET",
			data : {
				year : year		
			},
			success : function(param2) {
				drawChart(param1, param2);		
			}
    	}); 
    }
   
	// 데이터 넣는 부분    
      function drawChart(param1, param2) {
          var data = google.visualization.arrayToDataTable([
            ['month', '수입 ', 'Q&A'],
            ['1月',   Number(param1[0].COMMISSION), Number(param2[0].SEQ)],
            ['2月',   Number(param1[1].COMMISSION), Number(param2[1].SEQ)],
            ['3月',   Number(param1[2].COMMISSION), Number(param2[2].SEQ)],
            ['4月',   Number(param1[3].COMMISSION), Number(param2[3].SEQ)],
            ['5月',   Number(param1[4].COMMISSION), Number(param2[4].SEQ)],
            ['6月',   Number(param1[5].COMMISSION), Number(param2[5].SEQ)],
            ['7月',   Number(param1[6].COMMISSION), Number(param2[6].SEQ)],
            ['8月',   Number(param1[7].COMMISSION), Number(param2[7].SEQ)],
            ['9月',   Number(param1[8].COMMISSION), Number(param2[8].SEQ)],
            ['10月',  Number(param1[9].COMMISSION), Number(param2[9].SEQ)],
            ['11月',  Number(param1[10].COMMISSION), Number(param2[10].SEQ)],
            ['12月',  Number(param1[11].COMMISSION), Number(param2[11].SEQ)]
          ]);

          var options = {
            title: '월별 수입내역 및 결재', 
            curveType: 'function',
            legend: { position: 'bottom' }
          };

          var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

          chart.draw(data, options);
        }
                 
               
</script>

<style type="text/css">
.semi-square { 
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
}
 .yellow { background-color: #eec111; }

.table {
	margin: 0 0 40px 0;
	width: 50%;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
	display: table;
}

@media screen and (max-width: 580px) {
	.table {
		display: block;
	}
}

.row {
	display: table-row;
	background: #f6f6f6;
}

.row:nth-of-type(odd) {
	background: #e9e9e9;
}

.row.header {
	font-weight: 900;
	color: #ffffff;
	background: #ea6153;
}

.row.green {
	background: #27ae60;
}

.row.blue {
	background: #2980b9;
}

@media screen and (max-width: 580px) {
	.row {
		padding: 8px 0;
		display: block;
	}
}

.cell {
	padding: 6px 12px;
	display: table-cell;
}

@media screen and (max-width: 580px) {
	.cell {
		padding: 2px 12px;
		display: block;
	}
}
</style>

<!-- !PAGE CONTENT! -->
<div class="w3-main">

	<!-- Header -->
	<header class="w3-container">
	</header>

	<div class="w3-row-padding w3-margin-bottom">
		<div class="w3-quarter">
			<div class="w3-container w3-red w3-padding-16"  style="box-shadow: 10px 10px 5px #888888;">
				<div class="w3-left">
					<i class="fa fa-users w3-xxxlarge"></i>
				</div>
				<div class="w3-right">
					<h3>${n} 명</h3>
				</div>
				<div class="w3-clear"></div>
				<h4>총 게스트 수</h4>
			</div>
		</div>
		<div class="w3-quarter">
			<div class="w3-container w3-blue w3-padding-16" style="box-shadow: 10px 10px 5px #888888;">
				<div class="w3-left">
					<i class="fa fa-user w3-xxxlarge"></i>
				</div>
				<div class="w3-right">
					<h3>${t} 명</h3>
				</div>
				<div class="w3-clear"></div>
				<h4>총 호스트 수</h4>
			</div>
		</div>
		<div class="w3-quarter">
			<div class="w3-container w3-teal w3-padding-16" style="box-shadow: 10px 10px 5px #888888;">
				<div class="w3-left">
					<i class="fa fa-clock-o w3-xxxlarge"></i>
				</div>
				<div class="w3-right">
					<h3>${jintianCount}명</h3>
				</div>
				<div class="w3-clear"></div>
				<h4>오늘 총 접속자 수</h4>
			</div>
		</div>
		<div class="w3-quarter">
			<div class="w3-container w3-orange w3-text-white w3-padding-16"  style="box-shadow: 10px 10px 5px #888888;">
				<div class="w3-left">
					<i class="fa fa-dollar w3-xxxlarge"></i>
				</div>
				<div class="w3-right">
				<h3><fmt:formatNumber value="${totalincome}" pattern="#,###"/> 원</h3>
				</div>
				<div class="w3-clear"></div>
				<h4>${year}년도 총 수입</h4>
			</div>
		</div>
	</div>
</div>

<!-------------------------------------------  표 -------------------------------------- -->

<br/>

<div>
	<span style="font-weight: bold; font-size: 15pt;">Q & A 최근 게스트
		리스트&nbsp;&nbsp;</span>
	<div class="table" style="cursor: pointer" onClick="location.href='<%= request.getContextPath() %>/qnaguestManager.go'">
		<div class="row header red" id="menubar">
			<div class="cell">게스트 이메일</div>
			<div class="cell">
				<span style="margin-left: 28%;">제목</span>
			</div>
			<div class="cell">
				<span style="margin-left: 15%;">내용</span>
			</div>
		</div>

		<c:if
			test="${indexguestqnaList != null || not empty indexguestqnaList}">
			<c:forEach var="qna" items="${indexguestqnaList}">
				<div class="row">
					<div class="cell">
						<span>${qna.EMAIL}</span>
					</div>
					<div class="cell">
						<span style="margin-left: 0%">${qna.SUBJECT}</span>
					</div>
					<div class="cell">
						<span style="margin-left:-8%;">${qna.CONTENT}</span>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<br /> <span style="font-weight: bold; font-size: 15pt;">Q & A
		최근 호스트 리스트&nbsp;&nbsp;</span>
	<div class="table" style="cursor: pointer"
		onClick="location.href='<%= request.getContextPath() %>/qnahostManager.go'">
		<div class="row header green">
			<div class="cell">호스트 이메일</div>
			<div class="cell">
				<span style="margin-left: 15%;">제목</span>
			</div>
			<div class="cell">
				<span style="margin-left: 8%;">내용</span>
			</div>
		</div>

		<c:if test="${indexhostqnaList != null || not empty indexhostqnaList}">
			<c:forEach var="qna" items="${indexhostqnaList}">
				<div class="row">
					<div class="cell">${qna.EMAIL}</div>
					<div class="cell">
						<span style="margin-left: -15%;">${qna.SUBJECT}</span>
					</div>
					<div class="cell">
						<span style="margin-left: -16%;">${qna.CONTENT}</span>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<br /> <span style="font-weight: bold; font-size: 15pt;">최근 공지사항
		리스트&nbsp;&nbsp;</span>
	<div class="table" style="cursor: pointer"
		onClick="location.href='<%= request.getContextPath() %>/noticeManager.go'">
		<div class="row header blue">
			<div class="cell" style="width: 30%;">
				<span style="margin-left: 0%;">관리자 아이디</span>
			</div>
			<div class="cell">
				<span style="margin-left: 34%;">주제</span>
			</div>
			<div class="cell">
				<span style="margin-left: 27%;">내용</span>
			</div>
		</div>

		<c:if test="${indexnoticeList != null || not empty indexnoticeList}">
			<c:forEach var="notice" items="${indexnoticeList}">
				<div class="row">
					<div class="cell">
						<span style="margin-left: 10%;">${notice.EMAIL}</span>
					</div>
					<div class="cell">
						<span style="margin-left:6%;">${notice.SUBJECT}</span>
					</div>
					<div class="cell">
						<span style="margin-left: 5%;">${notice.CONTENT}</span>
					</div>
				</div>
			</c:forEach>
		</c:if>

	</div>
</div>


<!-- ----------------------------------------------------- -->

   
<div style="margin-top:-42%; margin-left:70%;">  
    <span style="font-weight:bold; font-size: 18pt; font-family: '나눔고딕';">년도 : </span> 
	<select name="selectYear" id="selectYear" class="yellow semi-square" style="margin-top:1%; width:80px; height:39px;">	
		<option value="2017" selected="selected" style="color:black;">2017</option>
		<option value="2016" style="color:black;">2016</option>
	</select>	 
 
	<button type="button" class="btn btn-warning" onclick="sumList();">검색</button>
	 
</div> 

<div id="curve_chart" style="margin-left:55%; width:700px; height: 600px;" onClick="location.href='<%= request.getContextPath() %>/chart.go'">

</div>

<!-- -------------------------------------------------header end------------------------------------------------------- -->

</div>
</div>
</div>
</div>
</div>
</div>
