<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<style type="text/css">
	.navbarcontainer {
		width: 100%;
	}
</style>
 
</head>

<body>
	<%-- 
	<div>
		<div style="display: inline-block; float: left;">
			<img src="<%= request.getContextPath() %>/resources/images/oneofall/loco.png" style="width:130px; height:40px;"/>  
		</div>
		
		<div style="display: inline-block; width: 70%; text-align: center; padding-top: 10px;">
			
		</div>
		
		
		<div style=" display: inline-block; float: right;"> 
	 		<img src="<%= request.getContextPath() %>/resources/images/oneofall/1.jpg" style="width:30px; height:40px;"/>&nbsp;&nbsp;
	 		<img src="<%= request.getContextPath() %>/resources/images/oneofall/2.jpg" style="width:30px; height:40px;"/>&nbsp;&nbsp;
	 		<img src="<%= request.getContextPath() %>/resources/images/oneofall/3.jpg" style="width:30px; height:40px;"/>&nbsp;&nbsp;
	 		<img src="<%= request.getContextPath() %>/resources/images/oneofall/4.jpg" style="width:30px; height:40px;"/>
 		</div>
	</div>
 --%>
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="navbarcontainer">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/"><strong style="color: #29d846">Ha</strong>Jota</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="/">Home</a></li>
				<li><a href="#">About</a></li>
				<li><a href="#">Contact</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Major Attractions<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Disney</a></li>
						<li><a href="#">Seaworld</a></li>
						<li><a href="#">Universal</a></li>
					</ul>
				</li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li><img src="<%= request.getContextPath() %>/resources/images/oneofall/1.jpg" style="width:30px; height:40px;"/></li>
		 		<li><img src="<%= request.getContextPath() %>/resources/images/oneofall/2.jpg" style="width:30px; height:40px;"/></li>
		 		<li><img src="<%= request.getContextPath() %>/resources/images/oneofall/3.jpg" style="width:30px; height:40px;"/></li>
		 		<li><img src="<%= request.getContextPath() %>/resources/images/oneofall/4.jpg" style="width:30px; height:40px;"/></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	</nav>

</body>
</html>