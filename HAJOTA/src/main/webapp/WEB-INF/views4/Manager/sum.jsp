<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<div style="background-color: none; width:100%;">
	<span style="font-size: 25px; font-weight: bold;">
	<img src="<%= request.getContextPath() %>/resources/images/HSSH/managericon.png" style="width: 50px; height: 50px;" />
	수입&QNA 통계</span>  
</div><br/>

<div id="line" style="position:relative; top:15%; background-color:navy; height: 3px; width:160%;"></div>

<style>
.semi-square { 
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
}
 .yellow { background-color: #eec111; }

</style>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> 
    		
<!-- ajax 부분============================================================================================================================ -->
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
            title: '월별 수입내역 및 Q&A', 
            curveType: 'function',
            legend: { position: 'bottom' }
          };

          var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

          chart.draw(data, options);
        }
                 
      
    </script>

   
<div style="margin-top:5%; margin-left: 45%;">      
	<span style="font-weight:bold;">년도 :</span> 
	<select name="selectYear" id="selectYear" class="yellow semi-square">	
		<option value="2017" selected="selected" style="color:black;">2017</option>
		<option value="2016" style="color:black;">2016</option>
	</select>	

	<button type="button" class="btn btn-warning" onclick="sumList();">검색</button> 
</div> 


<div id="curve_chart" style="width: 900px; height: 600px; margin-left: 23%;"></div>      


