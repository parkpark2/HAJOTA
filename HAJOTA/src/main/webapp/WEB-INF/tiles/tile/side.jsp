<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<meta charset="UTF-8">

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://select2.github.io/dist/css/select2.min.css" rel="stylesheet">
<script src="https://select2.github.io/dist/js/select2.full.js"></script>


 <style>
.btn-success2{
    color: #fff;
    background-color: #2980b9;
    border-color: #4cae4c;
 }
    
li{
	margin-bottom: 5%;
}

.inbox .inbox-menu ul {
    margin-top: 30px;
    padding: 0;
    list-style: none
}

.inbox .inbox-menu ul li {
    height: 30px;
    padding: 5px 15px;
    position: relative
}

.inbox .inbox-menu ul li:hover,
.inbox .inbox-menu ul li.active {
    background: #e4e5e6
}

.inbox .inbox-menu ul li.title {
    margin: 20px 0 -5px 0;
    text-transform: uppercase;
    font-size: 10px;
    color: #d1d4d7
}

.inbox .inbox-menu ul li.title:hover {
    background: 0 0
}

.inbox .inbox-menu ul li a {
    display: block;
    width: 100%;
    text-decoration: none;
    color: #3d3f42
}

.inbox .inbox-menu ul li a i {
    margin-right: 10px
}

.inbox .inbox-menu ul li a .label {
    position: absolute;
    top: 10px;
    right: 15px;
    display: block;
    min-width: 14px;
    height: 14px;
    padding: 2px
}

.inbox ul.messages-list {
    list-style: none;
    margin: 15px -15px 0 -15px;
    padding: 15px 15px 0 15px;
    border-top: 1px solid #d1d4d7
}

.inbox ul.messages-list li {
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    cursor: pointer;
    margin-bottom: 10px;
    padding: 10px
}

.inbox ul.messages-list li a {
    color: #3d3f42
}

.inbox ul.messages-list li a:hover {
    text-decoration: none
}

.inbox ul.messages-list li.unread .header,
.inbox ul.messages-list li.unread .title {
    font-weight: 700
}

.inbox ul.messages-list li:hover {
    background: #e4e5e6;
    border: 1px solid #d1d4d7;
    padding: 9px
}

.inbox ul.messages-list li:hover .action {
    color: #d1d4d7
}

.inbox ul.messages-list li .header {
    margin: 0 0 5px 0
}

.inbox ul.messages-list li .header .from {
    width: 49.9%;
    white-space: nowrap;
    overflow: hidden!important;
    text-overflow: ellipsis
}

.inbox ul.messages-list li .header .date {
    width: 50%;
    text-align: right;
    float: right
}

.inbox ul.messages-list li .title {
    margin: 0 0 5px 0;
    white-space: nowrap;
    overflow: hidden!important;
    text-overflow: ellipsis
}

.inbox ul.messages-list li .description {
    font-size: 12px;
    padding-left: 29px
}

.inbox ul.messages-list li .action {
    display: inline-block;
    width: 16px;
    text-align: center;
    margin-right: 10px;
    color: #d1d4d7
}

.inbox ul.messages-list li .action .fa-check-square-o {
    margin: 0 -1px 0 1px
}

.inbox ul.messages-list li .action .fa-square {
    float: left;
    margin-top: -16px;
    margin-left: 4px;
    font-size: 11px;
    color: #fff
}

.inbox ul.messages-list li .action .fa-star.bg {
    float: left;
    margin-top: -16px;
    margin-left: 3px;
    font-size: 12px;
    color: #fff
}

.inbox .message .message-title {
    margin-top: 30px;
    padding-top: 10px;
    font-weight: 700;
    font-size: 14px
}

.inbox .message .header {
    margin: 20px 0 30px 0;
    padding: 10px 0 10px 0;
    border-top: 1px solid #d1d4d7;
    border-bottom: 1px solid #d1d4d7
}

.inbox .message .header .avatar {
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    height: 34px;
    width: 34px;
    float: left;
    margin-right: 10px
}

.inbox .message .header i {
    margin-top: 1px
}

.inbox .message .header .from {
    display: inline-block;
    width: 50%;
    font-size: 12px;
    margin-top: -2px;
    color: #d1d4d7
}

.inbox .message .header .from span {
    display: block;
    font-size: 14px;
    font-weight: 700;
    color: #3d3f42
}

.inbox .message .header .date {
    display: inline-block;
    width: 29%;
    text-align: right;
    float: right;
    font-size: 12px;
    margin-top: 18px
}

.inbox .message .attachments {
    border-top: 3px solid #e4e5e6;
    border-bottom: 3px solid #e4e5e6;
    padding: 10px 0;
    margin-bottom: 20px;
    font-size: 12px
}

.inbox .message .attachments ul {
    list-style: none;
    margin: 0 0 0 -40px
}

.inbox .message .attachments ul li {
    margin: 10px 0
}

.inbox .message .attachments ul li .label {
    padding: 2px 4px
}

.inbox .message .attachments ul li span.quickMenu {
    float: right;
    text-align: right
}

.inbox .message .attachments ul li span.quickMenu .fa {
    padding: 5px 0 5px 25px;
    font-size: 14px;
    margin: -2px 0 0 5px;
    color: #d1d4d7
}

.inbox .contacts ul {
    margin-top: 30px;
    padding: 0;
    list-style: none
}

.inbox .contacts ul li {
    height: 30px;
    padding: 5px 15px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis!important;
    position: relative;
    cursor: pointer
}

.inbox .contacts ul li .label {
    display: inline-block;
    width: 6px;
    height: 6px;
    padding: 0;
    margin: 0 5px 2px 0
}

.inbox .contacts ul li:hover {
    background: #e4e5e6
}
</style>
    

<script type="text/javascript">


</script>
   <div class="container">
<div class="row inbox">
	<div class="col-md-3">
		<div class="panel panel-default" style="margin-left: -250px; width: 99%; height:100%;">
			<div class="panel-body inbox-menu" style="width: 90%; height: 320px;">						
				<a href="" class="btn btn-success2 btn-block" style="width: 112%;">마이 페이지</a>
				<ul>
					<li>
						<a href="<%=request.getContextPath()%>/editUser.go"><i class="fa fa-inbox"></i> 회원정보 수정</a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/wishList.go"><i class="fa fa-star"></i> wish-list</a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/paymentList.go"><i class="fa fa-rocket"></i> 결제 목록<span class="label label-danger">4</span></a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/reviewList.go"><i class="fa fa-star"></i> 나의 이용후기</a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/couponList.go"><i class="fa fa-bookmark"></i> 쿠폰 목록<span class="label label-info">5</span></a>
					</li>
					<li>
						<a href="<%=request.getContextPath()%>/signOut.go"><i class="fa fa-trash-o"></i> 회원탈퇴</a>
					</li>
					
					
						
				</ul>
			</div>	
		</div>					
	</div>
	</div>

	
	