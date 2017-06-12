<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== #35. tiles 를 사용하는 레이아웃 페이지 만들기  ===== --%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"  %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tiles 를 사용한 메인(시작) 페이지 작성하기</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  	
  <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-2.0.0.js"></script>

  
  <style type="text/css">
  	#mycontainer	{  margin:0 auto; background: url('<%=request.getContextPath()%>/resources/images/oneofall/index.jpg') no-repeat center center fixed; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; background-size: cover; }
	#myheader		{ height:40px; padding: 10px; opacity: 0.5; margin-left:-10px; margin-top: 0px; width: 100%; }
	#mycontent		{  float:left; width:100%; min-height:800px; padding-top: 40px; }
	#myfooter		{ clear:both; height:100px; opacity: 0.5; }
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

	
	<div id="mycontainer" >
		<div id="myheader">
			<tiles:insertAttribute name="header" />
		</div>
	
		<div>
			<tiles:insertAttribute name="search" />
		</div>	
		
	</div>
	<div id="myfooter">
			<tiles:insertAttribute name="footer" />
		</div>
</body>
</html>