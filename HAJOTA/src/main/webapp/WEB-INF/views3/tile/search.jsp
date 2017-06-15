<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( ".datepicker" ).datepicker({
    
    });
  } );
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
               HELLO <span style="color: rgba(41, 216, 70, 0.8)">HAJOTA</span>
            </h1>

            <p style="color: #eee">
               국내 1,375,000개 이상의 숙소 특가 할인!!
              <br/><br/>
            </p>

            <p>
               <!-- 달력 띄우자 -->
               <span style="color: white;">
               <label><i class="fa fa-search"></i> Search</label>&nbsp;
               </span>
               <input type="text" id="search" name="search" placeholder="search" size="10" style="height: 35px;" />&nbsp; 
               <span style="color: white;">
               <label><i class="fa fa-male"></i> Adults</label>&nbsp;
               </span>
               <input type="text" id="search" name="search" placeholder="1" size="3" style="height: 35px;"/>&nbsp; 
               <span style="color: white;">
               <label><i class="fa fa-calendar-o"></i> Check In</label>&nbsp;
               </span>
               <input type="text" class="datepicker" name="startDate" placeholder="Check In" size="10" style="height: 35px;" />&nbsp; 
               <span style="color: white;">
               <label><i class="fa fa-calendar-o"></i> Check Out</label>&nbsp;
               </span>
               <input type="text" class="datepicker" name="endDate"  placeholder="Check Out" size="10" style="height: 35px;" />&nbsp; 
               <br/><br/>
        
               <button type="button" class="w3-button w3-red w3-margin-top" style="width: 200px;">FIND</button>
            </p>
         </div>
 
      </div>
      
      
</body>
</html>