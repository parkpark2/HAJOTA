<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/TypeofCss/IS/IS.css" />

<style type="text/css">

</style>



<div class="container">
	<div style="width: 250px; display: inline-block;">
    <nav class="nav-sidebar">
		<ul class="nav tabs">
          <li class="active"><a href="#tab1" data-toggle="tab">프로필수정</a></li>
          <li class=""><a href="#tab2" data-toggle="tab">예약현황</a></li>
          <li class=""><a href="#tab3" data-toggle="tab">이용내역</a></li>
          <li class=""><a href="#tab4" data-toggle="tab">위시리스트</a></li>
          <li class=""><a href="#tab5" data-toggle="tab">후기</a></li>
		</ul>
	</nav>

	</div>

<div class="tab-content" style="display: inline-block; margin-left: 100px;">
<div class="tab-pane active text-style" id="tab1">
  <h2>프로필수정</h2>
       
       
						       <div class="container">
							<div class="row">
								 <form class="form-horizontal">
						            <fieldset>
		
						                <!-- city input-->
						                <div class="control-group">
						                    <label class="control-label">guest_email</label>
						                    <div class="controls">
						                        <input id="mobile" name="mobile" type="text" placeholder="guest_email" class="input-xlarge">
						                        <p class="help-block"></p>
						                    </div>
						                </div>
						         
						                                <!-- city input-->
						                <div class="control-group">
						                    <label class="control-label">password</label>
						                    <div class="controls">
						                        <input id="pwd" name="pwd" type="text" placeholder="password" class="input-xlarge">
						                        <p class="help-block"></p>
						                    </div>
						                </div>
						         
						                <!-- first-name input-->
						                <div class="control-group">
						                    <label class="control-label">First Name</label>
						                    <div class="controls">
						                        <input id="first-name" name="first-name" type="text" placeholder="first name"
						                        class="input-xlarge">
						                        <p class="help-block"></p>
						                    </div>
						                </div>
						                
						                <!-- last-name input-->
						                <div class="control-group">
						                    <label class="control-label">Last Name</label>
						                    <div class="controls">
						                        <input id="last-name" name="last-name" type="text" placeholder="last name"
						                        class="input-xlarge">
						                        <p class="help-block"></p>
						                    </div>
						                </div>
						                
						
						
						                <div class="control-group">
						                                    <label class="control-label">Date of Birth</label>
						                    <div class="controls">
						                    <div data-date-format="dd-mm-yyyy" data-date="12-02-2012" id="dp3" class="input-append date">
						    			<input type="text" readonly="" value="12-02-2012" size="16" class="span2">
										<span class="add-on"><i class="icon-calendar"></i></span>
						                </div>
									  </div>
						                </div>
						
						
						            </fieldset>
						        </form>
							</div>
						</div>
       
       
       <hr>
</div>
<div class="tab-pane text-style" id="tab2">
  <h2>예약현황</h2>
   <p>내용넣는곳</p>
    <hr>

</div>

<div class="tab-pane text-style" id="tab3">
  <h2>이용내역</h2>
   <p>내용넣는곳</p>
    <hr>

</div>

<div class="tab-pane text-style" id="tab4">
  <h2>위시리스트</h2>
   <p>내용넣는곳</p>
    <hr>

</div>

<div class="tab-pane text-style" id="tab5">
  <h2>후기</h2>
  <p>내용넣는곳</p>
    <hr>
    <div class="col-xs-6 col-md-3">

  </div>
</div>
</div>
    
    
</div>