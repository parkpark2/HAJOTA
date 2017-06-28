package com.typeof.hajota;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		String search_content = req.getParameter("search_content");
		String str_numOfPeople = req.getParameter("numOfPeople");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
		
		//////////////////////////////////////////////////////////////////
		// TODO : YYYY-MM-DD 양식에 맞게 넣을 수 있도록 header의 search와
		//        main의 search의 규격을 맞춰주자
		String year = "", month = "", day = "";
		
		StringTokenizer st1 = new StringTokenizer(startDate, "/");
		
		if(st1.countTokens() != 0) {
			if(st1.hasMoreTokens()) {
				month = st1.nextToken();
				if(st1.hasMoreTokens()) {
					day = st1.nextToken();
					if(st1.hasMoreTokens()) {
						year = st1.nextToken();
						startDate = year + "-" + month + "-" + day;
					}
				}
			}
		}
		
		StringTokenizer st2 = new StringTokenizer(endDate, "/");
		
		if(st2.countTokens() != 0) {
			if(st2.hasMoreTokens()) {
				month = st2.nextToken();
				if(st2.hasMoreTokens()) {
					day = st2.nextToken();
					if(st2.hasMoreTokens()) {
						year = st2.nextToken();
						endDate = year + "-" + month + "-" + day;
					}
				}
			}
		}
		//////////////////////////////////////////////////////////////////
		
		System.out.println("startDate : " + startDate);
		System.out.println("endDate : " + endDate);
		
		
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
        int sizePerPage = 2;
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
	    
	    List<HashMap<String, Object>> roomsWishListInList = service.getWishListInList(map1, rowBounds);
	    req.setAttribute("roomsWishListInList", roomsWishListInList);
	    
	    return "rooms/list.tiles3";
	}
	
	@RequestMapping(value = "rooms/moveMap.go", method = RequestMethod.GET)
	@ResponseBody
	public List<HashMap<String, Object>> roomsListPagingMap(HttpServletRequest req, HttpServletResponse res) {

		////////////////////////////////////////////////////////////////////////
		String search_content = req.getParameter("search_content");
		String str_numOfPeople = req.getParameter("numOfPeople");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");

		if (search_content == null) {
			search_content = "";
		}

		if ((str_numOfPeople == null) || ("".equals(str_numOfPeople))) {
			str_numOfPeople = "1";
		}

		if ((startDate == null) || ("".equals(startDate))) {
			startDate = "";
		}

		if ((endDate == null) || ("".equals(endDate))) {
			endDate = "";
		}

		req.setAttribute("search_content", search_content);
		req.setAttribute("numOfPeople", str_numOfPeople);
		req.setAttribute("startDate", startDate);
		req.setAttribute("endDate", endDate);

		String afterLat = req.getParameter("afterLat");
		String afterLon = req.getParameter("afterLon");

		// 거리(km)
		double distance = 2.0;

		req.setAttribute("afterLat", afterLat);
		req.setAttribute("afterLon", afterLon);

		///////////////////////////////////////////////////////////////////////

		System.out.println("afterLat : " + afterLat);
		System.out.println("afterLon : " + afterLon);
		
		// 위도, 경도
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("afterLat", afterLat);
		map.put("afterLon", afterLon);
		map.put("distance", distance);

		// 기간 내 예약할 수 있는 숙소 정보
		List<HashMap<String, Object>> roomsList = service.getNearFromCenterRoomsList(map);
		
		System.out.println("roomsList : " + roomsList.size());

		return roomsList;
	}
	
	

	/*
	// 검색 된 조건에 맞는 숙소 가져오는 리스트
	@RequestMapping(value = "rooms/list.go", method = RequestMethod.GET)
	public String roomsList(HttpServletRequest req) {
		
		String search_content = req.getParameter("search_content");
		String str_numOfPeople = req.getParameter("numOfPeople");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
		
		//////////////////////////////////////////////////////////////////
		// TODO : YYYY-MM-DD 양식에 맞게 넣을 수 있도록 header의 search와
		//        main의 search의 규격을 맞춰주자
		String year = "", month = "", day = "";
		
		StringTokenizer st1 = new StringTokenizer(startDate, "/");
		
		if(st1.countTokens() != 0) {
			if(st1.hasMoreTokens()) {
				month = st1.nextToken();
				if(st1.hasMoreTokens()) {
					day = st1.nextToken();
					if(st1.hasMoreTokens()) {
						year = st1.nextToken();
						startDate = year + "-" + month + "-" + day;
					}
				}
			}
		}
		
		StringTokenizer st2 = new StringTokenizer(endDate, "/");
		
		if(st2.countTokens() != 0) {
			if(st2.hasMoreTokens()) {
				month = st2.nextToken();
				if(st2.hasMoreTokens()) {
					day = st2.nextToken();
					if(st2.hasMoreTokens()) {
						year = st2.nextToken();
						endDate = year + "-" + month + "-" + day;
					}
				}
			}
		}
		//////////////////////////////////////////////////////////////////
		
		System.out.println("startDate : " + startDate);
		System.out.println("endDate : " + endDate);
		
		
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
        int sizePerPage = 2;
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
	    
	    List<HashMap<String, Object>> roomsWishListInList = service.getWishListInList(map1, rowBounds);
	    req.setAttribute("roomsWishListInList", roomsWishListInList);
	    
	    return "rooms/list.tiles3";
	}
	*/
	
	
	// 위시 리스트 클릭
	@RequestMapping(value="rooms/clickWishList.go", method={RequestMethod.GET})
	// JSON 필수
	@ResponseBody
	public HashMap<String, Object> clickWishList(HttpServletRequest req, HttpServletResponse res) {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		int result = -1;
		
		// TODO : 세션으로 로그인 한 유저 구해서 고쳐주자
		// HttpSession session = req.getSession();
		// MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		////////////////////////////////////////////////////////////////////////
		String email = req.getParameter("email");
		
		////////////////////////////////////////////////////////////////////////
		
		String seq_lodge = req.getParameter("seq_lodge");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("email", email);
		map.put("seq_lodge", seq_lodge);
		
		int checkWishList = service.checkWishList(map);
		
		// 체크 리스트에 항목이 없으면 추가해주기
		if(checkWishList == 0) {
			result = service.insertWishList(map);
			
			resultMap.put("status", result);
		}
		
		// 체크 리스트에 항목이 있으면 status 바꾸어 주기
		else {
			// 해당 아이디와 숙소에 해당하는 status 찾고
			int status = service.getWishListStatus(map);
			
			System.out.println("status : " + status);
			// 업데이트 해주기
			map.put("status", status);
			result = service.updateWishList(map);
			
			if(result == 1) {
				if(status == 1) {
					status = 0;
				}
				
				else if(status == 0) {
					status = 1;
				}
				
				resultMap.put("status", status);
			}
		}

		// TODO : result 값 가지고 중간에 alert 띄우자
		resultMap.put("result", result);

		return resultMap;
	}	
	
	
	/*
	// 페이지ㅏㅇ아ㅏ아아아ㅏ아아ㅏ아ㅏ아아ㅏㅏ아아ㅏ아ㅏ아ㅏ아ㅏ아ㅏ아아ㅏ아아ㅣ
	// 맵의 중심 이동시키면 주변 숙소 보이게 하기
	@RequestMapping(value = "rooms/moveMap1.go", method = RequestMethod.GET)
	public String roomsListMoveMap1(HttpServletRequest req) {    
	    
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
		List<HashMap<String, Object>> roomsList = service.getNearFromCenterRoomsList(map);
	    req.setAttribute("roomsList", roomsList);
		
	    return "rooms/list.tiles3";
	}
	
	*/
	
	// 갤러리 보기
	@RequestMapping(value = "rooms/gallery.go", method = RequestMethod.GET)
	public String roomsGallery(HttpServletRequest req) {
		
		return "rooms/gallery-single.tiles3";
	}
	
	// 숙소 입력 페이지
	@RequestMapping(value="rooms/insert.go", method={RequestMethod.GET})
    public String hyhostinsert(HttpServletRequest req) {
		
		// 1 페이지 일년만 일찍태어났으면 ㅋㅋㅋ  배고파서 현기증난달말이에요 빨리 라운지 고고고 
		String roomsname = req.getParameter("roomsname");
		String str_type_lodge = req.getParameter("TYPE_LODGE");
		String str_type_building = req.getParameter("TYPE_BUILDING");
		String str_maxpeople = req.getParameter("maxpeople");
		
		// 2 페이지
		String roadAddress = req.getParameter("roadAddress");
		String detailAddress = req.getParameter("detailAddress");
		String str_lat = req.getParameter("LAT");
		String str_lng = req.getParameter("LNG");
		
		// 3 페이지
		String str_bathroomcount = req.getParameter("bathroomcount");
		String str_bedroomcount = req.getParameter("bedroomcount");
		String str_bedcount = req.getParameter("bedcount");
		String str_Hcheckin = req.getParameter("Hcheckin");
		String str_Hcheckout = req.getParameter("Hcheckout");
		
		// 4 페이지
		String str_paddprice = req.getParameter("paddprice");
		String str_depositprice = req.getParameter("depositprice");
		String str_cleanprice = req.getParameter("cleanprice");
		String str_totalprice = req.getParameter("totalprice");
		
		// 5 페이지
		String str_elevator = req.getParameter("elevator");
		String str_wifi = req.getParameter("wifi");
		String str_airconditioner = req.getParameter("airconditioner");
		String str_heater = req.getParameter("heater");
		String str_washingmachin = req.getParameter("washingmachin");
		String str_hairdry = req.getParameter("hairdry");
		String str_television = req.getParameter("television");
		String essentialitem = req.getParameter("essentialitem");
		
		// 6 페이지
		String rooms_explain = req.getParameter("rooms_explain");
		String refund_policy = req.getParameter("refund_policy");
		String rooms_rule = req.getParameter("rooms_rule");
		
		// 7 페이지
		String safety_function = req.getParameter("safety_function");
		String local_information = req.getParameter("local_information");
		
		
		
		
		
		
		
	 
    	return "hyhostinsert.notiles";
    	// /Board/src/main/webapp/WEB-INF/views/main/test.jsp 파일을 생성한다.
    }
	
	
	// 숙소 입력 확인
	@RequestMapping(value = "rooms/insertEnd.go", method = RequestMethod.POST)
	public String insertRoomEnd(HttpServletRequest req) {
		
	    
		return "JH/rooms/insertMSG.notiles";
	}
	
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
