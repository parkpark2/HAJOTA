<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== 관리자tiles ===== --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>    
    
<!DOCTYPE html>
<html>
 
<body>
	<div id="mycontainer">
		 <div id="myheader">
			<tiles:insertAttribute name="header" />
		</div> 
	
		<div id="mycontent">
			<tiles:insertAttribute name="content" />
		</div>
	</div>
</body>



</html>