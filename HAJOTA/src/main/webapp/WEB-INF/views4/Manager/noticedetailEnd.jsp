<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style type="text/css">
	table, th, td, input, textarea {border: solid gray 1px;}
	
	#table {border-collapse: collapse;
	 		width: 600px;
	 		}
	#table th, #table td{padding: 5px;}
	#table th{width: 120px; background-color: #DDDDDD;}
	#table td{width: 480px;}
	.long {width: 470px;}
	.short {width: 120px;} 		

</style>

<script type="text/javascript">
	
	$(document).ready(function() {
	
	});
	
	// 확인버튼을 누르면 뒤로 가도록 하자
	 function goCheck() {
		window.history.back();
	}
	
	// 수정 버튼을 누르면 수정하기	
	function goChange() {
				
		var changeFrm = document.changeFrm;
		changeFrm.action = "/hajota/noticechangeManager.go";
		changeFrm.method = "post";
		changeFrm.submit();
		
	} 
	
</script>

<div style="background-color: none; width:100%;">
	<span style="font-size: 25px; font-weight: bold;">세부 공지사항 페이지</span>  
</div>
<br/>
<div id="line" style="position:relative; top:15%; background-color:navy; height: 3px; width:101%;"> 
	
</div>

<div class="container" style="background-color: none; width:80%; height:100%; margin-left:0%;">  
    <div class="pagewidth" style="background-color: none; width:100%; margin-left:0%;">
	  <div style="background-color: none; width:100%; margin-top:10%; margin-left:0%;">
		<div class="content" style="background-color: none; width: 100%; margin-top: 80px; height: 600px; margin-left:0%; margin-right:100px;">
			  	
    <div style="margin-left :10%; border: solid 0px red; margin-top:-10%">  
    
     <form name="changeFrm" style="margin-left:10%;">	 

    <div>     
			<c:if test="${n != null || not empty n}">
			<br/><br/>
			
			<div class="form-group" style="text-align: center; margin-left:10%; margin-top:0%">
			    <label for="seq_notice" style="margin-left:-40%; margin-top:12%;">&nbsp;&nbsp;&nbsp;글 번호</label>  
			    <input type="text" style="margin-left:28%; width: 30%;" name="seq_notice" id="seq_notice" value="${n.SEQ_NOTICE}" class="form-control" readonly/>		    			  		    
	  		</div>
	  		
			<div class="form-group" style="text-align: center; margin-left:10%; margin-top:-10%">
			    <label for="admin_id" style="margin-left:-40%; margin-top:12%;">이 메 일</label>
			    <input type="text" style="margin-left:28%; width: 30%;" name="email" id="email" value="${n.EMAIL}" class="form-control" readonly/>
			</div>		     		
		   			  		 
			<div class="form-group" style="text-align: center; margin-left:10%; margin-top:-10%">
			    <label for="subject" style="margin-left:-40%; margin-top:12%;">제 목</label>
			    <input type="text" style="margin-left:28%; width: 30%;" name="subject" id="subject" value="${n.SUBJECT}" class="form-control" />
			</div>   
		     
		    <div class="form-group" style="text-align: center; margin-left:10%; margin-top:-10%">
			    <label for="content" style="margin-left:-40%; margin-top:12%;">내   용</label><br/>
			    <textarea rows="10" cols="80" style="margin-left:28%; width: 30%; height: 30%" id="content" name="content" class="form-control">${n.CONTENT}</textarea>		    
		    </div>	
		     
		    <div class="form-group" style="text-align: center; margin-left:10%; margin-top:-10%">
			    <label for="writedate" style="margin-left:-40%; margin-top:12%;">날 짜</label>
			    <input type="text" style="margin-left:28%; width: 30%;" name="writedate" id="writedate" value="${n.WRITEDATE}" class="form-control" readonly/>
			</div>
			
			</c:if>
	</div> 
		
	</form>
	
	</div>	

	<div style="margin-left: 58%;">
		<button type="button" class="btn btn-primary" onClick="goCheck();">뒤로가기</button>
		<button type="button" class="btn btn-danger" onClick="goChange();">수정</button>
	</div>
	
	<br/>
	
</div>

</div>
</div>
	
</div>

</html>
