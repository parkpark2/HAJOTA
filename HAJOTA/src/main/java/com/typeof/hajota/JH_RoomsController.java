package com.typeof.hajota;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.typeof.hajota.rooms.service.JH_RoomsService;

//===== #32. 컨트롤러 선언 =====
@Controller	
@Component
/* XML 에서 빈을 만드는 대신에 클래스명 앞에
@Component 어노테이션을 적어주면 해당 클래스는
bean 으로 자동 등록된다.
그리고 bean의 이름(첫글자는 소문자)은 해당 클래스명이 된다.  
*/
public class JH_RoomsController {
	
	//	===== #33. 의존객체 주입하기(DI : Dependency Injection) ===== 
	@Autowired
	private JH_RoomsService service;


	// 모든 숙소 리스트 가져오는 메소드
	@RequestMapping(value = "/rooms/list.go", method = RequestMethod.GET)
	public String roomsList(HttpServletRequest req) {
		
		List<HashMap<String, Object>> roomsList = service.getRoomsList();
	    req.setAttribute("roomsList", roomsList);
	    
	    
	    ////////////////////////////////////////////////////////////////////////
	    
	    String search_type = "location";
		String search_content = "";
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("search_type", search_type);
		map.put("search_content", search_content);
		
		List<HashMap<String, Object>> roomsLocationInfoList = service.getRoomsLocationInfoList(map);
		
	    req.setAttribute("roomsLocationInfoList", roomsLocationInfoList);
		
	    return "rooms/list.tiles3";
	}
	
	/*
	// 검색 된 지역에서 근처 등록 된 숙소의 정보(시퀀스, 위도, 경도, 1박 총 금액) 불러오기
	@RequestMapping(value = "/rooms/list1.go", method = RequestMethod.GET)
	public String searchNearbyMap(HttpServletRequest req) {

		String search_type = "location";
		String search_content = "";
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("search_type", search_type);
		map.put("search_content", search_content);
		
		List<HashMap<String, Object>> roomsLocationInfoList = service.getRoomsLocationInfoList(map);
		
	    req.setAttribute("roomsLocationInfoList", roomsLocationInfoList);
		
	    return "map.tiles3.map";
	}*/
}
