<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/TypeofCss/JW/JW.css" />

<style type="text/css">

.body .container .half.bg {
  background-image: url("<%= request.getContextPath() %>/resources/images/ISJW/loginbg.jpg");
  background-repeat: no-repeat;  
}


.button {
    background-color: #008CBA; /* Blue */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}

.button2 {background-color: #3B5998;} /* Blue */
.button4 {background-color: #e7e7e7; color: black;} /* Gray */

</style>

<script type="text/javascript">
 
     $(document).ready(function(){
        
       if(${sessionScope.loginuser.GRADE== 1}){
          location.href="<%= request.getContextPath()%>/indexManager.go"    
       }
       
       if(${sessionScope.loginuser.GRADE== 2}){
          location.href="<%= request.getContextPath()%>/indexManager.go"    
       }
       
       if(${sessionScope.loginuser.GRADE== 3}){
          location.href="<%= request.getContextPath()%>/indexManager.go"    
       }
       
        $(".error").hide();
        
        $("#join_email").bind("keyup", function(){
           alert("이메일 중복확인 버튼을 클릭하여 email 중복 검사를 하세요~~");
           $(this).val("");
        });// end of $("#userid").bind()--------------------------------

        
           $("#join_email").blur(function(){
          
           var guest_email = $("#join_email").val();
           
           var pattern = new RegExp(/^[0-9a-z/i]([\-.\w]*[0-9a-z/i\-_+])*@([0-9a-zA-Z][\-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9}$/g); 
           // 이메일을 검사하는 정규표현식 
           
           var bool = pattern.test(guest_email);
           
           if(!bool) {
            // $(this).parent().find('.error').show();   
              $(this).next().show();
              $(":input").attr('disabled', true).addClass('bgcol'); 
              $(this).attr('disabled', false).removeClass('bgcol');
              
              $("#btnJoin").attr('disabled', true);
              
              $(this).val("");
              $(this).focus();
           }
           else {
           //   $(this).parent().find('.error').hide();   
               $(this).next().hide();
               $(":input").attr('disabled', false).removeClass('bgcol');
              
              $("#btnJoin").attr('disabled', false);
           }
           
        });// end of $("#email").blur()-----------------
        
        
        
      $("#join_pwd").blur(function(){
          
          var pwd = $(this).val(); 
          
          var pattern = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
          // 숫자/문자/특수문자/ 포함 형태의 8~15자리 이내의 암호 정규식 
          
          var bool = pattern.test(pwd);
          
          if(!bool) {
           // $(this).parent().find('.error').show();
             $(this).next().show();
             $(":input").attr('disabled', true).addClass('bgcol'); 
             $(this).attr('disabled', false).removeClass('bgcol');
             
             $("#btnJoin").attr('disabled', true);
             
             $(this).val("");
             $(this).focus();
          }
          else if(bool) {
             // $(this).parent().find('.error').hide();
             $(this).next().hide();
             $(":input").attr('disabled', false).removeClass('bgcol'); 
             
             $("#btnJoin").attr('disabled', false);
          }
       });   
       // end of $("#passwd").blur();
        
        
        $("#btnLOGIN").click(function(event){
           
           
           var email = $("#email").val(); 
           var pwd = $("#pwd").val(); 
          
           if(email.trim()=="") {
               alert("이메일을 입력하세요!!");
              $("#email").val(""); 
              $("#email").focus();
              event.preventDefault();
              return;
           }
          
           if(pwd.trim()=="") {
              alert("비밀번호를 입력하세요!!");
              $("#pwd").val(""); 
              $("#pwd").focus();
              event.preventDefault();
              return;
           }

           document.loginFrm.action = "/hajota/loginEnd.go";
           document.loginFrm.method = "post";
           document.loginFrm.submit();
       }); // end of $("#btnLOGIN").click();-----------------------
       
       
       $("#btnJOIN").click(function(event){
           

          var email = $("#join_email").val(); 
          var pwd = $("#join_pwd").val(); 
          var last_name = $("#join_last_name").val(); 
          var first_name = $("#join_first_name").val(); 
          var birthday = $("#join_birthday").val(); 
          var tel = $("#join_tel").val(); 
          
           if(email.trim()=="") {
               alert("이메일을 입력하세요!!");
              $("#join_email").val(""); 
              $("#join_email").focus();
              event.preventDefault();
              return;
           }
          
           if(pwd.trim()=="") {
              alert("비밀번호를 입력하세요!!");
              $("#join_pwd").val(""); 
              $("#join_pwd").focus();
              event.preventDefault();
              return;
           }
           
          if(first_name.trim()=="") {
             alert("이름을 입력하세요!!");
             $("#join_first_name").val(""); 
             $("#join_first_name").focus();
             event.preventDefault();
             return;
          }
          
          if(last_name.trim()=="") {
             alert("성을 입력하세요!!");
             $("#join_last_name").val(""); 
             $("#join_last_name").focus();
             event.preventDefault();
             return;
          }
          
          if(birthday.trim()=="") {
             alert("생일를 입력하세요!!");
             $("#join_birthday").val(""); 
             $("#join_birthday").focus();
             event.preventDefault();
             return;
          }
          if(birthday.trim()=="") {
             alert("연락처를 입력하세요!!");
             $("#join_tel").val(""); 
             $("#join_tel").focus();
             event.preventDefault();
             return;
          }

           document.joinFrm.action = "/hajota/joinEnd.go";
           document.joinFrm.method = "get";
           document.joinFrm.submit();
       }); // end of $("#btnJOIN").click(function(event){-----------------------
       
       
       $("#pwd").keydown(function(event){
          
          if(event.keyCode == 13) { // 엔터를 했을 경우
          
         if(${sessionScope.loginuser != null}) {
              alert("이미 로그인을 하신 상태 입니다 !!");
              $("#email").val(""); 
              $("#pwd").val("");
              $("#email").focus();
              event.preventDefault();
              return; 
           }   
             
          var email = $("#email").val(); 
          var pwd = $("#pwd").val(); 
          
          if(email.trim()=="") {
             alert("이메일을 입력하세요!!");
             $("#email").val(""); 
             $("#email").focus();
             event.preventDefault();
             return;
          }
          
          if(pwd.trim()=="") {
             alert("비밀번호를 입력하세요!!");
             $("#pwd").val(""); 
             $("#pwd").focus();
             event.preventDefault();
             return;
          }
            document.loginFrm.action = "/hajota/loginEnd.go";
          document.loginFrm.method = "post";
          document.loginFrm.submit();
          
          }
       }); // end of $("#pwd").keydown();-----------------------
       
       
       $("#emailcheck").click(function(){
           
          // 팝업창 띄우기
          var url = "idDuplicateCheck.go";
          
          window.open(url,"emailcheck",
            "left=500px, top=100px, width=300px, height=200px, menubar=no, status=no, scrollbars=yes ");
          
          // 기본적으로 아무런 조건없이 
          // 그냥 어떤 창을 띄우면 method 가 
          // GET 방식으로 움직인다. 
       });
       
       
    });   
    
   
     
</script>

   <!-- Navigation Bar -->
    <div class="w3-top w3-bar w3-white w3-border-bottom w3-xlarge">
      <a href="<%=request.getContextPath()%>/index.go">
      <img src="<%=request.getContextPath()%>/resources/images/oneofall/logo.png"
         style="width: 200px; height: 60px; margin-left: 30px;" /> 
      </a>
      
       <a href="<%=request.getContextPath()%>/index.go"> 
       <img src="<%=request.getContextPath()%>/resources/images/oneofall/South Korea.png"
         style="margin-left: 2%;" />
      </a>
       
       <a href="<%=request.getContextPath()%>/indexChinese.go"> 
       <img src="<%=request.getContextPath()%>/resources/images/oneofall/China.png"
         style="margin-left: 10px;" />
       </a> 
      
      <a href="<%=request.getContextPath()%>/indexJapanese.go">
      <img src="<%=request.getContextPath()%>/resources/images/oneofall/Japan.png"
         style="margin-left: 10px;" /> 
      </a>
      
      <a href="<%=request.getContextPath()%>/indexEnglish.go">   
      <img src="<%=request.getContextPath()%>/resources/images/oneofall/USA.png"
         style="margin-left: 10px;" />
     </a>
      
       <a href="<%=request.getContextPath()%>/callview.go" class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large"
         title="Q&A"><i class="fa fa-question-circle"></i></a>

      <c:if test="${sessionScope.loginuser == null}">        
         <a data-toggle="modal" data-target="#loginModal"
            class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large"
            title="Login"><i class="fa fa-user"></i></a>
      </c:if>
      

       <c:if test="${sessionScope.loginuser != null}">
       
          <!-- 게스트로 로그인했을때 -->
              <c:if test="${sessionScope.loginuser.GRADE == '9'}">
            <a style="color: red; font-weight: bold; font-size: 15px; margin-left: 47%;">
               환영합니다♥ </a>
            <a style="color: navy; font-weight: bold; font-size: 15px;">
               ${sessionScope.loginuser.LAST_NAME}${sessionScope.loginuser.FIRST_NAME} 게스트님
            </a>
          
              <a href="<%=request.getContextPath()%>/coupon.go"
               class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large"
               title="EVENT"><i class="fa fa-heart"></i></a>   
          
            <a href="<%=request.getContextPath()%>/logout.go"
               class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large"
               title="LOGOUT"><i class="fa fa-sign-out"></i></a>
         
            <a href="<%=request.getContextPath()%>/editUser.go"
               class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large" title="MYPAGE"> 
               <img src="<%=request.getContextPath()%>/resources/images/ISJW/user.png" width="35px;" height="35px;" />
            </a>
            </c:if>  
         
         <!-- 호스트로 로그인했을때 -->
            <c:if test="${sessionScope.loginuser.GRADE == '8'}">
            <a style="color: red; font-weight: bold; font-size: 15px; margin-left: 47%;">
               환영합니다♥ </a>
            <a style="color: navy; font-weight: bold; font-size: 15px;">
               ${sessionScope.loginuser.LAST_NAME}${sessionScope.loginuser.FIRST_NAME} 호스트님
            </a>
          
            <a href="<%=request.getContextPath()%>/logout.go"
               class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large"
               title="LOGOUT"><i class="fa fa-sign-out"></i></a>
         
             <a href="<%=request.getContextPath()%>/rooms/insert.go" class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large" title="HOSTING">
            <i class="fa fa-globe"></i></a>
         
            <a href="<%=request.getContextPath()%>/editUser.go"
               class="w3-bar-item w3-button  w3-right w3-hide-small w3-padding-large" title="MYPAGE"> 
               <img src="<%=request.getContextPath()%>/resources/images/ISJW/user.png" width="35px;" height="35px;" />
            </a>
            
            
            
            </c:if>
        
        <!-- 관리자로 로그인했을때 --> 
          <c:if test="${sessionScope.loginuser.GRADE == '1'}">
                           
            </c:if>    
            
         
      </c:if> 

      
   </div>
   
   
<!-- 로그인&회원가입 Modal -->
<div class="body modal fade" id="loginModal" role="dialog"
   style="width: 40%; margin-left: 27%; margin-top: 7%; background-color: none;">
   <div class="modal-dialog">
      <section class="container">
         <article class="half">
         <div align="center">
            
            </div>
            <div class="tabs">
               <span class="tab signin active"><a href="#signin">Sign in</a></span> 
               <span class="tab signup"><a href="#signup">Sign up</a></span>
            </div>
            <div class="content">
               <div class="signin-cont cont">
                  <button class="button button2" style="width: 100%"><img align="left" src="<%= request.getContextPath() %>/resources/images/ISJW/페이스북.png" style="width:7%; height: 7%; margin-top: 5px;">&nbsp;facebook으로 로그인</button><br>
            <button class="button button4" style="width: 100%"><img align="left" src="<%= request.getContextPath() %>/resources/images/ISJW/구글.jpg" style="width:7%; height: 7%; margin-top: 5px;">&nbsp;google으로 로그인</button><br><br>
                  <form action="#" method="post" enctype="multipart/form-data" name="loginFrm">
                     <input type="email" name="email" id="email" class="inpt" required="required" placeholder="이메일 주소"> 
                     <label for="email">이메일 주소</label> 
                        <input type="password" name="pwd" id="pwd" class="inpt" required="required" placeholder="비밀번호"> 
                        <label for="password">비밀번호</label> 
                        
                     <div class="submit-wrap" style="margin-top: 40px; position: relative;">
                        <input type="submit" value="Sign in" class="submit" id="btnLOGIN"> 
                        <a href="#" class="more" data-toggle="modal" data-target="#pwdfindModal" data-dismiss="modal">비밀번호가 생각나지 않으세요?</a>
                        
                         <input type="submit" value="Close" class="submit" data-dismiss="modal" class="btn btn-default myclose" style="width: 30%; margin-left: 70%; margin-top: 30px;" > 
                         
                         <!-- <button type="button"  >Close</button> -->
                     </div>
                  </form>
                  
               </div>
               
               <div class="signup-cont cont">
                  <form action="#" method="post" enctype="multipart/form-data" name="joinFrm">
                      
                     <input type="email" name="join_email" id="join_email" class="inpt" required="required" placeholder="이메일 주소">
                     <img id="emailcheck" src="<%= request.getContextPath() %>/resources/images/ISJW/b_id_check.gif" style="vertical-align: middle;" /> 
                     <label for="email">이메일 형식이 아닙니다</label> 
                     <input type="password" name="join_pwd" id="join_pwd" class="inpt" required="required" placeholder="비밀번호">
                     <label for="pwd">비밀번호 형식이 아닙니다</label>
                     <input type="text" name="join_last_name" id="join_last_name" class="inpt2" style="margin-left: 15px;" required="required" placeholder="성">
                     <input type="text" name="join_first_name" id="join_first_name" class="inpt2" style="margin-left: 5px;" required="required" placeholder="이름">     
                     <input type="text" name="join_birthday" id="join_birthday" class="inpt" required="required" placeholder="생일">
                     <input type="text" name="join_tel" id="join_tel" class="inpt" required="required" placeholder="연락처">
                     <div class="inpt">
                        <input type="submit" value="Sign up" class="submit" id="btnJOIN"> <!-- <a href="#" class="more">Terms and conditions</a> -->
                     </div>
                  </form>
               </div>
               
            </div>
         </article>
         <div class="half bg"></div>
      </section>
   </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
$('.tabs .tab').click(function(){
    if ($(this).hasClass('signin')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signin-cont').show();
    } 
    if ($(this).hasClass('signup')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont').show();
    }
});
$('.container .bg').mousemove(function(e){
    var amountMovedX = (e.pageX * -1 / 40);
    var amountMovedY = (e.pageY * -1 / 40);
    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
});
</script>


<%-- 비밀번호 찾기 Modal --%>
  <div class="body modal" id="pwdfindModal" role="dialog" style="width: 40%; margin-left: 27%; margin-top: 7%; background-color: none;">
    <div class="modal-dialog">
      <div class="modal-content" align="center">
        <div class="modal-header">
        
          <h4 style="font-weight: bold; class="modal-title">비밀번호 재설정하기</h4>
        </div>
        <div class="modal-body" style="height: 400px; width: 100%;">
          <div id="pwFind">
             <iframe style="border: none; width: 100%; height: 350px;" src="<%= request.getContextPath() %>/pwdFind.go"></iframe>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default myclose" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#userIdfind" data-dismiss="modal">아이디찾기</button>
        </div>
      </div>
    </div>
  </div>