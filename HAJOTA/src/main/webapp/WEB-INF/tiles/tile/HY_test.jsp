<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!-- Main -->
			<div id="main">

				<!-- Introdd -->
					<section id="top" class="one dark cover">
						<img style="width: 100%; height: 468px; margin-top: -9.5%;" src="<%= request.getContextPath()%>/resources/images/JHHY/${listdetail.mainimage}"><br/>
											
						
						<div style="margin-left: 1.2%"><span style="font-size: 20pt; font-weight: 800;">${listdetail.hostname}`S</span> 아늑하고 편안한 ${listdetail.roomname}</div>
						<div style="border-bottom: solid rgba(255, 219, 219, 0.45) 3px;"></div>
						<div style="float: center;">
						<img style="margin-left: 10%;" src="<%= request.getContextPath()%>/resources/images/JHHY/house.png">
						<img style="margin-left: 10%;" src="<%= request.getContextPath()%>/resources/images/JHHY/family.png">
						<img style="margin-left: 10%;" src="<%= request.getContextPath()%>/resources/images/JHHY/rest.png">
						<img style="margin-left: 10%;" src="<%= request.getContextPath()%>/resources/images/JHHY/bed.png">
						</div>
						<div>${listdetail.maxpeople}    ${listdetail.buildingtype}</div>
						<div style="border-bottom: solid rgba(255, 219, 219, 0.45) 3px;"></div>
						숙소설명<br/><br/>  ${listdetail.roomsexplain}<br/>
						숙소 방타입 : ${listdetail.lodgetype}<br/>
						숙소 건물타입 : ${listdetail.buildingtype}<br/>
						숙소 최대인원 : ${listdetail.maxpeople}<br/>
					</section>

				<!-- Portfolio -->
					<section id="portfolio" class="two dark cover">
						추가인원 가격 : ${listdetail.paddprice},<br/>
						보증금 : ${listdetail.depositprice}<br/>
						청소비 : ${listdetail.cleanprice}<br/>
						총가격 : ${listdetail.totalprice}<br/>
						숙소 상태 : ${listdetail.roomstatus}<br/>
						화장실 개수 : ${listdetail.bathroomcnt}<br/>
						침실 개수 : ${listdetail.bedroomcnt}<br/>
						침대 개수 : ${listdetail.bedcnt}<br/>
						숙소 체크인시간 : ${listdetail.Hcheckin}<br/>
						숙소 체크아웃 시간 : ${listdetail.Hcheckout}<br/>
						엘레베이터유무 : ${listdetail.elevator}<br/>
						와이파이유무 : ${listdetail.wifi}<br/>
						에어컨 유무 : ${listdetail.aircontroller}<br/>
						히터 유무 : ${listdetail.heating}<br/>
						세탁기 유무 : ${listdetail.washingmachine}<br/>
						헤어드라이기 유무 : ${listdetail.hairdryer}<br/>
						티비 유무 : ${listdetail.tv}<br/>
						아이템 유무 : ${listdetail.essentialitem}<br/>
						<c:if test="${listdetail.elevator == 1}">
						<img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/elevator.png">
						</c:if>
						<c:if test="${listdetail.wifi == 1}">
						<img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/wifi.png">
						</c:if>
						<c:if test="${listdetail.aircontroller == 1}">
						<img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/airconditioner.png">
						</c:if>
						<c:if test="${listdetail.heating == 1}">
						<img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/heater.png">
						</c:if>
						<c:if test="${listdetail.washingmachine == 1}">
						<img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/washingmachin.png">
						</c:if>
						<c:if test="${listdetail.hairdryer == 1}">
						<img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/hairdry.png">
						</c:if>
						<c:if test="${listdetail.tv == 1}">
						<img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/television.png">
						</c:if>
						<c:if test="${listdetail.essentialitem == 1}">
						<img style="width: 30px; height: 30px;" src="<%= request.getContextPath()%>/resources/images/JHHY/essentialitem.png">
						</c:if>
					</section>

				<!-- About Me -->
					<section id="about" class="three dark cover">
						${listdetail.roomsexplain}<br/>
						${listdetail.roomsrule}<br/>
						${listdetail.refundpolicy}<br/>
						${listdetail.safetyfunction}<br/>
						${listdetail.localinfomation}<br/>
						
					</section>

				<!-- Contact -->
					<section id="contact" class="four dark cover">
						<div class="container">

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

						</div>
					</section>

			</div>

		
</body>
</html>