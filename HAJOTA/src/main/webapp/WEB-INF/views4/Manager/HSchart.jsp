<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

<script src="<%= request.getContextPath() %>/resources/js/HS/highcharts.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/HS/highcharts-3d.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/HS/exporting.js"></script>
 
	<style type="text/css">
	#container {
	    height: 400px; 
	    min-width: 310px; 
	    max-width: 700px;
	    margin: 0 auto;
	}
	</style>
</head>


<div style="background-color: none; width:100%;">
	<span style="font-size: 25px; font-weight: bold;">
	<img src="<%= request.getContextPath() %>/resources/images/HSSH/managericon.png" style="width: 50px; height: 50px;" />
	회원통계</span>  
</div> <br/>

<div id="line" style="position:relative; top:15%; background-color:navy; height: 3px; width:100%;"></div>

<div style="position: relative; padding-top: 5%;">
	<div id="container" style="width:50%; height: 700px; display: inline-block;"></div>

	<div class="section">
		<div class="content nopad_bottom">
			<h1>GUEST & HOST 의 회원수</h1>
			<hr class="col-1" />
			<div id="returns_chart" class="chart"></div>
		</div>
	</div>
</div>

<script type="text/javascript">

$(document).ready(function() { 
    loginCount();
});

//함수 부분
function loginCount() {
	
	 $.ajax({
		url : "/hajota/HSchartEnd.go",
		dataType : "JSON",
		method : "GET",			
		success : function(renshu) {
			drawChart(renshu);
			joinGuestCount();
		}
	}); 
}

function drawChart(renshu) {

Highcharts.chart('container', {
    chart: {
        type: 'column',
        options3d: {
            enabled: true,
            alpha: 12,
            beta: 25,
            depth: 70
        }
    },
    title: {
        text: '시간대별 로그인 시도한 회원수'
    },
    subtitle: {
        text: '1시간 단위'
    },
    plotOptions: {
        column: {
            depth: 25
        }
    },
    xAxis: {
        categories: Highcharts.getOptions().lang.hour        
    },
    yAxis: {
        title: {
            text: '인원'
        }
    },
    series: [{
        name: '회원수',
        data: [renshu[0].CNT,renshu[1].CNT,renshu[2].CNT,renshu[3].CNT,renshu[4].CNT,renshu[5].CNT,renshu[6].CNT,renshu[7].CNT,renshu[8].CNT,renshu[9].CNT,renshu[10].CNT,renshu[11].CNT,renshu[12].CNT,renshu[13].CNT,renshu[14].CNT,renshu[15].CNT,renshu[16].CNT,renshu[17].CNT,renshu[18].CNT,renshu[19].CNT,renshu[20].CNT,renshu[21].CNT,renshu[22].CNT,renshu[23].CNT] 
    }]
})

};


function joinGuestCount() {
	
	 $.ajax({
		url : "/hajota/joinGuestChart.go",
		dataType : "JSON",
		method : "GET",			
		success : function(guestCNT) {
			joindrawChart(guestCNT);
		}
	}); 
}

</script>



<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<style rel="stylesheet">

@font-face {
  font-family: 'lineto-brown-bold';
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-bold/fonts/lineto-brown-bold.eot");
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-bold/fonts/lineto-brown-bold.eot?#iefix") format("embedded-opentype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-bold/fonts/lineto-brown-bold.woff") format("woff"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-bold/fonts/lineto-brown-bold.ttf") format("truetype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-bold/fonts/lineto-brown-bold.svg#lineto-brown-bold") format("svg");
  font-style: normal;
  font-weight: normal;
}
@font-face {
  font-family: 'lineto-brown-boldalt';
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-bold/fonts/lineto-brown-boldalt.eot");
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-bold/fonts/lineto-brown-boldalt.eot?#iefix") format("embedded-opentype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-bold/fonts/lineto-brown-boldalt.woff") format("woff"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-bold/fonts/lineto-brown-boldalt.ttf") format("truetype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-bold/fonts/lineto-brown-boldalt.svg#lineto-brown-boldalt") format("svg");
  font-style: normal;
  font-weight: normal;
}
@font-face {
  font-family: 'lineto-brown-reclinbold';
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-bold/fonts/lineto-brown-reclinbold.eot");
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-bold/fonts/lineto-brown-reclinbold.eot?#iefix") format("embedded-opentype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-bold/fonts/lineto-brown-reclinbold.woff") format("woff"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-bold/fonts/lineto-brown-reclinbold.ttf") format("truetype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-bold/fonts/lineto-brown-reclinbold.svg#lineto-brown-reclinbold") format("svg");
  font-style: normal;
  font-weight: normal;
}
@font-face {
  font-family: 'lineto-brown-reclinboldalt';
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-bold/fonts/lineto-brown-reclinboldalt.eot");
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-bold/fonts/lineto-brown-reclinboldalt.eot?#iefix") format("embedded-opentype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-bold/fonts/lineto-brown-reclinboldalt.woff") format("woff"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-bold/fonts/lineto-brown-reclinboldalt.ttf") format("truetype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-bold/fonts/lineto-brown-reclinboldalt.svg#lineto-brown-reclinboldalt") format("svg");
  font-style: normal;
  font-weight: normal;
}
@font-face {
  font-family: 'lineto-brown-light';
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-light/fonts/lineto-brown-light.eot");
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-light/fonts/lineto-brown-light.eot?#iefix") format("embedded-opentype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-light/fonts/lineto-brown-light.woff") format("woff"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-light/fonts/lineto-brown-light.ttf") format("truetype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-light/fonts/lineto-brown-light.svg#lineto-brown-light") format("svg");
  font-style: normal;
  font-weight: normal;
}
@font-face {
  font-family: 'lineto-brown-reclinlight';
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-light/fonts/lineto-brown-reclinlight.eot");
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-light/fonts/lineto-brown-reclinlight.eot?#iefix") format("embedded-opentype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-light/fonts/lineto-brown-reclinlight.woff") format("woff"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-light/fonts/lineto-brown-reclinlight.ttf") format("truetype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-light/fonts/lineto-brown-reclinlight.svg#lineto-brown-reclinlight") format("svg");
  font-style: normal;
  font-weight: normal;
}
@font-face {
  font-family: 'lineto-brown-reclinregular';
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-regular/fonts/lineto-brown-reclinregular.eot");
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-regular/fonts/lineto-brown-reclinregular.eot?#iefix") format("embedded-opentype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-regular/fonts/lineto-brown-reclinregular.woff") format("woff"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-regular/fonts/lineto-brown-reclinregular.ttf") format("truetype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-regular/fonts/lineto-brown-reclinregular.svg#lineto-brown-reclinregular") format("svg");
  font-style: normal;
  font-weight: normal;
}
@font-face {
  font-family: 'lineto-brown-regular';
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-regular/fonts/lineto-brown-regular.eot");
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-regular/fonts/lineto-brown-regular.eot?#iefix") format("embedded-opentype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-regular/fonts/lineto-brown-regular.woff") format("woff"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-regular/fonts/lineto-brown-regular.ttf") format("truetype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-regular/fonts/lineto-brown-regular.svg#lineto-brown-regular") format("svg");
  font-style: normal;
  font-weight: normal;
}
@font-face {
  font-family: 'lineto-brown-reclinregularalt';
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-regular/fonts/lineto-brown-reclinregularalt.eot");
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-regular/fonts/lineto-brown-reclinregularalt.eot?#iefix") format("embedded-opentype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-regular/fonts/lineto-brown-reclinregularalt.woff") format("woff"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-regular/fonts/lineto-brown-reclinregularalt.ttf") format("truetype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-regular/fonts/lineto-brown-reclinregularalt.svg#lineto-brown-reclinregularalt") format("svg");
  font-style: normal;
  font-weight: normal;
}
@font-face {
  font-family: 'lineto-brown-regularalt';
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-regular/fonts/lineto-brown-regularalt.eot");
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-regular/fonts/lineto-brown-regularalt.eot?#iefix") format("embedded-opentype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-regular/fonts/lineto-brown-regularalt.woff") format("woff"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-regular/fonts/lineto-brown-regularalt.ttf") format("truetype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-regular/fonts/lineto-brown-regularalt.svg#lineto-brown-regularalt") format("svg");
  font-style: normal;
  font-weight: normal;
}
@font-face {
  font-family: 'lineto-brown-reclinthin';
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-thin/fonts/lineto-brown-reclinthin.eot");
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-thin/fonts/lineto-brown-reclinthin.eot?#iefix") format("embedded-opentype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-thin/fonts/lineto-brown-reclinthin.woff") format("woff"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-thin/fonts/lineto-brown-reclinthin.ttf") format("truetype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-thin/fonts/lineto-brown-reclinthin.svg#lineto-brown-reclinthin") format("svg");
  font-style: normal;
  font-weight: normal;
}
@font-face {
  font-family: 'lineto-brown-thin';
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-thin/fonts/lineto-brown-thin.eot");
  src: url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-thin/fonts/lineto-brown-thin.eot?#iefix") format("embedded-opentype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-thin/fonts/lineto-brown-thin.woff") format("woff"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-thin/fonts/lineto-brown-thin.ttf") format("truetype"), url("https://static1.squarespace.com/static/ta/543e57cbe4b0bda0c6496d33/4472/assets/fonts/ll-brown-thin/fonts/lineto-brown-thin.svg#lineto-brown-thin") format("svg");
  font-style: normal;
  font-weight: normal;
}

.bright {
  background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/223954/bg_white.jpg);
  background-attachment: fixed;
}

.white {
  background-color: #FFF;
}

.grey {
  background-color: #f5f5f5;
}

.dark {
  background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/223954/bg_black.jpg);
  background-attachment: fixed;
}

.clear-fix {
  clear: both;
}

.nopad_bottom {
  padding-bottom: 0px !important;
}

.nopad_top {
  padding-top: 0px !important;
}

.section {
  position:absolute;
  width: 50%;
  display: inline-block;
  margin-left: 5%;
}
.section.header {
  min-height: 100%;
  background-image: url(../images/world.png);
  background-size: 150%;
  background-repeat: no-repeat;
  background-position: 53% -10%;
}
.section .content {
  background-color: #fff;
}

.section .content h1 {
  text-align: center;
  font-family: lineto-brown-light;
  letter-spacing: -2px;
  max-width: 12.8em;
  margin: 0 auto;
  font-weight: 100;
  color: #29333c;
  font-size: 3.323em;
  line-height: 1.2em;
  text-transform: none;
  -moz-osx-font-smoothing: auto;
  -webkit-font-smoothing: subpixel-antialiased;
}
.section .content hr {
  width: 8.3333%;
  opacity: 0.2;
}
.section .content p {
  font-family: lineto-brown-light;
  font-size: 1.05em;
  margin-top: 0px;
  max-width: 39.881em;
  margin: 0 auto;
  text-align: center;
  line-height: 1.6em;
  letter-spacing: 0px;
  font-weight: 300;
  font-style: normal;
  color: #6b6e75;
  -moz-osx-font-smoothing: auto;
  -webkit-font-smoothing: subpixel-antialiased;
}

.chart {
  position: relative;
}
.chart svg {
  cursor: crosshair;
}
.chart .titles {
  list-style-type: none;
 
}
.chart .titles li {
  font-family: lineto-brown-light;
  text-align: center;
  list-style-type: none;
  float: left;
  font-size: 1.323em;
  font-weight: bold;
}
.chart .data_mouse {
  position: absolute;
  box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.3);
  font-family: Arial, sans-serif;
  min-width: 100px;
  background-color: #FFF;
  color: #666;
  border-radius: 3px;
}
.chart .data_mouse ul {
  list-style-type: none;
  padding: 0px;
  margin: 0px;
}
.chart .data_mouse ul li {
  text-align: center;
  list-style-type: none;
}
.chart .data_mouse ul li p {
  text-align: left;
  font-size: 13px;
  font-family: sans-serif;
  font-weight: bold;
}
.chart .range {
  margin-top: -4px;
}
.chart .range div.mdate {
  float: left;
  text-align: center;
  float: left;
  font-family: lineto-brown-light;
  font-size: 0.70em;
  margin-top: 0px;
  max-width: 39.881em;
  margin: 0 auto;
  text-align: center;
  line-height: 1.6em;
  letter-spacing: 0px;
  font-weight: 300;
  font-style: normal;
  color: #ABABAB;
  padding-top: 5px;
  padding-bottom: 5px;
  -moz-osx-font-smoothing: auto;
  -webkit-font-smoothing: subpixel-antialiased;
}
.chart .year {
  width: 99%;
  margin: 0 auto;
  padding-bottom: 10px;
}
.chart .year .ydate {
  font-size: 14px;
  font-family: lineto-brown-light;
  -moz-osx-font-smoothing: auto;
  -webkit-font-smoothing: subpixel-antialiased;
  padding-bottom: 5px;
  float: left;
  color: #757575;
  text-align: center;
  box-shadow: 1px 1px 0px rgba(0, 0, 0, 0.2), -1px 0px 0px rgba(0, 0, 0, 0.2);
}

</style>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">

function joindrawChart(guestCNT) {

kindChart($('#returns_chart'), {
	colors: ['62,166,198', '88,197,132'],
	opacity: 1,
	height: '250',
	width: '100%',
	period: 12,
	max_y: 100,
	data:[ 		
		[	
			'GUEST', [
				['2017', '01',guestCNT[12].CNT],
				['2017', '02',guestCNT[13].CNT],
				['2017', '03',guestCNT[14].CNT],
				['2017', '04',guestCNT[15].CNT],
				['2017', '05',guestCNT[16].CNT],
				['2017', '06',guestCNT[17].CNT],
				['2017', '07',guestCNT[18].CNT],
				['2017', '08',guestCNT[19].CNT],
				['2017', '09',guestCNT[20].CNT],
				['2017', '10',guestCNT[21].CNT],
				['2017', '11',guestCNT[22].CNT],
				['2017', '12',guestCNT[23].CNT] 	
				
			 ] 
		],
		[
			'HOST', [
				['2017', '01',guestCNT[0].CNT],
				['2017', '02',guestCNT[1].CNT],
				['2017', '03',guestCNT[2].CNT],
				['2017', '04',guestCNT[3].CNT],
				['2017', '05',guestCNT[4].CNT],
				['2017', '06',guestCNT[5].CNT],
				['2017', '07',guestCNT[6].CNT],
				['2017', '08',guestCNT[7].CNT],
				['2017', '09',guestCNT[8].CNT],
				['2017', '10',guestCNT[9].CNT],
				['2017', '11',guestCNT[10].CNT],
				['2017', '12',guestCNT[11].CNT]
			]
		],
	]		
});




function kindChart(element, options) {

	options	= $.extend( {}, {
		width: '100%',
		height: '250',
		inverted: false,
		period: false,
		opacity: 0.5
	}, options);

	console.log(options);

	var svg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
	svg.setAttribute('height',options.height);
	svg.setAttribute('width', options.width);
	svg.setAttribute('xmlns', 'http://www.w3.org/2000/svg');
	svg.setAttribute('preserveAspectRatio', 'none');
	svg.setAttribute('viewBox', '0 0 100 100');
	element.append('<div class="range"></div>');
	element.append('<div class="year"></div>');
	element.append('<div class="data_mouse"></div>');
	element.prepend('<ul class="titles"></ul>');

	var highest = 0;
	for(var y = 0; y < options.data.length; y++){
		for(var x = 0; x < options.data[y][1].length; x++){
			if(highest < options.data[y][1][x][2]) {
				highest = options.data[y][1][x][2] + 1;
			}
		}
	}

	if(options.period == false) {
		var lengthe = 0;
		for(var y = 0; y < options.data.length; y++){
			if(length < options.data[y][1].length) {
				console.log(options.data[y][1].length);
				lengthe = options.data[y][1].length;
			}
		}
		options.period = lengthe;

	}

	var Xfactor = 100 / (options.period - 1);
	var Yfactor = options.max_y / highest;


	/* DRAW CHART */
	var iteration = 0;
	var svg_increment_path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
	var increment_path = '';
	var width_set = 0;
	for(var y = 0; y < options.data.length; y++) {
		iteration++;
		var svg_path = document.createElementNS('http://www.w3.org/2000/svg', 'path');
		var path = '';
		element.find('ul.titles').append('<li style="color: rgb('+options.colors[y]+'); width: '+ (100 / options.data.length) +'%;">'+options.data[y][0]+'</li>');

		for(var x = 0; x <= options.data[y][1].length - 1; x++) {
			if(x > options.data[y][1].length - options.period - 1) {
				width_set++;
				if(iteration == 1){						
					increment_path += 'M '+ ((100 / (options.period - 1)) * x) + ' 0 L '+ ((100 / (options.period - 1)) * x) + ' 100 ';
					if((x - (options.data[y][1].length - options.period)) != 0){
						element.find('.range').append('<div class="mdate" style="width: '+ 100 / (options.period - 1) +'%">'+ options.data[y][1][x][1] +'</div>');
					}
					if(options.data[y][1][x][1] == '12') {
						element.find('.year').append('<div class="ydate" style="width: '+ ((width_set - 1) * (100 / (options.period - 1))) +'%;">'+ options.data[y][1][x][0] +'</div>');
						width_set = 0;
					} else if(x == (options.period - 1)) {
						element.find('.year').append('<div class="ydate" style="width: '+ ((width_set + 1) * (100 / (options.period - 1))) +'%;">'+ options.data[y][1][x][0] +'</div>');
					}
				}
				if(x == options.data[y][1].length - options.period) {
					if(options.inverted == true) {
						var pre = 'M 0 0 L 0 ';
						var add = ' L 100 0';
					} else {
						var pre = 'M 0 100 L 0 ';
						var add = ' L 100 100';
					}
					path += pre + (100 - options.data[y][1][x][2] * Yfactor) + ' ';
				} else if(x == options.data[y][1].length - 1) {
					path += 'L '+ ((x - (options.data[y][1].length - options.period)) * Xfactor) +' '+ (100 - options.data[y][1][x][2] * Yfactor) + add;
				} else {
					path += 'L '+ ((x - (options.data[y][1].length - options.period)) * Xfactor) +' '+ (100 - options.data[y][1][x][2] * Yfactor) + ' ';
				}
			}
		}

		svg_increment_path.setAttribute('stroke', 'rgba(0,0,0,0.1)');
		svg_increment_path.setAttribute('stroke-width', '0.15');
		svg_increment_path.setAttribute('d', increment_path);
		svg.appendChild(svg_increment_path);

		svg_path.setAttribute('fill', 'rgba('+options.colors[y]+','+options.opacity+')');
		svg_path.setAttribute('d', path);
		svg.appendChild(svg_path);
	}

	element.find('ul, .range, .year').append('<div class="clear-fix"></div>');
	element.find('.titles').after(svg);


	element.mousemove(function(e){
		var objLeft = $(this).offset().left;
		var objRight = $(this).offset().right;
		var objTop = $(this).offset().top;

		var section = Math.floor((e.pageX / ($(this).width() / (options.period - 1))));

		var left = ((section - 1) * ($(this).width() / (options.period - 1))) + (($(this).width() / (options.period - 1)) / 2);
		var right = 'initial';
		if(left + $(this).find('.data_mouse').width() >= (objLeft + $(this).width())- $(this).find('.data_mouse').width()) {
			left = 'initial';
			right =  ((options.period - 1) - (section - 2)) * ($(this).width() / (options.period - 1));
		}
		
		$(this).find('.data_mouse').css({
			left: left,
			right: right,
			top: (e.pageY - objTop) - 14,
			display: 'block'
		}).html('<ul></ul>');


		var color = "#666";
		var diff = 0;
		for(var i = 0; i < options.data.length; i++){
			if(options.data[i][1][section][2] > options.data[i][1][section - 1][2]) {
				color = "#0C0";
				diff = '+ ' + (options.data[i][1][section][2] - options.data[i][1][section - 1][2]);
			} else if(options.data[i][1][section][2] < options.data[i][1][section - 1][2]) {
				color = "#C00";
				diff = '- ' + (options.data[i][1][section - 1][2] - options.data[i][1][section][2]);
			}

			element.find('.data_mouse ul').append('<li><span style="color: rgb('+ options.colors[i] +');">'+ options.data[i][0] +'</span><p><span class="return">$'+ options.data[i][1][section][2] +'</span><span style="float: right; color: '+ color +'; font-weight: normal;">'+ diff +'</span></p></li>');
		}
	});

	element.mouseout(function(e){
		$(this).find('.data_mouse').css({
			left: 0,
			top: 0,
			display: 'none'
		});
		$(this).find('.out ul').html('');
	});
}

};
</script>




