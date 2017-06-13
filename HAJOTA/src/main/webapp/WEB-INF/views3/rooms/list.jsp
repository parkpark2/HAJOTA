<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
	  
	});
</script>

<style>
/* Global */
/* body {
	background: #3399cc;
	padding: 40px;
} */
img {
	max-width: 100%;
}

a {
	-webkit-transition: all 150ms ease;
	-moz-transition: all 150ms ease;
	-ms-transition: all 150ms ease;
	-o-transition: all 150ms ease;
	transition: all 150ms ease;
}

a:hover {
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
	/* IE 8 */
	filter: alpha(opacity = 50); /* IE7 */
	opacity: 0.6;
	text-decoration: none;
}

/* Container */
.container-fluid {
	background: #FFFFFF;
	/* margin: 40px auto 10px;
	padding: 20px 40px 0; */
	max-width: 960px;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
}

/* Page Header */
.page-header {
	background: #f9f9f9;
	/* margin: -30px -40px 40px;
	padding: 20px 40px;
	border-top: 4px solid #ccc; */
	color: #999;
	text-transform: uppercase;
}
/* 
.page-header h3 {
	line-height: 0.88rem;
	color: #000;
} */

/* Thumbnail Box */
.caption h4 {
	font-size: 1rem;
	color: #444;
}

.caption p {
	font-size: 0.75rem;
	color: #999;
}

.btn.btn-mini {
	font-size: 0.63rem;
}

/* Carousel Control */
.control-box {
	text-align: right;
	width: 100%;
}

.carousel-control {
	background: #666;
	border: 0px;
	border-radius: 0px;
	display: inline-block;
	font-size: 34px;
	font-weight: 200;
	line-height: 18px;
	opacity: 0.5;
	padding: 4px 10px 0px;
	position: static;
	height: 30px;
	width: 15px;
}

/* Footer */
.footer {
	margin: auto;
	width: 100%;
	max-width: 960px;
	display: block;
	font-size: 0.69rem;
}

.footer, .footer a {
	color: #c9e4f7;
}

p.right {
	float: right;
}

/* Mobile Only */
@media ( max-width : 767px) {
	.page-header, .control-box {
		text-align: center;
	}
}

@media ( max-width : 479px) {
	.caption {
		word-break: break-all;
	}
}

/* ADD-ON
-------------------------------------------------- */
/* body:after {
	content: "less than 320px";
	font-size: 1rem;
	font-weight: bold;
	position: fixed;
	bottom: 0;
	width: 100%;
	text-align: center;
	background-color: hsla(1, 60%, 40%, 0.7);
	color: #fff;
	height: 20px;
	padding-top: 0;
	margin-left: 0;
	left: 0
}

@media only screen and (min-width:320px) {
	body:after {
		content: "320 to 480px";
		background-color: hsla(90, 60%, 40%, 0.7);
		height: 20px;
		padding-top: 0;
		margin-left: 0
	}
}

@media only screen and (min-width:480px) {
	body:after {
		content: "480 to 768px";
		background-color: hsla(180, 60%, 40%, 0.7);
		height: 20px;
		padding-top: 0;
		margin-left: 0
	}
}

@media only screen and (min-width:768px) {
	body:after {
		content: "768 to 980px";
		background-color: hsla(270, 60%, 40%, 0.7);
		height: 20px;
		padding-top: 0;
		margin-left: 0
	}
}

@media only screen and (min-width:980px) {
	body:after {
		content: "980 to 1024px";
		background-color: hsla(300, 60%, 40%, 0.7);
		height: 20px;
		padding-top: 0;
		margin-left: 0
	}
}

@media only screen and (min-width:1024px) {
	body:after {
		content: "1024 and up";
		background-color: hsla(360, 60%, 40%, 0.7);
		height: 20px;
		padding-top: 0;
		margin-left: 0
	}
}
 */
::selection {
	background: #ff5e99;
	color: #F5F5F5;
	text-shadow: 0;
}

::-moz-selection {
	background: #ff5e99;
	color: #F5F5F5;
}

a, a:focus, a:active, a:hover, object, embed {
	outline: none;
}

:-moz-any-link:focus {
	outline: none;
}

input::-moz-focus-inner {
	border: 0;
}
</style>

</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">

				<!--
 				<div class="page-header">
					<h3>Bootstrap</h3>
					<p>Responsive Moving Box Carousel Demo</p>
				</div>
 -->
				<div class="carousel slide" id="myCarousel">
					<div class="carousel-inner">
						<div class="item active">
							<ul class="thumbnails">
								<li class="span3">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">&raquo; Read More</a>
									</div>
								</li>
								<li class="span3">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">&raquo; Read More</a>
									</div>
								</li>
								<li class="span3">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">&raquo; Read More</a>
									</div>
								</li>
								<li class="span3">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">&raquo; Read More</a>
									</div>
								</li>
							</ul>
						</div>
						<!-- /Slide1 -->
						<div class="item">
							<ul class="thumbnails">
								<li class="span3">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">&raquo; Read More</a>
									</div>
								</li>
								<li class="span3">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">&raquo; Read More</a>
									</div>
								</li>
								<li class="span3">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">&raquo; Read More</a>
									</div>
								</li>
								<li class="span3">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">&raquo; Read More</a>
									</div>
								</li>
							</ul>
						</div>
						<!-- /Slide2 -->
						<div class="item">
							<ul class="thumbnails">
								<li class="span3">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">&raquo; Read More</a>
									</div>
								</li>
								<li class="span3">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">&raquo; Read More</a>
									</div>
								</li>
								<li class="span3">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">&raquo; Read More</a>
									</div>
								</li>
								<li class="span3">
									<div class="thumbnail">
										<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>Praesent commodo</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="#">&raquo; Read More</a>
									</div>
								</li>
							</ul>
						</div>
						<!-- /Slide3 -->
					</div>

					<div class="control-box">
						<a data-slide="prev" href="#myCarousel"
							class="carousel-control left">‹</a> <a data-slide="next"
							href="#myCarousel" class="carousel-control right">›</a>
					</div>
					<!-- /.control-box -->

				</div>
				<!-- /#myCarousel -->

			</div>
			<!-- /.span12 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
</body>
</html>