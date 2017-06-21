<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <img style="width: 100%; height: 468px; margin-top: -9.5%;" src="<%= request.getContextPath()%>/resources/images/JHHY/${listdetail.mainimage}"><br/>
											
						
						<div style="margin-left: 1.2%"><span style="font-family: Fantasy;">${listdetail.hostname}`S 아늑하고 편안한 ${listdetail.roomname}</span></div>
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