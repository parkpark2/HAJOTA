<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$(".datepicker").datepicker({

		});
	});

	
</script>


</head>
<body>
	<div class="container">

		<div class="jumbotron text-center"
        style="margin-top: 110px; margin-bottom: 110px; padding: 40px; background: rgba(1, 1, 1, 0.3)">
        <h1 style="color: #eee; font-weight: 600">
                こんにちは <span style="color: rgba(41, 216, 70, 0.8)">HAJOTA</span>
        </h1>

			<p style="color: #eee">
			ようこそ、お越しくださいました <br/>
           	1,425,000軒以上ある世界中の宿泊施設を大幅割引で提供
          <br/><br/>
        </p>

			<form name="searchFrm">
	
        <p>
           <!-- 달력 띄우자 -->
           <span style="color: white;">
           <label><i class="fa fa-search"></i>検索</label>&nbsp;
           </span>
           <input type="text" id="search_content" name="search_content" placeholder="検索" size="10" style="height: 35px;" />&nbsp; 
           <span style="color: white;  margin-left: 2%;">
           <label><i class="fa fa-male"></i>人員</label>
           </span>
           <input type="text" id="numOfPeople" name="numOfPeople" placeholder="1" size="3" style="height: 35px; width: 35px;"/>&nbsp; 
           <span style="color: white;  margin-left: 2%;">           
           <label><i class="fa fa-calendar-o"></i> チェックイン</label>
           </span>
           <input type="text" class="datepicker" id="startDate"	name="startDate" placeholder="せんたく" size="10" style="height: 35px; width: 130px;" />&nbsp; 
           <span style="color: white; margin-left: 2%;">
           <label><i class="fa fa-calendar-o"></i> チェックアウト</label>&nbsp;
           </span>
           <input type="text" class="datepicker" id="endDate" name="endDate"  placeholder="せんたく" size="10" style="height: 35px; width: 130px;" />&nbsp; 
           <br/><br/>
    
           <button type="button" class="w3-button w3-margin-top" style="width: 200px; border-radius: 12px; background-color: #ea6153; color: white;" onclick="goSearch();">最安値を検索</button>
        	<input type="hidden" id="pageNo" name="pageNo"/>
        </p>
        </form>
        
       </div>
 
      </div>      
      
</body>
</html>