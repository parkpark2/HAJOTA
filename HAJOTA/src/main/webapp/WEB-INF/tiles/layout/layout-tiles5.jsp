<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- ===== 효윤오빠부분  ===== --%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HAJOTA</title>
 
  <meta name="viewport" content="width=device-width, initial-scale=1">
   			 <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/TypeofCss/HY/main.css" />
   			 <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/TypeofCss/JW/sweetalert.css" />
			<script src="<%= request.getContextPath() %>/resources/js/HY/jquery.min.js"></script>
			<script src="<%= request.getContextPath() %>/resources/js/HY/jquery.scrolly.min.js"></script>
			<script src="<%= request.getContextPath() %>/resources/js/HY/jquery.scrollzer.min.js"></script>
			<script src="<%= request.getContextPath() %>/resources/js/HY/skel.min.js"></script> 
			<script src="<%= request.getContextPath() %>/resources/js/HY/util.js"></script>
			<script src="<%= request.getContextPath() %>/resources/js/HY/main.js"></script>
			<script src="<%= request.getContextPath() %>/resources/js/JW/sweetalert-dev.js"></script>
			<script src="<%= request.getContextPath() %>/resources/js/JW/sweetalert.min.js"></script>
<script>
	$(document).ready(function(evt){
		
		action(pageno,seq_lodge,totalcount);
		var e = evt || window.event;
		
	/* 	$("#body").keydown(function(e){
			if(e.keyCode == 8) {
				
				location.href="http://localhost:9090/hajota/rooms/list.go?search_content=당산&numOfPeople=1&startDate=06-27-2017&endDate=06-27-2017";
			}
		}); */
		
		
		
		
		
		
	});//document.ready
	var pageno = 3;
	var seq_lodge = ${listdetail.roomno};
	var totalcount = ${totalcount};
	
	function moreview(pageno,seq_lodge,totalcount){
		pageno= parseInt(pageno)+3;
		alert(seq_lodge); //10
 		alert(totalcount); //7
		alert(pageno); //31
		
		action(pageno,seq_lodge,totalcount); 
	} 
	
	function action(pageno,seq_lodge,totalcount){
	
		pageno = pageno;
		$.ajax({
			
			url : "/hajota/showreview.go",
			data : {pageno : pageno
				   ,seq_lodge : seq_lodge},
			dataType : "JSON",
			type : "GET",
			success : function(data){
				var showreview = "";
				$("#showallreview").empty();
				if(data.length ==0){
					alert("값없음");
				}
				else{
					alert("값잇음");
					$.each(data , function(entryIndex , entry){
						
						showreview+="<div  style='width: 300px;height: 200px;'>";
						showreview+="<img id='HY_P' alt='adf' src='<%=request.getContextPath()%>/resources/TypeofCss/HS/assets/img/defalut-avatar.png' style='width: 50px;margin-top: 1%;' />";
						showreview+="<input id='HY_N' type='text' style='margin-top: 0.2%;position: absolute;  border: none;' value='"+entry.Remail+"' readonly />";
						showreview+="<input id='HY_Y' type='text' style='margin-top: 3.5%;position: absolute;  border: none;' value='"+entry.Rscore+"' readonly />";
						showreview+="</div>";
						showreview+="<textarea id='HY_C'  style='width: 80%; margin-top: -10%; resize: vertical; border: none;' >"+entry.Rcontent+"</textarea><a href='javascript:reveiwreport("+entry.seqreview+");' id='HY_R' style='margin-left: 90%;'  >신고하기</a>";
						showreview+="<div style='border-bottom: solid rgba(0, 0, 0, 0.13)  3px;'></div>";
						
					});	
				}
				if(totalcount>pageno){
				showreview+="<button type='button' id='more' style='margin-left: 43%;' onclick=moreview('"+pageno+"','"+seq_lodge+"','"+totalcount+"'); >더보기?</button>"
				}
				
				$("#showallreview").html(showreview);
				
			},
			error : function(){
				alert("안됨");
			}
		});
		}
	
	function reveiwreport(reviewno){
		
		swal({
  		  title: "An input!",
  		  text: "Write something interesting:",
  		  type: "input",
  		  showCancelButton: true,
  		  closeOnConfirm: false,
  		  animation: "slide-from-top",
  		  inputPlaceholder: "Write something"
  		},
  		function(inputValue){
  			var email = "${email}"
  		
  		  if (inputValue === false){
  			  swal("신고취소!!!!", "신고하기를 취소하셧습돠", "error");
  			  
  		  }
  		  
  		  if (inputValue.trim() === "") {
  		    swal.showInputError("신고내용은 적으셔야죵");
  		    return false
  		  }
  		  
  		  $.ajax({
  			  
  			  url : "/hajota/ReviewreportEnd.go",
  		  	  data : {reviewno : reviewno,
  		  		      email : email,
  		  		      reviewcontent : inputValue},
  		  	  type : "GET",
  		  	  success : function(data){
  		  		  if(data == 1){
  		  			swal("신고 완료!!", "신고가 접수되었습니다", "success");
  		  		  }
  		  		  else{
  		  			swal("신고취소!!!!", "신고하기를 취소하셧습돠", "error"); 
  		  		  }
  		  		  
  		  	  },
			  error : function(){
				alert("안됨");
			}
  			  
  		  });
  		});
		
	}//end of function
	
	</script>			
			
</head>

<body id="body">
		
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