<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">

<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/JH/JH_numOfPeople_count.js"></script>
<style>
	div#JH_roomsList_header {
		width: 100%;
		height: 100%;
	}

	img#JH_header_logo {
		width: 10%;
		height: 80%;
		float: left;
		padding: 0.5%;
		margin-left: 1%;
	}
	
	div#JH_roomsList_header_search {
		width: 100%;
	    height: 10%;
    	margin-left: 20%;
    	position: relative;
    }
    
    div#JH_roomsList_header_search_Halign {
    }
    
    div#JH_roomsList_header_center {
	}
	
	div.JH_search_dropdown_input {
		margin-top: 0px;
		float: left;
		display: inline-block;
		margin-top: 1.3%;
		margin-right: 1.6%;
	}
	
	div.JH_search_dropdown_button {
		margin-top: 0px;
		float: left;
		display: inline-block;
		margin-top: 1.4%;
		margin-right: 1.6%;
	}
	
	.JH_search_dropdown_div {
		height: 0px;
		margin-top: 1%;
		display: inline-block;
		float: left;
	}
	
	
	.JH_search_dropdown_float-right {
	float: right;
}

.JH_search_dropdown_fa {
	font-size: .8em;
	line-height: 22px !important;
}

.JH_search_dropdown {
	display: inline-block;
	margin-top: 5%;
}

.JH_search_dropdown label, .JH_search_dropdown ul li {
	display: block;
	width: 120px;
	background: #ECF0F1;
	padding: 15px 20px;
}

.JH_search_dropdown label:hover/* , .JH_search_dropdown ul li:hover */ {
	background: #1ABC9C;
	color: white;
	cursor: pointer;
}

.JH_search_dropdown label {
	color: #1ABC9C;
	border-left: 4px solid #1ABC9C;
	/* border-radius: 0 5px 0 0; */
	position: relative;
	z-index: 2;
}

.JH_search_dropdown input {
	display: none;
}

.JH_search_dropdown input ~ ul {
	position: relative;
	visibility: hidden;
	opacity: 0;
	top: -20px;
	z-index: 1;
}

.JH_search_dropdown input:checked+label {
	background: #1ABC9C;
	color: white;
}

.JH_search_dropdown input:checked ~ ul {
	visibility: visible;
	opacity: 1;
	top: 0;
}

.JH_search_dropdown_animate {
	-webkit-transition: all .3s;
	-moz-transition: all .3s;
	-ms-transition: all .3s;
	-ms-transition: all .3s;
	transition: all .3s;
	backface-visibility: hidden;
	-webkit-backface-visibility: hidden; /* Chrome and Safari */
	-moz-backface-visibility: hidden; /* Firefox */
	-ms-backface-visibility: hidden; /* Internet Explorer */
}
	
div.JH_search_input_div {
	display: inline-block;
	margin-top: -3%;
}
	
	
/* ----------------------------------------------------------------------------------------- */

div.JH_numOfPeople_count_window {
    min-width: 320px;
    font-family: 'Open Sans', sans-serif;
    background-color: #00c3cb;
    color: white;

    display: inline-block;
    transition: background-color .5s;
}
/* 
a {
    color: white;
    text-decoration: none;
}

.body-session {
    background-color: #7D1717;
}

.body-break {
    background-color: #0E5A15;
}

.body-pause {
    background-color: #969000;
}

.header {
    margin: 10px 0 5px;
    font-family: 'Chewy', cursive;
    text-align: center;
    font-size: 3em;
}

.length-control {
    max-width: 600px;
    margin: 0 auto;
}

.length-control__wrap {
    display: inline-block;
    width: 295px;
    text-align: center;
}

.length-control__wrap.disabled > *,
.length-control__wrap.disabled a:hover {
    opacity: .3;
}

.length-control__header {
    font-size: 1.3em;
}

.length-control__button {
    display: inline-block;
    padding: 0 10px;
    font-size: 2.5em;
    opacity: .7;
    transition: opacity .5s;
}

.length-control__button:hover {
    opacity: .9;
}

.length-control__button.disabled {
    opacity: .2;
}

.length-control__number {
    width: 90px;
    display: inline-block;
    font-size: 3em;

}

.timer {
    display: block;
    position: relative;
    max-width: 600px;
    margin: 30px auto 0;
    padding: 20px 0;
    border: solid 1px rgba(255, 255, 255, .1);
}

.timer:hover {
    border-color: rgba(255, 255, 255, .3);
}

.timer:hover .timer-header__action {
    opacity: .7;
}

.timer-header__action {
    position: absolute;
    top: 10px;
    left: 15px;
    font-size: 1.5em;
    opacity: .5;
    transition: opacity .5s;
}

.timer-header__general {
    margin: 10px 0 30px;
    text-align: center;
    font-size: 2em;
}

.timer-header__pause {
    position: absolute;
    top: 10px;
    right: 15px;
    font-size: 1.5em;
    opacity: .5;
}

.timer-count {
    padding-left: 3px;
}

.timer-count__wrap {
    display: inline-block;
    position: relative;
    width: 195px;
    height: 195px;
}

.timer-count__chart {
    position: absolute;
    top: 0;
    left: 7px;
}

.timer-count__text {
    display: block;
    padding-top: 45px;
    font-size: 3em;
    text-align: center;
}

.timer-count__label {
    display: block;
    text-align: center;
    opacity: .8;
}

@media all and (max-width: 620px) {
    .length-control__wrap {
        display: block;
        width: auto;
    }
    .timer-count__wrap {
        display: block;
        margin: 0 auto;
    }
}
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
.JH_search_button_animate
{
	transition: all 0.1s;
	-webkit-transition: all 0.1s;
}

.JH_search_action-button
{
	position: relative;
	padding: 10px 40px;
 	margin: 0px 10px 10px 0px;
 	float: left;
	border-radius: 10px;
	font-family: 'Pacifico', cursive;
	font-size: 25px;
	color: #FFF;
	text-decoration: none;	
}

.JH_search_button_color
{
	background-color: #00c3cb;
	border-bottom: 5px solid #00bba9;
	text-shadow: 0px -2px #00bba9;
}

.JH_search_action-button:active
{
	transform: translate(0px,5px);
  -webkit-transform: translate(0px,5px);
	border-bottom: 1px solid;
}

a.JH_search_action-button:hover {
    color: #ffffff;
    text-decoration: none;
}













/* --------------------------------------------------------------------------------------------- */

$color1: #48A9A6;
$color2: rgba(255, 255, 255, 1);
$color3: rgba(230, 232, 230, 1);
$color4: rgba(206, 208, 206, 1);
$color5: #303633;
$color_success: #23C057;
$color_text: $color5;
$color_text_light: rgba(lighten($color5, 10%), .85);
$color_border: rgba(lighten($color1, 40%), .5);
$color_bg: #C8D9E7;

@import url('https://fonts.googleapis.com/css?family=Montserrat');

JH_search_calender, div_html {
  width: 100%;
  height: 100%;
  font-family: "Montserrat";
  color: $color_text;
  background-color: $color_bg;
  overflow: hidden;
  position: relative;
  outline: none;
  perspective: 1000px;
}

.content-wrapper {
  position: absolute;
  width: 365px;
  height: 420px;
  top: 50%;
  left: 50%;
  box-sizing: border-box;
  transform: translate(-50%, -50%);
  //box-shadow: 2px 2px 20px 0 rgba(black, .15);
  transition: all 0.195s ease;
  transform-style: preserve-3d;
  
  // 반응 메소드
  &.is-rotated-left {
    transform: translate(-50%, -50%) rotateY(-4deg);
  }
  &.is-rotated-right {
    transform: translate(-50%, -50%) rotateY(4deg);
  }
  .left-wrapper {
    background-color: white;
    width: 100%;
    float: left;
    height: 100%;
    box-sizing: border-box;
    padding: 25px;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: center;
  }
  .header {
    padding: 15px 0 20px;
    display: flex;
    justify-content: space-between;
    width: 100%;
    i {
      padding: 0 5px;
      cursor: pointer;
    }
    span {
      display: inline-block;
      margin: 0 3px;
      font-weight: 700;
    }
  }
  .left-wrapper {
    .showDate {
      color: white;
      text-align: right;
      width: 100%;
      i {
        cursor: pointer;
        background: $color1;
        border-radius: 4px;
        padding: 8px 12px;
        transform: scale(1);
        transition: all 0.3s;
        &.is-active {
          transform: scale(-1);
        }
      }
    }
    table {
      text-align: center;
      font-family: "Open Sans";
      width: 90%;
      margin: 30px auto 0;
      table-layout: fixed;
      border-collapse: collapse;
      tbody:before {
        content: "-";
        display: block;
        line-height: 0.75em;
        color: transparent;
      }
      th {
        color: $color1;
        font-size: 0.75em;
        text-transform: uppercase;
        margin-bottom: 10px;
      }
      td {
        padding: 11px 5px;
        color: $color4;
        font-size: 0.75em;
        transition: all 0.3s;
        position: relative;
        //border-radius: 100%;
        &::before {
          content: "";
          display: none;
          width: 50%;
          height: 2px;
          //border-radius: 100%;
          position: absolute;
          left: 50%;
          top: 100%;
          transform: translate(-50%, -8px);
          background-color: $color1;
        }
        &.currentDay {
          &::before {
            display: block;
          }
        }
        &.selectable {
          color: $color_text;
          cursor: pointer;
          &:hover {
            background: $color1;
            color: white;
          }
        }
        &.between {
          background: rgba($color1, .65);
          color: white;
        }
        &.active,
        &.hover {
          background: $color1;
          color: white;
        }
      }
    }
  }
}

</style>

<script>
	function goSearch() {
		var search_content = $("#search_content").val();
		var numOfPeople = $("#numOfPeople").val();
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		
		if(search_content.trim() == "" || numOfPeople.trim() == "" || startDate.trim() == "" || endDate.trim() == "") {
			// TODO : 수정하자
			alert("모든 항목을 입력하셔야 합니다.");
			return;
		}

		var searchFrm = document.searchFrm;
		
		searchFrm.action = "/hajota/rooms/list.go";
		searchFrm.method = "POST";
		searchFrm.submit();
	}
	
	$(document).ready(function() {
		$("#search_content").val("${search_content}");
		$("#numOfPeople").val("${numOfPeople}");
		$("#startDate").val("${startDate}");
		$("#endDate").val("${endDate}");
	});
</script>

</head>
<body>
	<div id="JH_roomsList_header" style="display: inline;">
		<img src="<%=request.getContextPath() %>/resources/images/oneofall/logo.png" id="JH_header_logo" name="JH_header_logo">
		
		<form name="searchFrm">
			<div id="JH_roomsList_header_search">
				<!-- <div id="JH_roomsList_header_search_Halign"> -->
					<div id ="JH_roomsList_header_center">
					
					<div class="JH_search_dropdown_input">
						<input type="text" id="search_content" name="search_content" placeholder="장소, 지역" style="width: 140px; height: 50px;"/>
					</div>
					 					 
					 <div style="margin-top: 100px;">
						 <input type="text" class="JH_inputSearch" id="numOfPeople" name="numOfPeople"/>
						 <input type="date" class="JH_inputSearch" id="startDate" name="startDate"/>
						 <input type="date" class="JH_inputSearch" id="endDate" name="endDate"/>
					 </div>
					 
					<div class="JH_search_dropdown_button">
						<a href="#" onclick="goSearch();" class="JH_search_action-button JH_search_button_animate JH_search_button_color">검색</a>
					</div>
				</div>
				</div>
			<!-- </div> -->
		</form>
	</div>
</body>
</html>