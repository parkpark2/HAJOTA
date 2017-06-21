<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== #35. tiles 를 사용하는 레이아웃 페이지 만들기  ===== --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소안되</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
   			 <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/TypeofCss/HY/main.css" />
			<script src="<%= request.getContextPath() %>/resources/js/HY/jquery.min.js"></script>
			<script src="<%= request.getContextPath() %>/resources/js/HY/jquery.scrolly.min.js"></script>
			<script src="<%= request.getContextPath() %>/resources/js/HY/jquery.scrollzer.min.js"></script>
			<script src="<%= request.getContextPath() %>/resources/js/HY/skel.min.js"></script>
			<script src="<%= request.getContextPath() %>/resources/js/HY/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="<%= request.getContextPath() %>/resources/js/HY/main.js"></script>
</head>

<body>
		
	<div id="mycontainer">
		<div>
				<tiles:insertAttribute name="testheader" />
		</div>
		<!-- Main -->
			<div id="main">

				<!-- Introdd -->
					<section id="top" class="one dark cover">
						<tiles:insertAttribute name="section1" />
					</section>

				<!-- Portfolio -->
					<section id="portfolio" class="two dark cover">
						<tiles:insertAttribute name="section2" />
					</section>

				<!-- About Me -->
					<section id="about" class="three dark cover">
						<tiles:insertAttribute name="map" />
						<tiles:insertAttribute name="section3" />
					</section>

				<!-- Contact -->
					<section id="contact" class="four dark cover">
						<tiles:insertAttribute name="section4" />
					</section>

			</div>
		<div>
				<tiles:insertAttribute name="testfooter" />
		</div>
	</div>
</body>
</html>