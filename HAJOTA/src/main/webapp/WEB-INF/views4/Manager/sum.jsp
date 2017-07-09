<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>
  <title>Bootstrap Example</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<div style="background-color: none; width:100%;">
	<span style="font-size: 25px; font-weight: bold;">통 계</span>  
</div> 

<br/>

<div id="line" style="position:relative; top:15%; background-color:navy; height: 3px; width:160%;"> 
	
</div>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js">
    
    </script>
    
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);      
    
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'real income'],
          ['1月',  1000,      400],
          ['2月',  1170,      460],
          ['3月',  660,       1120],
          ['4月',  1030,      540],
          ['5月',  1030,      540],
          ['6月',  1030,      540],
          ['7月',  1030,      540],
          ['8月',  1030,      540],
          ['9月',  1030,      540],
          ['10月',  1030,      540],
          ['11月',  1030,      540],
          ['12月',  1030,      540],
        ]);

        var options = {
          title: 'total income', 
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>


    <div id="curve_chart" style="width: 900px; height: 500px">
    
    </div>


