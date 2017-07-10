<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$(".datepicker").datepicker({
 
		});
	});
</script>
<style>
#ui-datepicker-div {
	background-color: white;
}
</style>
</head>
<body>
	<div class="container">

		<div class="jumbotron text-center"
			style="margin-top: 110px; margin-bottom: 110px; padding: 40px; background: rgba(1, 1, 1, 0.3)">
			<h1 style="color: #eee; font-weight: 600">
				你好 <span style="color: rgba(41, 216, 70, 0.8)">HAJOTA</span>
			</h1>

			<p style="color: #eee;">
				<span style="font-weigth:bold;">欢迎欢迎您，HAJOTA是韩国的有名网站，<br/>有很多非常便宜的韩国酒店， 很美丽的酒店。 快来查询一下!</span>
				 <br/>	<br/>
			</p>

			<p>
			
				<span style="color: white;"> <label><i
						class="fa fa-search"></i> 目的地</label>&nbsp;
				</span> <input type="text" id="search" name="search" placeholder="中文/拼音"
					size="10" style="height: 35px;" />&nbsp; <span
					style="color: white;"> <label><i class="fa fa-male"></i>
						人数</label>&nbsp;
				</span> <input type="text" id="search" name="search" placeholder="1"
					size="3" style="height: 35px;" />&nbsp; <span style="color: white;">
					<label><i class="fa fa-calendar-o"></i> 入住</label>&nbsp;
				</span> <input type="text" class="datepicker" name="startDate"
					placeholder="选择" size="10" style="height: 35px;" />&nbsp; <span
					style="color: white;"> <label><i
						class="fa fa-calendar-o"></i> 退房</label>&nbsp;
				</span> <input type="text" class="datepicker" name="endDate"
					placeholder="选择" size="10" style="height: 35px;" />&nbsp; <br />
				<br />

				<button type="button" class="w3-button w3-red w3-margin-top"
					style="width: 200px;">查询</button>
			</p>
		</div>

	</div>


</body>
