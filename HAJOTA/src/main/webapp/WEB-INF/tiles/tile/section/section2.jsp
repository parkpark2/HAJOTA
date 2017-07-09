<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

						추가인원 가격 : ${listdetail.roomprice}<br/>
						보증금 : ${listdetail.depositprice}<br/>
						청소비 : ${listdetail.cleanprice}<br/>
						총가격 : ${listdetail.totalprice}<br/>
						숙소 상태 : ${listdetail.roomstatus}<br/>
						화장실 개수 : ${listdetail.bathroomcnt}<br/>
						숙소 체크인시간 : ${listdetail.Hcheckin}<br/>
						숙소 체크아웃 시간 : ${listdetail.Hcheckout}<br/>
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