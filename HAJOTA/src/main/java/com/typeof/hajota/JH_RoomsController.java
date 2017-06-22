package com.typeof.hajota;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
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

	// 검색 된 조건에 맞는 숙소 가져오는 리스트
	@RequestMapping(value = "rooms/list.go", method = RequestMethod.GET)
	public String roomsList(HttpServletRequest req) {	    
	    
	    ////////////////////////////////////////////////////////////////////////
		String search_content = req.getParameter("search_content");
		String str_numOfPeople = req.getParameter("numOfPeople");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
		if(search_content == null) {
			search_content = "";
		}
		
		if((str_numOfPeople == null) || ("".equals(str_numOfPeople))) {
			str_numOfPeople = "1";
		}
		
		if((startDate == null) || ("".equals(startDate))) {
			startDate = "";
		}
		
		if((endDate == null) || ("".equals(endDate))) {
			endDate = "";
		}
		
		req.setAttribute("search_content", search_content);
		req.setAttribute("numOfPeople", str_numOfPeople);
		req.setAttribute("startDate", startDate);
		req.setAttribute("endDate", endDate);
		
		// TODO : 값 입력받을 수 있게 변경해주어야 함
		/*
		startDate = "2010-01-01";
		endDate = "2017-06-19";
		*/
		///////////////////////////////////////////////////////////////////////
		
		// 검색어, 사람
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		map1.put("search_content", search_content);
		map1.put("str_numOfPeople", str_numOfPeople);
		
		
		// 날짜
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("startDate", startDate);
		map2.put("endDate", endDate);
		
		String[] seq_lodgeArr = null;
		
		// 기간 내 예약하지 못하는 숙소 목록
		// TODO : 하나라도 입력 받지 못하면 전체 출력인데 jsp에서 미리 걸러내자
		if(!"".equals(startDate) || !"".equals(endDate)) {
			List<HashMap<String, Object>> seq_lodgeList = service.getUnavailableSeqLodgeList(map2);
			
			for(int i = 0; i < seq_lodgeList.size(); ++i) {
				if(i == 0) {
					seq_lodgeArr = new String[seq_lodgeList.size()];
				}
				
				String seq_lodge = seq_lodgeList.get(i).get("SEQ_LODGE").toString();
				seq_lodgeArr[i] = seq_lodge;
			}
		}
		
		map1.put("seq_lodgeArr", seq_lodgeArr);
			        
	    String pageNo = req.getParameter("pageNo");
        
        int totalCount = 0;
        // TODO : 수정하자
        int sizePerPage = 5;
        int currentShowPageNo = 1;
        int totalPage = 0;
        
        int startPageNo = 0; 
        
        int loop = 0;
        int blocksize = 5;
        
        if(pageNo == null) {
           currentShowPageNo = 1;
        }
        else {
           currentShowPageNo = Integer.parseInt(pageNo);
        }
        
        int start = 0;
        int offset = 0;
        
        start = (currentShowPageNo - 1) * sizePerPage;
        offset = sizePerPage;
     
        totalCount = service.getAvailableRoomsCount(map1);
         
        totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
        
        String pagebar = "";
        pagebar += "<ul>";

        loop = 1;
        
        startPageNo = ((currentShowPageNo - 1) / blocksize) * blocksize + 1;
          
		if (startPageNo == 1) {
			pagebar += "";
		} else {
			pagebar += String.format(
					"&nbsp;&nbsp;<a href='/hajota/rooms/list.go?search_content=%s&numOfPeople=%d&startDate=%s&endDate=%s&pageNo=%d'>[이전]</a>&nbsp;&nbsp;",
					search_content, Integer.parseInt(str_numOfPeople), startDate, endDate, startPageNo - 1);
		}

		while (!(loop > blocksize || startPageNo > totalPage)) {

			if (startPageNo == currentShowPageNo) {
				pagebar += String.format(
						"&nbsp;&nbsp;<span style='color:red; font-weight:bold; text-decoration:underline;'>%d</span>&nbsp;&nbsp;",
						startPageNo);
			}
			else {
				pagebar += String.format(
						"&nbsp;&nbsp;<a href='/hajota/rooms/list.go?search_content=%s&numOfPeople=%d&startDate=%s&endDate=%s&pageNo=%d'>%d</a>&nbsp;&nbsp;",
						search_content, Integer.parseInt(str_numOfPeople), startDate, endDate, startPageNo, startPageNo);
			}

			loop++;
			startPageNo++;

		}

		if (startPageNo > totalPage) {
			pagebar += "";
		} else {
			pagebar += String.format(
						"&nbsp;&nbsp;<a href='/hajota/rooms/list.go?search_content=%s&numOfPeople=%d&startDate=%s&endDate=%s&pageNo=%d'>[다음]</a>&nbsp;&nbsp;",
						search_content, Integer.parseInt(str_numOfPeople), startDate, endDate, startPageNo);
		}

		pagebar += "</ul>";

		req.setAttribute("pagebar", pagebar);
		
		RowBounds rowBounds = new RowBounds(start, offset);
		
		// 기간 내 예약할 수 있는 숙소 정보(페이징 처리)
		List<HashMap<String, Object>> roomsList = service.getAvailableRoomsList(map1, rowBounds);
	    req.setAttribute("roomsList", roomsList);

		
	    return "rooms/list.tiles3";
	}
	
	@RequestMapping(value = "/rooms/gallery.go", method = RequestMethod.GET)
	public String roomsGallery(HttpServletRequest req) {
		
		return "rooms/gallery-single.tiles3";
	}
	
	
	@RequestMapping(value = "rooms/moveMap.go", method = RequestMethod.GET)
	public String roomsListMoveMap(HttpServletRequest req) {    
	    
	    ////////////////////////////////////////////////////////////////////////
		
	    String search_type = "location";
		String search_content = req.getParameter("search_content");
		String str_numOfPeople = req.getParameter("numOfPeople");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
		if(search_content == null) {
			search_content = "";
		}
		
		if((str_numOfPeople == null) || ("".equals(str_numOfPeople))) {
			str_numOfPeople = "1";
		}
		
		req.setAttribute("search_type", search_type);
		req.setAttribute("search_content", search_content);
		req.setAttribute("numOfPeople", str_numOfPeople);
		req.setAttribute("startDate", startDate);
		req.setAttribute("endDate", endDate);
		
		// TODO : 값 입력받을 수 있게 변경해주어야 함
		/*
		startDate = "2010-01-01";
		endDate = "2017-06-19";
		*/
		
		String afterLat = req.getParameter("afterLat");
		String afterLon = req.getParameter("afterLon");
		
		// 거리(km)
		double distance = 5.0;
		
		req.setAttribute("afterLat", afterLat);
		req.setAttribute("afterLon", afterLon);
		
		///////////////////////////////////////////////////////////////////////
		
		// 위도, 경도
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("afterLat", afterLat);
		map.put("afterLon", afterLon);
		map.put("distance", distance);
		
		// 기간 내 예약할 수 있는 숙소 정보
		//List<HashMap<String, Object>> roomsList = service.getNearFromCenterRoomsList(map);
		List<HashMap<String, Object>> roomsList = service.getNearFromCenterRoomsList(map);
	    req.setAttribute("roomsList", roomsList);
		
	    return "rooms/list.tiles3";
	}
	/*
	// 숙소 입력
	@RequestMapping(value = "rooms/insertEnd.go", method = RequestMethod.GET)
	public String insertRoomEnd(HttpServletRequest req) {    
	    
	    ////////////////////////////////////////////////////////////////////////
		
	    String search_type = "location";
		String search_content = req.getParameter("search_content");
		String str_numOfPeople = req.getParameter("numOfPeople");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
		if(search_content == null) {
			search_content = "";
		}
		
		if((str_numOfPeople == null) || ("".equals(str_numOfPeople))) {
			str_numOfPeople = "1";
		}
		
		req.setAttribute("search_type", search_type);
		req.setAttribute("search_content", search_content);
		req.setAttribute("numOfPeople", str_numOfPeople);
		req.setAttribute("startDate", startDate);
		req.setAttribute("endDate", endDate);
		
		// TODO : 값 입력받을 수 있게 변경해주어야 함
		
		// startDate = "2010-01-01";
		// endDate = "2017-06-19";
		
		String afterLat = req.getParameter("afterLat");
		String afterLon = req.getParameter("afterLon");
		
		// 거리(km)
		double distance = 5.0;
		
		req.setAttribute("afterLat", afterLat);
		req.setAttribute("afterLon", afterLon);
		
		///////////////////////////////////////////////////////////////////////
		
		// 위도, 경도
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("afterLat", afterLat);
		map.put("afterLon", afterLon);
		map.put("distance", distance);
		
		// 기간 내 예약할 수 있는 숙소 정보
		//List<HashMap<String, Object>> roomsList = service.getNearFromCenterRoomsList(map);
		List<HashMap<String, Object>> roomsList = service.getNearFromCenterRoomsList(map);
	    req.setAttribute("roomsList", roomsList);
		
	    return "rooms/list.tiles3";
	}
	*/
	// TODO : 숙소수정 
	
	/*
	// 위시리스트 : 일단은 리스트에서 누르는 걸로
	@RequestMapping(value = "rooms/insertEnd.go", method = RequestMethod.GET)
	public String insertRoom1End(HttpServletRequest req) {    
	    
	    ////////////////////////////////////////////////////////////////////////
		
	    String search_type = "location";
		String search_content = req.getParameter("search_content");
		String str_numOfPeople = req.getParameter("numOfPeople");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
		if(search_content == null) {
			search_content = "";
		}
		
		if((str_numOfPeople == null) || ("".equals(str_numOfPeople))) {
			str_numOfPeople = "1";
		}
		
		req.setAttribute("search_type", search_type);
		req.setAttribute("search_content", search_content);
		req.setAttribute("numOfPeople", str_numOfPeople);
		req.setAttribute("startDate", startDate);
		req.setAttribute("endDate", endDate);
		
		// TODO : 값 입력받을 수 있게 변경해주어야 함
		
		startDate = "2010-01-01";
		endDate = "2017-06-19";
		
		
		String afterLat = req.getParameter("afterLat");
		String afterLon = req.getParameter("afterLon");
		
		// 거리(km)
		double distance = 5.0;
		
		req.setAttribute("afterLat", afterLat);
		req.setAttribute("afterLon", afterLon);
		
		///////////////////////////////////////////////////////////////////////
		
		// 위도, 경도
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("afterLat", afterLat);
		map.put("afterLon", afterLon);
		map.put("distance", distance);
		
		// 기간 내 예약할 수 있는 숙소 정보
		//List<HashMap<String, Object>> roomsList = service.getNearFromCenterRoomsList(map);
		List<HashMap<String, Object>> roomsList = service.getNearFromCenterRoomsList(map);
	    req.setAttribute("roomsList", roomsList);
		
	    return "rooms/list.tiles3";
	}*/
	
}
