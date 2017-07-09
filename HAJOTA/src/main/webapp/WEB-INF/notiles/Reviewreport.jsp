<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/TypeofCss/JW/sweetalert.css" />
 <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/js/JW/sweetalert-dev.js"></script>
    <script src="<%= request.getContextPath() %>/resources/js/JW/sweetalert.min.js"></script>
   <script>
    $(document).ready(function(){
    	swal({
    		  title: "An input!",
    		  text: "Write something interesting:",
    		  type: "input",
    		  showCancelButton: true,
    		  closeOnConfirm: false,
    		  animation: "slide-from-top",
    		  inputPlaceholder: "Write something"
    		},
    		function(inputValue){
    		  if (inputValue === false) return false;
    		  
    		  if (inputValue === "") {
    		    swal.showInputError("You need to write something!");
    		    return false
    		  }
    		  
    		  swal("Nice!", "You wrote: " + inputValue, "success");
    		});
      });
  </script> 
  
  <form name="reportFrm">
  <input type="hidden" name="email" value="${email}" />
  <input type="hidden" name="reviewno" value="${reviewno}" />
  <input type="hidden" name="reviewcontent" />
  </form>
  
  
  
  