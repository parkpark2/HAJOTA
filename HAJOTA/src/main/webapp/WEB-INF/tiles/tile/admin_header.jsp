<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- ===== KHS #1.  tiles 중 header 페이지 만들기  ===== --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<meta charset="utf-8" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="icon" type="image/png" href="<%=request.getContextPath() %>/resources/TypeofCss/HS/assets/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
   
	<title>관리자페이지</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="<%=request.getContextPath() %>/resources/TypeofCss/HS/assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="<%=request.getContextPath() %>/resources/TypeofCss/HS/assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="<%=request.getContextPath() %>/resources/TypeofCss/HS/assets/css/light-bootstrap-dashboard.css" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="<%=request.getContextPath() %>/resources/TypeofCss/HS/assets/css/demo.css" rel="stylesheet" />


    <!-- Fonts and icons -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="<%=request.getContextPath() %>/resources/TypeofCss/HS/assets/css/pe-icon-7-stroke.css" rel="stylesheet" />

</head>

 <!--   Core JS Files   -->
    <script src="<%=request.getContextPath() %>/resources/TypeofCss/HS/assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath() %>/resources/TypeofCss/HS/assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="<%=request.getContextPath() %>/resources/TypeofCss/HS/assets/js/bootstrap-checkbox-radio-switch.js"></script>

	<!--  Charts Plugin -->
	<script src="<%=request.getContextPath() %>/resources/TypeofCss/HS/assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="<%=request.getContextPath() %>/resources/TypeofCss/HS/assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="<%=request.getContextPath() %>/resources/TypeofCss/HS/assets/js/light-bootstrap-dashboard.js"></script>

	<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
	<script src="<%=request.getContextPath() %>/resources/TypeofCss/HS/assets/js/demo.js"></script>

<script type="text/javascript">
	
	
</script>

<div class="wrapper">
<div class="sidebar" data-color="black" data-image="<%=request.getContextPath() %>/resources/TypeofCss/HS/assets/img/sidebar-2.jpg">

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="<%= request.getContextPath() %>/indexManager.go" class="simple-text">
                    Manager Page
                </a>
            </div>

            <ul class="nav">
                <li>
                    <a href="<%= request.getContextPath() %>/guestManager.go">
                        <i class="pe-7s-news-paper"></i>
                        <p>게스트 관리</p> 
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/hostManager.go">
                        <i class="pe-7s-user"></i>
                        <p>호스트 관리</p>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/eventManager.go">
                        <i class="pe-7s-note2"></i>
                        <p>이벤트 관리</p>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/chart.go">
                        <i class="pe-7s-graph"></i>
                        <p>통계</p>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/qnaManager.go">
                        <i class="pe-7s-note"></i>
                        <p>Q&A</p>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/callManager.go">
                        <i class="pe-7s-headphones"></i>
                        <p>콜센터</p>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/noticeManager.go">
                        <i class="pe-7s-bell"></i>
                        <p>공지사항</p>
                    </a>
                </li>
                 <li>
                    <a href="<%= request.getContextPath() %>/reportManager.go">
                        <i class="pe-7s-shield"></i>
                        <p>신고목록</p>
                    </a>
                </li>
				<li class="active-pro">
                    <a onclick="document.getElementById('id01').style.display='block'">
                        <i class="pe-7s-rocket"></i>
                        <p>PARTNERS OF TYPEOF</p>
                    </a>
                </li>
            </ul>
    	</div>
    </div>


    <div class="main-panel">
        <nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">HAJOTA</a>
                </div>
                <div class="collapse navbar-collapse">
	                <ul class="nav navbar-nav navbar-right">
	                        
	                        <li class="dropdown">
	                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	                                    <p>
											Small Menu
											<b class="caret"></b>
										</p>
	                              </a>
	                              <ul class="dropdown-menu">
	                                <li><a href="<%= request.getContextPath() %>/guestManager.go">게스트관리</a></li>
	                                <li><a href="<%= request.getContextPath() %>/eventManager.go">호스트관리</a></li>
	                                <li><a href="<%= request.getContextPath() %>/eventManager.go">이벤트관리</a></li>
	                                <li><a href="<%= request.getContextPath() %>/sumManager.go">통계 관리</a></li>
	                                <li><a href="<%= request.getContextPath() %>/qnaManager.go">Q&A 관리</a></li>
	                                <li><a href="<%= request.getContextPath() %>/callManager.go">콜센터 관리</a></li>
	                                <li><a href="<%= request.getContextPath() %>/noticeManager.go">공지사항</a></li>
	                                
	                              </ul>
	                        </li>
	                        <li>
	                            <a href="<%=request.getContextPath()%>/logout.go" title="LOGOUT">
	                                <p>Logout</p>
	                            </a>
	                        </li>
							<li class="separator hidden-lg hidden-md"></li>
	                    </ul>
                
                    <ul class="nav navbar-nav navbar-right">
                        
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-globe"></i>
                                    <b class="caret hidden-sm hidden-xs"></b>
                                    <span class="notification hidden-sm hidden-xs">${LingCount}</span>
									<p class="hidden-lg hidden-md">
										5 개
										<b class="caret"></b>
									</p>
                              </a>
                              <ul class="dropdown-menu">
                            <c:if test="${LingqnaList != null || not empty LingqnaList}"> 
                              <c:forEach var="list" items="${LingqnaList}">
                              	<c:if test="${list.ALERTSTATUS == 1}"> 
	                                <li style="background-color: #ea6153;">
	                                <a href="<%= request.getContextPath() %>/qnadetail.go?seq=${list.SEQ_QUESTION}">	                               
	                                <span style="font-weight: bold;">
	                                ${list.EMAIL}님의 질문등록!
	                                </span>
	                                </a></li>
                                </c:if>
                                
                                <c:if test="${list.ALERTSTATUS == 0}"> 
	                                <li><a href="<%= request.getContextPath() %>/qnadetail.go?seq=${list.SEQ_QUESTION}">
	                                <span style="font-weight: bold;">
	                                ${list.EMAIL}님의 질문등록!
	                                </span>
	                                </a></li>
                                </c:if>
                                
                               </c:forEach>
                            </c:if>
                            
                            <c:if test="${LingqnaList == null || empty LingqnaList}">
                            	<li>등록된 Q&A가 없습니다.</li>
                            </c:if>   
                             </ul>
                              
                        </li>
                       
                    </ul>

                    
                </div>
            </div>
        </nav>
        <div class="content">
        <div class="container-fluid">
                <div class="row">

       
       
    <form name="statusFrm">
    <input type="hidden" name="seq_question" />
    </form>             
                
                
            
 <!-- 협력업체 Modal -->
 <div id="id01" class="w3-modal">
    <div class="w3-modal-content">
      <div class="w3-container">
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-display-topright">&times;</span>

         <h2 style="font-weight: bold; margin-left: 33%;">PARTNERS OF TypeOf</h2>
         <div id="line" style="position:relative; top:10px; background-color:navy; height: 3px; "></div>
         
        <img src="<%=request.getContextPath()%>/resources/images/HSSH/partner.jpg" style="padding-bottom: 70px; margin-left: 5%;"/> 
         
      </div>
    </div>
  </div>             