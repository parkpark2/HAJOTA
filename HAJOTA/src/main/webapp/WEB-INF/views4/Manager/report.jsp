<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

table {
   width:100%;
   margin-bottom:10px;
}
table tr th, table tr td {
   padding:5px 10px; 
}
table tr th {
   background:#669999 none repeat-x scroll bottom left;
   color:#ffffff;
   border-top:2px solid black;
}
table tr td {
   border-bottom:1px solid #dddddd;
}

 div.content {
   float:left;
   width:65%;
   padding-right:5px;
}
</style>
<script>
function goDelete(reportno){
   
   $.ajax({
      
      url : "/hajota/Delreport.go",
      data : {reportno : reportno},
      success : function(data){
         if(data==1){
            javascript:history.go(0);
         }else{
            alert("삭제취소");
         }
         
      },
      error: function(){
         
      }
      
   });
   
   
   
   
}
</script>
</head>

<div style="background-color: none; width:100%;">
   <span style="font-size: 25px; font-weight: bold;">
      <img src="<%= request.getContextPath() %>/resources/images/HSSH/managericon.png" style="width: 50px; height: 50px;" />
   신고 목록 페이지</span>  
</div>
<br/>
<div id="line" style="position:relative; top:15%; background-color:navy; color: white; height: 3px; width:160%;"> 
   
</div>

<div class="container" style="background-color: none; width:70%; height:100%; margin-left:0%;">  
    <div class="pagewidth" style="background-color: none; width:100%; margin-left:0%;">
     <div style="background-color: none; width:100%; margin-top:10%; margin-left:0%;">
      <div class="content" style="background-color: none; width: 100%; margin-top: 80px; height: 600px; margin-left:0%; margin-right:100px;">

      <form name="reportFrm">
           <table style="width: 1300px; margin-left: 140px; margin-top: 32px;">
                <tr>
               <th style="text-align: center;"><span style="font-size: 15px; font-weight: bold;">숙소번호</span></th>
               <th style="text-align: center;"><span style="font-size: 15px; font-weight: bold;">이메일</span></th>
               <th style="text-align: center;"><span style="font-size: 15px; font-weight: bold;">리뷰번호</span></th>
               <th style="text-align: center;"><span style="font-size: 15px; font-weight: bold;">내 용</span></th>
               <th style="text-align: center;"><span style="font-size: 15px; font-weight: bold;">글쓴날</span></th>
               <th style="text-align: center;"><span style="font-size: 15px; font-weight: bold;">삭 제</span></th>
              </tr>
         
             <c:if test="${allreportList != null || not empty allreportList}">
                <c:forEach var="report" items="${allreportList}">            
                  <tr>
                       <td style="text-align: center;">${report.SEQ_LODGE}</td>
                       <td style="text-align: center;">${report.EMAIL}</td>
                         <td style="text-align: center;">${report.SEQ_REVIEW}</td>
                       <td style="text-align: center;">${report.CONTENT}</td>
                       <td style="text-align: center;">${report.REPORTDATE}</td>        
                       <td><button style="margin-left: 30%;" type="button" class="btn btn-danger" onClick="goDelete('${report.SEQ_REVIEW}');">삭제</button></td>             
                 </tr>                      
                </c:forEach>
             </c:if>
                
             <c:if test="${allreportList == null || empty allreportList}">
                  <tr>
                     <td colspan="6" style="margin-left:20%;">검색한 정보가 없습니다.</td>
                  </tr>               
             </c:if>           
          </table>
      </form>
   </div>
   </div>
   </div>
   </div>
   
   <form name="delFrm">
   <input type="hidden" name="reportno" />
   </form>
</html>