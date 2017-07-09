<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#mycontainer	{ width:100%; margin:0 auto;  }
	#myheader		{ background-color: white; height:40px;   margin-left:0px; margin-top: 0px; width: 100%; }
	#mycontent		{  float:left; width:100%; min-height:800px; padding-top: 40px; }
	#myfooter		{ background-color: white; clear:both; height:50px; width: 100%; margin: auto; }
	p {line-height: 2}
</style>
</head>
<body>
<div id="mycontainer">
		
		<div id="myheader">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="mycontent">
			<tiles:insertAttribute name="content" />
		</div>
		<div id="myfooter">
			<tiles:insertAttribute name="footer" />
		</div>
		
	</div>
</body>
</html>