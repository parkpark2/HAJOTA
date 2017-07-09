<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== 장환오빠 부분  ===== --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAJOTA</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
  <link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style>

  	#section1	    { width:100%; height: 100%; position:relative; background-color: white; overflow: hidden;}
	#myheader		{ background-color: white; height:11%;    width: 100%; }
	#mycontent		{  width:100%;margin-top:-1%; position:relative; background-color: white;}
	#myfooter		{ background-color: white; clear:both; height:10%; width: 100%; margin: auto; }
	p {line-height: 2}

	#myheader a {text-decoration:none;}

	#myheader a:hover {color: navy; font-weight: bolder;}

	#myheader .mynav {font-size: 13pt;}
	.myrank {font-weight:bold; color:red; font-size:13pt;}
	.mynumber {text-align:center;}
	

/*--------------------------------------------------------  */

/* body#JH_layout_roomsList_body {
	width: 100%;
	height: 100%;
	overflow: hidden;
	background-color: #FFFFFF;
	margin-top: -1%;
}

div#JH_layout_roomsList {
	width: 70%;
	height: 100%;
	float: inherit;
	display: inline-block;
	overflow: auto;
}

div#JH_layout_map {
	width: 30%;
	height: 100%;
	float: left;
	display: inline-block;
	position: fixed;
}

div#JH_layout_roomsListTop {
	width: 100%;
	height: 10%;
	position: relative;
}

div#JH_layout_roomsListBody {
	width: 100%;
	height: 90%;
	position: relative;
} */

</style>

</head>

<body>
	<div id="section1" >
		<div id="myheader">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="mycontent" >
			<div style="width: 60%; height:100%; display: inline-block;">
			<tiles:insertAttribute name="roomslist" />
			</div>
			<div style="width: 40%; height: 100%; float: right; display: inline-block; margin-top: 32%;">
			<tiles:insertAttribute name="map" />
			</div>
		</div><%-- 
		<div id="myfooter">
			<tiles:insertAttribute name="footer" />
		</div> --%>		
	</div>
</body>

<%-- <body id="JH_layout_roomsList_body" >
<div id="section1">
		<div id="myheader">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="mycontainer">			
			<div id="mycontent">
				<tiles:insertAttribute name="roomslist" />
				<tiles:insertAttribute name="map" />
			</div>
			<div id="myfooter">
				<tiles:insertAttribute name="footer" />
			</div>
		</div>
</div> --%>
	<%-- <div id="JH_layout_roomsListTop">
		<tiles:insertAttribute name="header" />
	</div>

	<div id="JH_layout_roomsListBody">
		<div id="JH_layout_roomsList">
			<tiles:insertAttribute name="roomslist" />
		</div>
		
		<div id="JH_layout_map">
			<tiles:insertAttribute name="map" />
		</div> --%>

</html>