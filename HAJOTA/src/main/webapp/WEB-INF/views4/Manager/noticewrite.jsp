<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	function goWrite() {
		var writeFrm = document.writeFrm;
		writeFrm.action = "/hajota/noticewriteEndManager.go";
		writeFrm.method = "post";
		writeFrm.submit();
	}
</script>

<div>
		<span style="font-size: 25px; font-weight: bold;">공지사항 글쓰기</span>
</div>
<div id="line" style="position:relative; top:10px; background-color:navy; height: 3px; ">
</div>
	
<div style="padding-left: 30%; border: solid 0px red;">
	
    <form name="writeFrm" enctype="multipart/form-data">

    <br/><br/>
    
    <div style="margin-left :-450px; border: solid 0px red">
    <div style="margin-left : 450px;">     
		
			<br/><br/>
			<div class="form-group" style="text-align: center;">
			    <label for="admin_id" style="margin-left: -864px;">아이디 </label>
			    <input type="text" style="margin-left:95px; width: 500px;" name="admin_id" id="admin_id" class="form-control" style="width:150px;"/>
	  		</div>
	  		
			<div class="form-group" style="text-align: center;">
			    <label for="subject" style="margin-left: -864px;">제   목 </label>
			    <input type="text" style="margin-left:95px; width: 500px;" name="subject" id="subject"  class="form-control" style="width:150px;"/>
			</div>
		 
		    <div class="form-group" style="text-align: center;">
			    <label for="content" style="margin-left: -864px;">내   용</label><br/>
			    <textarea rows="10" cols="80" style="margin-left:95px; margin-bottom:40px; width: 500px; height: 300px;" name="content" id="content" class="form-control" style="width:150px;"></textarea> 
		    </div>		  		
		
	</div> 
	</div>	

	<div style="margin-left: 260px;">
		<button type="button" class="btn btn-primary" onClick="goWrite();">쓰기</button>
		<button type="button" class="btn btn-danger" onClick="javascript:history.back();">취소</button>
	</div>
	
	<br/>
	
	</form>

</div>	



