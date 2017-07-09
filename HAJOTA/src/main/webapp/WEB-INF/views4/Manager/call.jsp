<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="<%= request.getContextPath()%>/resources/js/SH/jquery-2.0.0.js"></script>
 
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEM1_6g0M675zuc-nJwdmBf-reTcY_v60"></script>

<style>
#map {
   width: 400px;
   height: 200px;
   position: relative;
   z-index : 2
}

#myDIV {
      z-index :3;
      position : relative; 
      margin-top : 5%;   
      }
    
#content {
         z-index : 2; 
         position : relative;
       }

#Video1 {
         z-index : 4;
         position : relative;
      }
      
#skipDIV { 
         z-index : 5;
         position : relative; 
         margin-top : 5%;
       }
  
#span {
   z-index : 1;
   margin-top:10%;
}
</style>
  
<script type="text/javascript">
   var cnt = 0;
   
    $(document).ready(function(){
       $("#content").hide();
       $("#daummap").hide();
        
       $("#skip").click(function(){
          $("#myDIV").hide();
          $("#skipDIV").hide();
          $("#content").show();
       }); // end of $("#skip").click(function() 
       
       $("#button").click(function(){
          $("#daummap").show();
          
          cnt++;
          
          if(cnt%2 == 1){
               $("#daummap").show();
          }
          else if(cnt%2 == 0) {
             $("#daummap").hide();
          }
       }); // end of $("#button").click(function()
    });
       
</script>
<div style="line-height: 90%;">
<div id="skipDIV" style="margin-left:2%; margin-top: 1%;">
       <button class="btn btn-danger" type="button" id="skip" style="width:5%; height: 3%;"><span style="font-weight:bold;">SKIP</span></button> 
       <span id="span" style="font-weight: bold; color: black; margin-left:2%;">광고를 보지 않으시려면 <span style="color:red;">"Skip"</span> 버튼을 누르세요!!</span>
</div>        


<div id="myDIV" style="width:104%; height:10%; margin-left:-2%; margin-top:-8%; margin-right:-4%;"> 
   <video controls autoplay loop id="Video1" style="width:94%; height:10%; margin-top:5%; margin-left:3%;">      
         <source src="<%= request.getContextPath() %>/resources/images/HSSH/동영상.mp4"/>        
   </video>
</div> 

<div id="content">
   <div style="margin-top:2%; margin-left:10%;" id="content"> 
      <img src="<%= request.getContextPath() %>/resources/images/HSSH/manager.png" style="width: 4%; height: 4%;"/>    
      <span style="font-weight:bold; font-size:20pt;">&nbsp;&nbsp;Manager</span><br/><br/>
      <span style="font-weight:bold; font-size:18pt; color:blue; margin-left:7%; margin-top:-1%;">경리 서영학</span>  
   </div>  
    
   <div style="margin-top:1%; margin-left:10%;" id="content"> 
      <img src="<%= request.getContextPath() %>/resources/images/HSSH/call.png" style="width: 4%; height: 4%;"/>
      <span style="font-weight:bold; font-size:20pt;">&nbsp;&nbsp;Tel</span><br/><br/>
      <span style="font-weight:bold; font-size:18pt; color:blue; margin-left:7%; margin-top:-1%;">010 - 5553 - 0959</span>
   </div>
    
   <div style="margin-top:1%; margin-left:10%;" id="content"> 
      <img src="<%= request.getContextPath() %>/resources/images/HSSH/address.png" style="width: 4%; height: 4%;"/>
      <span style="font-weight:bold; font-size:20pt;">&nbsp;&nbsp;Address</span><br/><br/>
      <span style="font-weight:bold; font-size:18pt; color:blue; margin-left:7%; margin-top:-1%;">서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F, 20F</span>
   </div>
<div style="margin-top:-9%;">     
   <div id="span" style="margin-left:20%; margin-top:10%;">
    <img src="<%= request.getContextPath() %>/resources/images/HSSH/company.png" style="margin-left:-13%; width: 6%; height: 6%;"/>
      <span style="font-weight:bold; font-size:20pt; margin-left:-1%; margin-top:-50%">&nbsp;&nbsp;Introduce</span><br/><br/>
   </div>
   
   <div style="margin-top:0%; margin-left:10%; border:solid 2px black;" id="content">
    <p style="color:blue; font-size:20pt;"> 
       ' 편안한 숙소 '
    </p>   
       
      <p style="color:#3399ff; font-size:15pt;">
         안녕하십니까 (주)타입오브 대표 서영학 입니다
         회사의 기본 목표는 최고로 편안한 숙박시설에 있으며, 글로벌적으로 확충된 모든 인류의 많은 여행과, 명소옆에 자리 잡은 숙박시설들을 추천해주며 가이드해주는 역할을 하고 있습니다.
      </p>
      
      <p>
      (주)타입오브는 한국에 본사를 두고 있는 글로벌 숙박 기업 <span style="color:blue;">‘숙박 인터내셔널 (Sookbak International Inc.)’</span>의 한국법인입니다.
      (주)타입오브는 매일매일 전 세계 수백만 인류의 숙박과 여행을 편한하시도록 돕는 위치에 있습니다.
   <p>
      (주)타입오브의 숙박시설은 모든 인류를 위해 일하고있습니다. (주)타입으브는 사람들의 의, 식, 주 이외에도, 편안한 인간관계, 친절한 서비스 등 숙박의 필수적인 의,식,주와 서비스를 개발, 제공하고 있습니다. 지난 80여년간 주(타입오브)는 ‘편안한 휴식공간’이라는 사명을 바탕으로 이룩한 수많은 노력을 통해, 비용효과적인 숙박과 관련된 솔루션을 제공함과 동시에 유명한 명소들과의 접근성 확대를 위해 노력해왔습니다.
      1991년 숙박 인터내셔널의 한국법인으로 설립된 (주)타입오브 역시 이런 기업 사명을 바탕으로 국내에 양질의 숙박과 먹을 것, 서비스 솔루션을 제공해왔으며 내국인들의 접근성 향상과 국외 외국인들을 위해서도 힘쓰고 있습니다. 또한 편안한 잠자리, 외국인을 위한 편안한 서비스등 할 수 있는 사회공헌 활동을 통해 우리 이웃과 직원 그리고 지역사회에 긍정적인 영향을 주기 위해 노력하고 있습니다.
      앞으로도 저희는 숙박이 필요한 사람들이 필요로 하는 곳에서 늘 함께 하며, 더 건강한 미래를 만들어 가는 데 기여하기 위해 최선을 다하겠습니다.
   </p>
   <p>
      감사합니다.
   </p>
   </div>  
</div>   

   <div style="margin-top:1%; margin-left:10%;" id="content"> 
      <img src="<%= request.getContextPath() %>/resources/images/HSSH/map.png" style="width: 4%; height: 4%;"/>
      <span style="font-weight:bold; font-size:20pt;">&nbsp;&nbsp;Map&nbsp;&nbsp;</span><button type="button" id="button" class="btn btn-primary btn-xs">▼</button>         
   </div>
   
   <div id="map" style="display: inline-block;"></div>
   <iframe id="daummap" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d805.9347704690919!2d126.8971241950394!3d37.5336554835935!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9ec3afcd675b%3A0x1d3b8e50a735e00a!2z7J2066CI67mM65Sp!5e0!3m2!1sko!2skr!4v1498800858797"
             width="1200" height="600" frameborder="0" style="border:0; margin-left:-10%;" allowfullscreen>
   </iframe>
   
   </div>
   
  </div>  