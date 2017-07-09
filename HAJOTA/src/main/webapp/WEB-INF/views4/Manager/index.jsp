<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style type="text/css">
.table {
	margin: 0 0 40px 0;
	width: 50%;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
	display: table;
}

@media screen and (max-width: 580px) {
	.table {
		display: block;
	}
}

.row {
	display: table-row;
	background: #f6f6f6;
}

.row:nth-of-type(odd) {
	background: #e9e9e9;
}

.row.header {
	font-weight: 900;
	color: #ffffff;
	background: #ea6153;
}

.row.green {
	background: #27ae60;
}

.row.blue {
	background: #2980b9;
}

@media screen and (max-width: 580px) {
	.row {
		padding: 8px 0;
		display: block;
	}
}

.cell {
	padding: 6px 12px;
	display: table-cell;
}

@media screen and (max-width: 580px) {
	.cell {
		padding: 2px 12px;
		display: block;
	}
}
</style>

<!-- !PAGE CONTENT! -->
<div class="w3-main">

	<!-- Header -->
	<header class="w3-container">
		<!-- <h5><b><i class="fa fa-dashboard"></i> My Dashboard</b></h5> -->
	</header>

	<div class="w3-row-padding w3-margin-bottom">
		<div class="w3-quarter">
			<div class="w3-container w3-red w3-padding-16">
				<div class="w3-left">
					<i class="fa fa-users w3-xxxlarge"></i>
					<!-- <i class="fa fa-comment w3-xxxlarge"></i> -->
				</div>
				<div class="w3-right">
					<h3>${n} 명</h3>
				</div>
				<div class="w3-clear"></div>
				<h4>총 게스트 수</h4>
			</div>
		</div>
		<div class="w3-quarter">
			<div class="w3-container w3-blue w3-padding-16">
				<div class="w3-left">
					<i class="fa fa-users w3-xxxlarge"></i>
					<!-- <i class="fa fa-eye w3-xxxlarge"></i> -->
				</div>
				<div class="w3-right">
					<h3>${t} 명</h3>
				</div>
				<div class="w3-clear"></div>
				<h4>총 호스트 수</h4>
			</div>
		</div>
		<div class="w3-quarter">
			<div class="w3-container w3-teal w3-padding-16">
				<div class="w3-left">
					<i class="fa fa-share-alt w3-xxxlarge"></i>
				</div>
				<div class="w3-right">
					<h3>값 넣어라</h3>
				</div>
				<div class="w3-clear"></div>
				<h4>네트워크</h4>
			</div>
		</div>
		<div class="w3-quarter">
			<div class="w3-container w3-orange w3-text-white w3-padding-16">
				<div class="w3-left">
					<i class="fa fa-users w3-xxxlarge"></i>
				</div>
				<div class="w3-right">
					<h3>값 넣어라</h3>
				</div>
				<div class="w3-clear"></div>
				<h4>통계</h4>
			</div>
		</div>
	</div>
</div>



<!-------------------------------------------  표 -------------------------------------- -->
<br/>
<div>
	<span style="font-weight: bold; font-size: 15pt;">Q & A 최근 게스트
		리스트&nbsp;&nbsp;</span>
	<div class="table" style="cursor: pointer"
		onClick="location.href='<%= request.getContextPath() %>/qnaguestManager.go'">
		<div class="row header red" id="menubar">
			<div class="cell">게스트 이메일</div>
			<div class="cell">
				<span style="margin-left: 28%;">제목</span>
			</div>
			<div class="cell">
				<span style="margin-left: 15%;">내용</span>
			</div>
		</div>

		<c:if
			test="${indexguestqnaList != null || not empty indexguestqnaList}">
			<c:forEach var="qna" items="${indexguestqnaList}">
				<div class="row">
					<div class="cell">
						<span>${qna.EMAIL}</span>
					</div>
					<div class="cell">
						<span style="margin-left: 0%">${qna.SUBJECT}</span>
					</div>
					<div class="cell">
						<span style="margin-left:-8%;">${qna.CONTENT}</span>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<br /> <span style="font-weight: bold; font-size: 15pt;">Q & A
		최근 호스트 리스트&nbsp;&nbsp;</span>
	<div class="table" style="cursor: pointer"
		onClick="location.href='<%= request.getContextPath() %>/qnahostManager.go'">
		<div class="row header green">
			<div class="cell">호스트 이메일</div>
			<div class="cell">
				<span style="margin-left: 15%;">제목</span>
			</div>
			<div class="cell">
				<span style="margin-left: 8%;">내용</span>
			</div>
		</div>

		<c:if test="${indexhostqnaList != null || not empty indexhostqnaList}">
			<c:forEach var="qna" items="${indexhostqnaList}">
				<div class="row">
					<div class="cell">${qna.EMAIL}</div>
					<div class="cell">
						<span style="margin-left: -15%;">${qna.SUBJECT}</span>
					</div>
					<div class="cell">
						<span style="margin-left: -16%;">${qna.CONTENT}</span>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<br /> <span style="font-weight: bold; font-size: 15pt;">최근 공지사항
		리스트&nbsp;&nbsp;</span>
	<div class="table" style="cursor: pointer"
		onClick="location.href='<%= request.getContextPath() %>/noticeManager.go'">
		<div class="row header blue">
			<div class="cell" style="width: 30%;">
				<span style="margin-left: 0%;">관리자 아이디</span>
			</div>
			<div class="cell">
				<span style="margin-left: 34%;">주제</span>
			</div>
			<div class="cell">
				<span style="margin-left: 27%;">내용</span>
			</div>
		</div>

		<c:if test="${indexnoticeList != null || not empty indexnoticeList}">
			<c:forEach var="notice" items="${indexnoticeList}">
				<div class="row">
					<div class="cell">
						<span style="margin-left: 10%;">${notice.EMAIL}</span>
					</div>
					<div class="cell">
						<span style="margin-left:6%;">${notice.SUBJECT}</span>
					</div>
					<div class="cell">
						<span style="margin-left: 5%;">${notice.CONTENT}</span>
					</div>
				</div>
			</c:forEach>
		</c:if>

	</div>
</div>



<!-- -------------------------------------------------header end------------------------------------------------------- -->

</div>
</div>
</div>
</div>
</div>
</div>
