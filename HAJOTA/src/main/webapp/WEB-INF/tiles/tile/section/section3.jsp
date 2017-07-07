<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    ${listdetail.roomsexplain}<br/>
	${listdetail.roomsrule}<br/>
	${listdetail.refundpolicy}<br/>
	${listdetail.safetyfunction}<br/>
	${listdetail.localinfomation}<br/>
	
		<form method="post" action="#">
			<div class="row">
				<div class="6u 12u$(mobile)"><input type="text" name="name" placeholder="Name" /></div>
				<div class="6u$ 12u$(mobile)"><input type="text" name="email" placeholder="Email" /></div>
				<div class="12u$">
					<textarea name="message" placeholder="Message"></textarea>
				</div>
				<div class="12u$">
					<input type="submit" value="Send Message" />
				</div>
			</div>
		</form>
