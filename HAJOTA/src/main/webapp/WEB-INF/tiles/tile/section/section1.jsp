<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <img style="width: 100%; height: 468px; margin-top: -9.5%;" src="<%=request.getContextPath() %>/resources/files/${listdetail.mainimage}"><br/>
											
						
						
						<div style="border-bottom: solid rgba(0, 0, 0, 0.13) 3px; margin-bottom: 1%;"></div>
						<div style="float: center;">
						<img style="margin-left: 10%;" src="<%= request.getContextPath()%>/resources/images/JHHY/house.png">
						<img style="margin-left: 10%;" src="<%= request.getContextPath()%>/resources/images/JHHY/family.png">
						<img style="margin-left: 10%;" src="<%= request.getContextPath()%>/resources/images/JHHY/rest.png">
						<img style="margin-left: 10%;" src="<%= request.getContextPath()%>/resources/images/JHHY/bed.png">
						</div>
						<div><span style="margin-left: 12%;">${listdetail.buildingtype}</span>
						     <span style="margin-left: 17%;">${listdetail.maxpeople}명</span>
						     <span style="margin-left: 18%;">${listdetail.bedroomcnt}개</span>
						     <span style="margin-left: 17.6%;">${listdetail.bedcnt}개</span></div>
						<div style="border-bottom: solid rgba(0, 0, 0, 0.13) 3px;"></div>
						숙소설명<br/><br/>  ${listdetail.roomsexplain}<br/>
						숙소 방타입 : ${listdetail.lodgetype}<br/>
						숙소 건물타입 : ${listdetail.buildingtype}<br/>
						숙소 최대인원 : ${listdetail.maxpeople}<br/>
						침실 개수 : ${listdetail.bedroomcnt}<br/>
						침대 개수 : ${listdetail.bedcnt}<br/>