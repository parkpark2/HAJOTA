<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- ===== KHS #1.  tiles 중 header 페이지 만들기  ===== --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                        <i class="pe-7s-graph"></i>
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
                        <p>이달의 이벤트</p>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/sumManager.go">
                        <i class="pe-7s-news-paper"></i>
                        <p>통계</p>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/qnaManager.go">
                        <i class="pe-7s-science"></i>
                        <p>Q&A</p>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/callManager.go">
                        <i class="pe-7s-map-marker"></i>
                        <p>콜센터</p>
                    </a>
                </li>
                <li>
                    <a href="<%= request.getContextPath() %>/noticeManager.go">
                        <i class="pe-7s-bell"></i>
                        <p>공지사항</p>
                    </a>
                </li>
				<li class="active-pro">
                    <a href="<%= request.getContextPath() %>/ThinkManager.go">
                        <i class="pe-7s-rocket"></i>
                        <p>생각해보세요 콘텐츠를</p>
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
                    <ul class="nav navbar-nav navbar-left">
                        <li>
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-dashboard"></i>
								<p class="hidden-lg hidden-md">Dashboard</p>
                            </a>
                        </li>
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-globe"></i>
                                    <b class="caret hidden-sm hidden-xs"></b>
                                    <span class="notification hidden-sm hidden-xs">5</span>
									<p class="hidden-lg hidden-md">
										5 Notifications
										<b class="caret"></b>
									</p>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#">Notification 1</a></li>
                                <li><a href="#">Notification 2</a></li>
                                <li><a href="#">Notification 3</a></li>
                                <li><a href="#">Notification 4</a></li>
                                <li><a href="#">Another notification</a></li>
                              </ul>
                        </li>
                        <li>
                           <a href="">
                                <i class="fa fa-search"></i>
								<p class="hidden-lg hidden-md">Search</p>
                            </a>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li>
                           <a href="">
                               <p>Account</p>
                            </a>
                        </li>
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <p>
										Dropdown
										<b class="caret"></b>
									</p>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                              </ul>
                        </li>
                        <li>
                            <a href="#">
                                <p>Log out</p>
                            </a>
                        </li>
						<li class="separator hidden-lg hidden-md"></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="content">
        <div class="container-fluid">
                <div class="row">
