<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="<%= request.getContextPath() %>/resources/js/JW/jquery-2.0.0.js"></script>
   
<style type="text/css">
     /* table, th, td {border: solid gray 1px;}
     #table {border-collapse: collapse; width: 820px;}
     #table th, #table td {padding: 5px;}
     #table th {background-color: #DDDDDD;}
     
     a{text-decoration: none;}  */
     
table {
   border-collapse: collapse;
   width: 80%;
}
th{background-color: #5cb85c;
font-family: 'Helvetica Neue', Helvetica, Arial;
color: white;
 
}
th, td {
    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #ddd;
}
tr:hover{background-color:#f5f5f5}

	.panel{
  padding-bottom:10px;
  margin-top:100px;
}
        
</style>
 
<script type="text/javascript">
     $(document).ready(function(){
          
           searchKeep();
          
     //   ===== #147. Ajax 로 검색어 입력시 자동글 완성하기 2 =====
          $("#displayList").hide();
     
         $("#search2").keyup(function(){
          
          var form_data = { colname : $("#colname2").val(),  // 키값 : 밸류값
                              search  : $("#search2").val()    // 키값 : 밸류값
                            };
          
          $.ajax({
               url: "/hajota/wordSearchShow.go",
               type: "GET",
               data: form_data,  // url 요청페이지로 보내는 ajax 요청 데이터
               dataType: "JSON",
               success: function(data){
                   
               // ===== #152. Ajax 로 검색어 입력시 자동글 완성하기 7 =====
                  if(data.length > 0) {
                     // 검색된 데이터가 있는 경우.
                     // 조심할것은 if(data != null) 으로 하면 안된다.
                      var resultHTML = "";
                    
                      $.each(data, function(entryIndex, entry){
                           var wordstr = entry.RESULTDATA.trim();
                                 // 검색어 - 영주                    aj
                                 // 결과물 - 김영주 프로그래머     AJAX
                            //         김영주바둑기사        ajax 프로그래밍
                            //         영주사과
                          
                            var index = wordstr.toLowerCase().indexOf( $("#search2").val().toLowerCase() );
                                 var len = $("#search2").val().length;
                                 var result = "";
                                
                                 result = "<span class='first' style='color: blue;'>" +wordstr.substr(0, index)+ "</span>" + "<span class='second' style='color: red; font-weight: bold;'>" +wordstr.substr(index, len)+ "</span>" + "<span class='third' style='color: blue;'>" +wordstr.substr(index+len, wordstr.length - (index+len) )+ "</span>";       
                          
                                  resultHTML += "<span style='cursor: pointer;'>" + result + "</span><br/>";       
                      });
                    
                      $("#displayList").html(resultHTML);
                      $("#displayList").show();
                  }
                  else {
                     // 검색된 데이터가 없는 경우.
                     // 조심할것은 if(data == null) 으로 하면 안된다.
                      $("#displayList").hide();
                  }
                   
               },
               error: function(){
                          alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
                   }
          });
          
         }); // end of keyup(function(){})---------
        
        
         // ===== #153. Ajax 로 검색어 입력시 자동글 완성하기 8 =====
         $("#displayList").click(function(event){
              var word = "";
              
              var $target = $(event.target);
              
              if($target.is(".first")) {
                   word = $target.text() + $target.next().text() + $target.next().next().text();
              //   alert(word);
              }
              else if($target.is(".second")) {
                   word = $target.prev().text() + $target.text() + $target.next().text();
              //   alert(word);
              }
              else if($target.is(".third")) {
                   word = $target.prev().prev().text() + $target.prev().text() + $target.text();
              //   alert(word);
              }
              
              $("#search2").val(word); // 텍스트박스에 검색된 결과의 문자열을 입력해준다.
              
              $("#displayList").hide();
              
         }); // end of $("#displayList").click()---------    
        
          
          
     });// end of $(document).ready()----------------------
     
     
     function goSearch(){
          
          var searchFrm = document.searchFrm;
          var search = $("#search2").val();
          
         
              searchFrm.action = "/hajota/questionList.go";
              searchFrm.method = "GET";
              searchFrm.submit();
          
          
     }
     
     function searchKeep(){
          <c:if test="${not empty colname && not empty search}">
              $("#colname2").val("${colname}"); // 검색어 컬럼명을 유지시켜 주겠다.
              $("#search2").val("${search}");   // 검색어를 유지시켜 주겠다.
          </c:if>
     }
     function goalert(){
    	 alert("자신의 글만 읽을 수 있습니다.");
     }
     
</script>
<div>
     <span style="font-size: 35px; font-weight: bold;"><img src="<%= request.getContextPath() %>/resources/images/ISJW/user2.png" style="width: 50px; height: 50px; margin-left: 13%;" />&nbsp;Q&A</span>
</div>
<div id="line"
		style="position: relative; top: 10px; background-color: #5cb85c; height: 3px; margin-left: 20%;"></div>

	<div style="padding-left: 10%; margin-top: 2%; margin-left: 20%;" >
	
	<table id="table" style="margin-top: 30px; margin-left: -14%; width: 114%;" > 
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>이메일</th>
				<th>날짜</th>
				<th>답변 여부</th>
			</tr>
			
			<c:if test="${questionList != null || not empty questionList}">	
			<c:forEach var="que" items="${questionList}" varStatus="status">
				<tr>
					<td align="center">${que.SEQ_QUESTION}</td>
					<td>
					<c:if test="${sessionScope.loginuser.EMAIL == que.EMAIL}">	
					<a href="<%= request.getContextPath() %>/qnaDetail.go?seq=${que.SEQ_QUESTION}">${que.SUBJECT}</a>
					</c:if>
					<c:if test="${sessionScope.loginuser.EMAIL != que.EMAIL}">	
					<a onclick="goalert();">${que.SUBJECT}</a>
					</c:if>	
					</td>
					<td>${que.EMAIL}</td>
					<td>${que.WRITEDATE}</td>
					<td><c:if test="${que.REPLYSTATUS==1}">		        	
				        	&nbsp;&nbsp;답변완료     	
				        	</c:if> <c:if test="${que.REPLYSTATUS==0}">			        	
				        	&nbsp;&nbsp;미답변			        	
				        	</c:if></td>
				</tr>
			</c:forEach>
			</c:if>
		
		<c:if test="${questionList == null || empty questionList}">
			<tr>
				<td align="center">일치하는 검색어가 없습니다.</td>
			</tr>
		</c:if>

	</table>
		<br />
		
		
	<!-- ===== #115. 페이지바 보여주기 ===== -->
	
	     <div align="center" style="width: 450px; margin-left: 100px; margin-right: auto;">
	         
	          ${pagebar}
	     	 
	     </div>
     
     
	     
     
     <br/>
    
     <!-- ===== #103. 글검색 폼 추가하기 : 제목, 내용, 글쓴이로 검색하도록 한다. ===== -->
     <form name="searchFrm">
          <select name="colname" id="colname2">
              <option value="subject">제목</option>
              <option value="content">내용</option>
              <option value="email">이메일</option>
          </select>
          <input type="text" name="search" id="search2" size="40px"/>
          <button type="button" style="background-color: #5cb85c; border-color: #4cae4c; color: white;" class="btn" onClick="goSearch();">검색</button>
     </form>
     
     <!-- ===== #146. Ajax 로 검색어 입력시 자동글 완성하기 1 ===== -->
     <div id="displayList" style="width:302px; margin-left: 61px; border: solid 1px gray; border-top: 0px;">
     </div>  
     
     
     <div style="margin-top: 20px;">
          <button type="button" style="background-color: #5cb85c; border-color: #4cae4c; color: white;" class="btn" onClick="javascript:location.href='<%= request.getContextPath() %>/questionList.go'">글목록</button>&nbsp;
          <button type="button" style="background-color: #5cb85c; border-color: #4cae4c; color: white;" class="btn" onClick="javascript:location.href='<%= request.getContextPath() %>/add.go'">글쓰기</button>
     </div>
     
</div>
