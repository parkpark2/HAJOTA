<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== #35. tiles 를 사용하는 레이아웃 페이지 만들기  ===== --%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"  %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAJOTA</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
	<link rel="stylesheet"
	   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" />
	<script
	   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
	   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
  <style type="text/css">
  	#mycontainer	{ width:100%; margin:0 auto;  }
	#myheader		{ background-color: white; height:40px;   margin-left:0px; margin-top: 0px; width: 100%; }
	#mycontent		{  float:left; width:100%; min-height:800px; padding-top: 40px; }
	#myfooter		{ background-color: white; clear:both; height:50px; width: 100%; margin: auto; }
	p {line-height: 2}
	/* #displayRank 	{ margin:20px; height:200px;} */
	
	#myheader a {text-decoration:none;}
	
	/* mouse over link */
	#myheader a:hover {color: navy; font-weight: bolder;}
	/* 
	  unvisited link 
	a:link {color: #FF0000;}
		
	  visited link 
	a:visited {color: #00FF00;}
		
	  selected link 
	a:active {color: #0000FF;}
	*/
	
	#myheader .mynav {font-size: 13pt;}
	.myrank {font-weight:bold; color:red; font-size:13pt;}
	.mynumber {text-align:center;}
	
	</style>
</head>

<body>
	<div id="section1">
		<div id="myheader">
			<tiles:insertAttribute name="header" />
		</div>
		

		<!-- <div id="mycontainer"> -->
			<div id="mycontent">
				<tiles:insertAttribute name="side" />
				<div style="margin-top: -35%;">
				<tiles:insertAttribute name="content" />
				</div>
			</div>			
		<!-- </div> -->
		
			<div id="myfooter">
				<tiles:insertAttribute name="footer" />
			</div>
	</div>
</body>
</html>