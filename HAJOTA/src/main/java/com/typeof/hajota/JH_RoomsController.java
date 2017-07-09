package com.typeof.hajota;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	public static final int SIZE_PER_PAGE = 6; 
	
	//	===== #33. 의존객체 주입하기(DI : Dependency Injection) ===== 
	@Autowired
	private JH_RoomsService service;
	
	@Autowired
	private FileManager fileManager;
	/*
	@RequestMapping(value = "search.go", method = {RequestMethod.POST, RequestMethod.GET})
	public String PlaceSearch(HttpServletRequest req) {
		return "JH_PlaceSearch.notiles";
	}
	*/
	// 검색 된 조건에 맞는 숙소 가져오는 리스트
	@RequestMapping(value = "rooms/list.go", method = {RequestMethod.POST, RequestMethod.GET})
	public String roomsList(HttpServletRequest req) {
		
		String search_content = req.getParameter("search_content");
		String str_numOfPeople = req.getParameter("numOfPeople");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
		//////////////////////////////////////////////////////////////////
		// TODO : YYYY-MM-DD 양식에 맞게 넣을 수 있도록 header의 search와
		//        main의 search의 규격을 맞춰주자
		
		if(!(startDate == null || "".equals(startDate))) {
			boolean bool = false;
			
			for(int i = 0; i < startDate.length(); ++i) {
				if("/".equals(startDate.substring(i, i + 1))){
					bool = true;
				}
			}
			
			if(bool) {
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
			}
		}
		//////////////////////////////////////////////////////////////////
		
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
		
	    return "rooms/list.tiles3";
	}
	
	@RequestMapping(value = "rooms/listEnd.go", method = {RequestMethod.GET})
	@ResponseBody
	public List<HashMap<String, Object>> roomsListEnd(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		
		HashMap<String, Object> loginUser = (HashMap<String, Object>)session.getAttribute("loginuser");
		
		String email = (String)loginUser.get("EMAIL");
		
		// TODO : 여기서 검색하자
		String search_content = req.getParameter("search_content");
		String str_numOfPeople = req.getParameter("numOfPeople");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
		// 검색어, 사람
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		map1.put("search_content", search_content);
		map1.put("str_numOfPeople", str_numOfPeople);
		map1.put("email", email);
		
		System.out.println("email : " + email);
		
		// 날짜
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("startDate", startDate);
		map2.put("endDate", endDate);
		
		String[] seq_lodgeArr = null;
		
		// 기간 내 예약하지 못하는 숙소 목록
		if(startDate != null && endDate != null) {
			List<HashMap<String, Object>> seq_lodgeList = service.getUnavailableSeqLodgeList(map2);
			
			for(int i = 0; i < seq_lodgeList.size(); ++i) {				
				if(i == 0) {
					seq_lodgeArr = new String[seq_lodgeList.size()];
				}
				
				String seq_lodge = seq_lodgeList.get(i).get("SEQ_LODGE").toString();
				seq_lodgeArr[i] = seq_lodge;
				
				System.out.println("거르는 seq : " + seq_lodge);
			}
		}
		
		map1.put("seq_lodgeArr", seq_lodgeArr);
		
	    String pageNo = req.getParameter("pageNo");
        
        int sizePerPage = SIZE_PER_PAGE;
        int currentShowPageNo = 1;
        
        if(pageNo == null) {
           currentShowPageNo = 1;
        }
        else {
           currentShowPageNo = Integer.parseInt(pageNo);
        }
        
        int start = 0;
        int end = 0;
        
        start = (currentShowPageNo - 1) * sizePerPage;
        end = currentShowPageNo * sizePerPage + 1;
        
        map1.put("start", start);
        map1.put("end", end);
		
		// 기간 내 예약할 수 있는 숙소 정보(페이징 처리)
		List<HashMap<String, Object>> roomsList = service.getAvailableRoomsList(map1);
	    
	    // TODO : join 사용하여 위와 같이 묶자
	    /*
	    List<HashMap<String, Object>> roomsWishListInList = service.getWishListInList(map1, rowBounds);
	    req.setAttribute("roomsWishListInList", roomsWishListInList);
	    */
	    
		System.out.println("roomsList.size() : " + roomsList.size());
	    return roomsList;
	}
	
	// 맵 이동시키면 주위 숙소만 나오게 하기
	@RequestMapping(value = "rooms/moveMap.go", method = {RequestMethod.GET})
	@ResponseBody
	public List<HashMap<String, Object>> roomsListPagingMap(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		
		HashMap<String, Object> loginUser = (HashMap<String, Object>)session.getAttribute("loginuser");
		
		String email = (String)loginUser.get("EMAIL");

		////////////////////////////////////////////////////////////////////////
		String search_content = req.getParameter("search_content");
		String str_numOfPeople = req.getParameter("numOfPeople");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		/*
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
		*/
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search_content", search_content);
		map.put("str_numOfPeople", str_numOfPeople);
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("email", email);
		
		String[] seq_lodgeArr = null;
		
		// 기간 내 예약하지 못하는 숙소 목록
		if(startDate != null && endDate != null) {
			List<HashMap<String, Object>> seq_lodgeList = service.getUnavailableSeqLodgeList(map);
			
			for(int i = 0; i < seq_lodgeList.size(); ++i) {				
				if(i == 0) {
					seq_lodgeArr = new String[seq_lodgeList.size()];
				}
				
				String seq_lodge = seq_lodgeList.get(i).get("SEQ_LODGE").toString();
				seq_lodgeArr[i] = seq_lodge;
				
				System.out.println("거르는 seq : " + seq_lodge);
			}
		}
		
		map.put("seq_lodgeArr", seq_lodgeArr);

		String afterLat = req.getParameter("afterLat");
		String afterLon = req.getParameter("afterLon");

		// 거리(km)
		double distance = 5.0;
		
		// 위도, 경도
		map.put("afterLat", afterLat);
		map.put("afterLon", afterLon);
		map.put("distance", distance);
		
		String pageNo = req.getParameter("pageNo");
		
        int sizePerPage = SIZE_PER_PAGE;
        int currentShowPageNo = 1;
        
        if(pageNo == null) {
           currentShowPageNo = 1;
        }
        else {
           currentShowPageNo = Integer.parseInt(pageNo);
        }
        
        int start = 0;
        int end = 0;
        
        start = (currentShowPageNo - 1) * sizePerPage;
        end = currentShowPageNo * sizePerPage + 1;
        
        map.put("start", start);
        map.put("end", end);

		// 기간 내 예약할 수 있는 숙소 정보
		List<HashMap<String, Object>> roomsList = service.getNearFromCenterRoomsList(map);
		
		//System.out.println("LAT : " + roomsList.get(0).get("LAT"));
		
		/*System.out.println("roomsList : " + roomsList.size());*/

		return roomsList;
	}	
	
	// 위시 리스트 클릭
	@RequestMapping(value="rooms/clickWishList.go", method={RequestMethod.GET})
	// JSON 필수
	@ResponseBody
	public HashMap<String, Object> clickWishList(HttpServletRequest req, HttpServletResponse res) {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		int result = -1;
		
		String email = req.getParameter("email");
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
	
	// 갤러리 보기
	@RequestMapping(value = "rooms/gallery.go", method = {RequestMethod.GET})
	public String roomsGallery(HttpServletRequest req) {
		
		return "rooms/gallery-single.tiles3";
	}
	
	// 숙소 입력 페이지
	@RequestMapping(value="rooms/insert.go", method={RequestMethod.GET})
    public String hyhostinsert(HttpServletRequest req, HttpSession session, HttpServletResponse res) {
	 
    	return "hyhostinsert.notiles";
    }
	
	// 숙소 입력 확인 페이지
	@RequestMapping(value="rooms/insertEnd.go", method={RequestMethod.POST})
    public String hyhostinsertEnd(MultipartHttpServletRequest req, HttpSession session, HttpServletResponse res) {
		
		// 1 페이지 
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
		
		String str_checkin_hour = req.getParameter("checkinHour");
		String str_checkin_min = req.getParameter("checkinMin");
		String str_checkout_hour = req.getParameter("checkoutHour");
		String str_checkout_min = req.getParameter("checkoutMin");
		
		// 4 페이지
		String str_roomprice = req.getParameter("roomprice");
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
		String str_essentialitem = req.getParameter("essentialitem");
		
		// 6 페이지
		String rooms_explain = req.getParameter("rooms_explain");
		String refund_policy = req.getParameter("refund_policy");
		String rooms_rule = req.getParameter("rooms_rule");
		
		// 7 페이지
		String safety_function = req.getParameter("safety_function");
		String local_information = req.getParameter("local_information");
		
		////////////////////////////////////////////////////////////////////////////////////////////////
		HashMap<String, Object> loginUser = (HashMap<String, Object>)session.getAttribute("loginuser");
		
		String email = (String)loginUser.get("EMAIL");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		
		map.put("name", roomsname);
		map.put("type_lodge", str_type_lodge);
		map.put("type_building", str_type_building);
		map.put("num_of_people", str_maxpeople);
		
		map.put("location", roadAddress);
		map.put("location_detail", detailAddress);
		map.put("lat", str_lat);
		map.put("lon", str_lng);
		
		map.put("num_of_bathroom", str_bathroomcount);
		map.put("num_of_bedroom", str_bedroomcount);
		map.put("num_of_bed", str_bedcount);
		
		map.put("checkin_hour", str_checkin_hour);
		map.put("checkin_min", str_checkin_min);
		map.put("checkout_hour", str_checkout_hour);
		map.put("checkout_min", str_checkout_min);
		
		map.put("room_price", str_roomprice);
		map.put("deposit_price", str_depositprice);
		map.put("clean_price", str_cleanprice);
		map.put("total_price", str_totalprice);
		
		if("on".equalsIgnoreCase(str_elevator)) {
			map.put("elevator", "1");
		}
		
		else {
			map.put("elevator", "0");
		}
		
		
		if("on".equalsIgnoreCase(str_wifi)) {
			map.put("wifi", "1");
		}
		
		else {
			map.put("wifi", "0");
		}
		
		
		if("on".equalsIgnoreCase(str_airconditioner)) {
			map.put("air_controller", "1");
		}
		
		else {
			map.put("air_controller", "0");
		}
		
		
		if("on".equalsIgnoreCase(str_heater)) {
			map.put("heating", "1");
		}
		
		else {
			map.put("heating", "0");
		}
		
		
		if("on".equalsIgnoreCase(str_washingmachin)) {
			map.put("washing_machine", "1");
		}
		
		else {
			map.put("washing_machine", "0");
		}
		
		
		if("on".equalsIgnoreCase(str_hairdry)) {
			map.put("hair_dryer", "1");
		}
		
		else {
			map.put("hair_dryer", "0");
		}
		
		
		if("on".equalsIgnoreCase(str_television)) {
			map.put("tv", "1");
		}
		
		else {
			map.put("tv", "0");
		}
		
		
		if("on".equalsIgnoreCase(str_essentialitem)) {
			map.put("essential_item", "1");
		}
		
		else {
			map.put("essential_item", "0");
		}
		
		map.put("rooms_explain", rooms_explain);
		map.put("refund_policy", refund_policy);
		map.put("rooms_rule", rooms_rule);
		
		map.put("safety_function", safety_function);
		map.put("local_information", local_information);
		
		// WAS 의 webapp 의 절대경로를 알아와야 한다. 
        session = req.getSession();
        String root = session.getServletContext().getRealPath("/"); 
        String path = req.getSession().getServletContext().getRealPath("/resources/images/hajotaroom");
        // path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다.
        
        String newFileName = "";
        // WAS(톰캣) 디스크에 저장할 파일명 
        
        byte[] bytes = null;
        // 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도 
        
        long fileSize = 0;
        // 파일크기를 읽어오기 위한 용도
        
        MultipartFile mainimage = req.getFile("mainimage");
        HashMap<String, Object> mainmap = new HashMap<String, Object>();
      
        if(mainimage != null){
         
        	try {
	            bytes = mainimage.getBytes();
	            
	            newFileName = fileManager.doFileUpload(bytes, mainimage.getOriginalFilename(), path);
	            
	            fileSize = mainimage.getSize();
	            
	            mainmap.put("mainimagename", newFileName);
	            mainmap.put("mainimageFilename", mainimage.getOriginalFilename());
	            mainmap.put("mainimagefileSize", String.valueOf(fileSize));
	            
        	} catch (Exception e) {
        		// TODO: handle exception
        	}
        }

		map.put("mainimagename", newFileName);

		List<MultipartFile> attachList = req.getFiles("attach");
		List<HashMap<String, String>> mapProductimageList = new ArrayList<HashMap<String, String>>();

		/*
		 * ===== #135. 사용자가 쓴 글에 파일이 첨부가 된것인지 아니면 파일첨부가 안된것인지 구분을 지어주어야 한다.
		 * =====
		 */
		// **** 첨부파일이 있는지 없는지? ****
		if (attachList != null) {

			for (int i = 0; i < attachList.size(); i++) {
				try {
					bytes = attachList.get(i).getBytes();

					newFileName = fileManager.doFileUpload(bytes, attachList.get(i).getOriginalFilename(), path);

					fileSize = attachList.get(i).getSize();

					// === >>>> thumbnail 파일 생성을 위한 작업 <<<< ========= //

					// =================================================== //

					HashMap<String, String> mapProductimage = new HashMap<String, String>();

					mapProductimage.put("imagefilename", newFileName);
					mapProductimage.put("imageorgFilename", attachList.get(i).getOriginalFilename());
					mapProductimage.put("imagefileSize", String.valueOf(fileSize));

					mapProductimageList.add(mapProductimage);

				} catch (Exception e) {

				}

			} // end of for-------------------------

		} // end of if------------------------------

		int n = service.setRoom(map);

		// **** 폼에서 입력받은 제품입력정보 값을
		// Service 단으로 넘겨서 테이블에 insert 하기로 한다.

		// 이미지파일첨부가 없는 경우 또는 이미지파일첨부가 있는 경우로 나누어서
		// Service 단으로 호출하기
		int m = 0;
		int count = 0;

		for (int i = 0; i < mapProductimageList.size(); i++) {
			m = service.addFile(mapProductimageList.get(i));
			if (m == 1)
				count++;
		}

		if (mapProductimageList.size() == count) {
			n = 1;
		} else {
			n = 0;
		}
		
		if(n == 1) {
			n = service.setHostStatus(map);
			
			HashMap<String, Object> hashmap = service.getLatelySeqLodge();
			req.setAttribute("seq_lodge", hashmap.get("SEQ_LODGE"));
		}
		
		req.setAttribute("n", n);
		
    	
    	return "rooms/insertEnd.tiles3";
    }
	
	// 숙소 수정 페이지
	@RequestMapping(value="rooms/modify.go", method={RequestMethod.GET})
    public String hyhostupdate(HttpServletRequest req, HttpSession session, HttpServletResponse res) {
		String str_seq_lodge = req.getParameter("seq_lodge");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("seq_lodge", str_seq_lodge);
		
		HashMap<String, Object> roomInfo = service.getRoomInfoBySeq(map);
		
		req.setAttribute("roomInfo", roomInfo);
	 
    	return "hyhostmodify.notiles";
    }
	
	@RequestMapping(value="rooms/modifyEnd.go", method={RequestMethod.POST})
    public String hyhostupdateEnd(MultipartHttpServletRequest req, HttpSession session, HttpServletResponse res) {

		// 1 페이지 
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
		
		String str_checkin_hour = req.getParameter("checkinHour");
		String str_checkin_min = req.getParameter("checkinMin");
		String str_checkout_hour = req.getParameter("checkoutHour");
		String str_checkout_min = req.getParameter("checkoutMin");
		
		// 4 페이지
		String str_roomprice = req.getParameter("roomprice");
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
		String str_essentialitem = req.getParameter("essentialitem");
		
		// 6 페이지
		String rooms_explain = req.getParameter("rooms_explain");
		String refund_policy = req.getParameter("refund_policy");
		String rooms_rule = req.getParameter("rooms_rule");
		
		// 7 페이지
		String safety_function = req.getParameter("safety_function");
		String local_information = req.getParameter("local_information");
		
		////////////////////////////////////////////////////////////////////////////////////////////////
		HashMap<String, Object> loginUser = (HashMap<String, Object>)session.getAttribute("loginuser");
		
		String email = (String)loginUser.get("EMAIL");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		
		map.put("name", roomsname);
		map.put("type_lodge", str_type_lodge);
		map.put("type_building", str_type_building);
		map.put("num_of_people", str_maxpeople);
		
		map.put("location", roadAddress);
		map.put("location_detail", detailAddress);
		map.put("lat", str_lat);
		map.put("lon", str_lng);
		
		map.put("num_of_bathroom", str_bathroomcount);
		map.put("num_of_bedroom", str_bedroomcount);
		map.put("num_of_bed", str_bedcount);
		
		map.put("checkin_hour", str_checkin_hour);
		map.put("checkin_min", str_checkin_min);
		map.put("checkout_hour", str_checkout_hour);
		map.put("checkout_min", str_checkout_min);
		
		map.put("room_price", str_roomprice);
		map.put("deposit_price", str_depositprice);
		map.put("clean_price", str_cleanprice);
		map.put("total_price", str_totalprice);
		
		if("on".equalsIgnoreCase(str_elevator)) {
			map.put("elevator", "1");
		}
		
		else {
			map.put("elevator", "0");
		}
		
		
		if("on".equalsIgnoreCase(str_wifi)) {
			map.put("wifi", "1");
		}
		
		else {
			map.put("wifi", "0");
		}
		
		
		if("on".equalsIgnoreCase(str_airconditioner)) {
			map.put("air_controller", "1");
		}
		
		else {
			map.put("air_controller", "0");
		}
		
		
		if("on".equalsIgnoreCase(str_heater)) {
			map.put("heating", "1");
		}
		
		else {
			map.put("heating", "0");
		}
		
		
		if("on".equalsIgnoreCase(str_washingmachin)) {
			map.put("washing_machine", "1");
		}
		
		else {
			map.put("washing_machine", "0");
		}
		
		
		if("on".equalsIgnoreCase(str_hairdry)) {
			map.put("hair_dryer", "1");
		}
		
		else {
			map.put("hair_dryer", "0");
		}
		
		
		if("on".equalsIgnoreCase(str_television)) {
			map.put("tv", "1");
		}
		
		else {
			map.put("tv", "0");
		}
		
		
		if("on".equalsIgnoreCase(str_essentialitem)) {
			map.put("essential_item", "1");
		}
		
		else {
			map.put("essential_item", "0");
		}
		
		map.put("rooms_explain", rooms_explain);
		map.put("refund_policy", refund_policy);
		map.put("rooms_rule", rooms_rule);
		
		map.put("safety_function", safety_function);
		map.put("local_information", local_information);
		
		// WAS 의 webapp 의 절대경로를 알아와야 한다. 
        session = req.getSession();
        String root = session.getServletContext().getRealPath("/"); 
        String path = root + "resources"+File.separator+"files";
        // path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다. 
        
        String newFileName = "";
        // WAS(톰캣) 디스크에 저장할 파일명 
        
        byte[] bytes = null;
        // 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도 
        
        long fileSize = 0;
        // 파일크기를 읽어오기 위한 용도
      
        MultipartFile mainimage = req.getFile("mainimage");
        HashMap<String, Object> mainmap = new HashMap<String, Object>();
      
        if(mainimage != null){
         
        	try {
	            bytes = mainimage.getBytes();
	            
	            newFileName = fileManager.doFileUpload(bytes, mainimage.getOriginalFilename(), path);
	            
	            fileSize = mainimage.getSize();
	            
	            mainmap.put("mainimagename", newFileName);
	            mainmap.put("mainimageFilename", mainimage.getOriginalFilename());
	            mainmap.put("mainimagefileSize", String.valueOf(fileSize));
	            
        	} catch (Exception e) {
        		// TODO: handle exception
        	}
        }

		map.put("mainimagename", newFileName);

		List<MultipartFile> attachList = req.getFiles("attach");
		List<HashMap<String, String>> mapProductimageList = new ArrayList<HashMap<String, String>>();

		/*
		 * ===== #135. 사용자가 쓴 글에 파일이 첨부가 된것인지 아니면 파일첨부가 안된것인지 구분을 지어주어야 한다.
		 * =====
		 */
		// **** 첨부파일이 있는지 없는지? ****
		if (attachList != null) {

			for (int i = 0; i < attachList.size(); i++) {
				try {
					bytes = attachList.get(i).getBytes();

					newFileName = fileManager.doFileUpload(bytes, attachList.get(i).getOriginalFilename(), path);

					fileSize = attachList.get(i).getSize();

					// === >>>> thumbnail 파일 생성을 위한 작업 <<<< ========= //

					// =================================================== //

					HashMap<String, String> mapProductimage = new HashMap<String, String>();

					mapProductimage.put("imagefilename", newFileName);
					mapProductimage.put("imageorgFilename", attachList.get(i).getOriginalFilename());
					mapProductimage.put("imagefileSize", String.valueOf(fileSize));

					mapProductimageList.add(mapProductimage);

				} catch (Exception e) {

				}

			} // end of for-------------------------

		} // end of if------------------------------

		int n = service.setRoom(map);

		// **** 폼에서 입력받은 제품입력정보 값을
		// Service 단으로 넘겨서 테이블에 insert 하기로 한다.

		// 이미지파일첨부가 없는 경우 또는 이미지파일첨부가 있는 경우로 나누어서
		// Service 단으로 호출하기
		int m = 0;
		int count = 0;

		for (int i = 0; i < mapProductimageList.size(); i++) {
			m = service.addFile(mapProductimageList.get(i));
			if (m == 1)
				count++;
		}

		if (mapProductimageList.size() == count) {
			n = 1;
		} else {
			n = 0;
		}
		
		if(n == 1) {
			HashMap<String, Object> hashmap = service.getLatelySeqLodge();
			req.setAttribute("seq_lodge", hashmap.get("SEQ_LODGE"));
		}
		
		req.setAttribute("n", n);

    	return "rooms/modifyEnd.tiles3";
	}
	
	
	
	
	// 페이징 처리
	@RequestMapping(value = "rooms/pagingMap.go", method = {RequestMethod.GET}, produces = "application/text; charset=utf8")
	@ResponseBody
	public String pagingMap(HttpServletRequest req, HttpServletResponse res) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String pagebar = "";
		
		String pageNo = req.getParameter("pageNo");
        
        int totalCount = 0;
        int sizePerPage = SIZE_PER_PAGE;
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
		
		String search_content = req.getParameter("search_content");
		String str_numOfPeople = req.getParameter("numOfPeople");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		
/*
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
		}*/

		String afterLat = req.getParameter("afterLat");
		String afterLon = req.getParameter("afterLon");
		
		map.put("search_content", search_content);
		map.put("numOfPeople", str_numOfPeople);
		
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("startDate", startDate);
		map2.put("endDate", endDate);
		
		String[] seq_lodgeArr = null;
		
		// 기간 내 예약하지 못하는 숙소 목록
		// TODO : 하나라도 입력 받지 못하면 전체 출력인데 jsp에서 미리 걸러내자
		if(startDate != null && endDate != null) {
			List<HashMap<String, Object>> seq_lodgeList = service.getUnavailableSeqLodgeList(map2);
			
			for(int i = 0; i < seq_lodgeList.size(); ++i) {
				if(i == 0) {
					seq_lodgeArr = new String[seq_lodgeList.size()];
				}
				
				String seq_lodge = seq_lodgeList.get(i).get("SEQ_LODGE").toString();
				seq_lodgeArr[i] = seq_lodge;
			}
		}
		
		map.put("seq_lodgeArr", seq_lodgeArr);
		
		if(afterLat == "" || afterLat == null) {
			
			totalCount = service.getAvailableRoomsCount(map);
			
			System.out.println("totalCount : " + totalCount);
			
			if(totalCount == 0) {
				totalPage = 0;
			}
			
			else {
				totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
			}
		    
		    if(totalPage != 0) {
		        pagebar += "<ul>";

		        loop = 1;
		        
		        startPageNo = ((currentShowPageNo - 1) / blocksize) * blocksize + 1;
		          
				if (startPageNo == 1) {
					pagebar += "";
				} else {
					pagebar += String.format(
							"&nbsp;&nbsp;<a href='#' onclick='showRoomsList(\"%s\", \"%s\", \"%s\", \"%s\", %d)'>[이전]</a>&nbsp;&nbsp;",
							search_content, str_numOfPeople, startDate, endDate, startPageNo - 1);
				}

				while (!(loop > blocksize || startPageNo > totalPage)) {

					if (startPageNo == currentShowPageNo) {
						pagebar += String.format(
								"&nbsp;&nbsp;<span style='color:red; font-weight:bold; text-decoration:underline;'>%d</span>&nbsp;&nbsp;",
								startPageNo);
					}
					else {
						pagebar += String.format(
								"&nbsp;&nbsp;<a href='#' onclick='showRoomsList(\"%s\", \"%s\", \"%s\", \"%s\", %d)'>%d</a>&nbsp;&nbsp;",
								search_content, str_numOfPeople, startDate, endDate, startPageNo, startPageNo);
					}

					loop++;
					startPageNo++;

				}

				if (startPageNo > totalPage) {
					pagebar += "";
				} else {
					pagebar += String.format(
								"&nbsp;&nbsp;<a href='#' onclick='showRoomsList(\"%s\", \"%s\", \"%s\", \"%s\", %d)'>[다음]</a>&nbsp;&nbsp;",
								search_content, str_numOfPeople, startDate, endDate, startPageNo);
				}

				pagebar += "</ul>";
		    }
		}
		
		else {
			// 거리(km)
			double distance = 5.0;

			// 위도, 경도
			map.put("afterLat", afterLat);
			map.put("afterLon", afterLon);
			map.put("distance", distance);
			
			
			System.out.println(search_content);
			System.out.println(str_numOfPeople);
			System.out.println(startDate);
			System.out.println(endDate);
	        
	        totalCount = service.getNearFromCenterRoomsCount(map);
	        
	        System.out.println("totalCount : " + totalCount);
	         
	        totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
	        
	        if(totalPage != 0) {
		        pagebar += "<ul>";
		
		        loop = 1;
		        
		        startPageNo = ((currentShowPageNo - 1) / blocksize) * blocksize + 1;
		          
				if (startPageNo == 1) {
					pagebar += "";
				} else {
					pagebar += String.format(
							"&nbsp;&nbsp;<a href='#' onclick='changedCenterViaLink(\"%s\", \"%s\", \"%s\", \"%s\", %d, %f, %f)'>[이전]</a>&nbsp;&nbsp;",
							search_content, str_numOfPeople, startDate, endDate, pageNo, startPageNo - 1, Double.parseDouble(afterLat), Double.parseDouble(afterLon));
				}
		
				while (!(loop > blocksize || startPageNo > totalPage)) {
		
					if (startPageNo == currentShowPageNo) {
						pagebar += String.format(
								"&nbsp;&nbsp;<span style='color:red; font-weight:bold; text-decoration:underline;'>%d</span>&nbsp;&nbsp;",
								startPageNo);
					}
					else {
						pagebar += String.format(
								"&nbsp;&nbsp;<a href='#' onclick='changedCenterViaLink(\"%s\", \"%s\", \"%s\", \"%s\", %d, %f, %f)'>%d</a>&nbsp;&nbsp;",
								search_content, str_numOfPeople, startDate, endDate, startPageNo, Double.parseDouble(afterLat), Double.parseDouble(afterLon), startPageNo);
					}
		
					loop++;
					startPageNo++;
		
				}
		
				if (startPageNo > totalPage) {
					pagebar += "";
				} else {
					pagebar += String.format(
								"&nbsp;&nbsp;<a href='#' onclick='changedCenterViaLink(\"%s\", \"%s\", \"%s\", \"%s\", %d, %f, %f)'>[다음]</a>&nbsp;&nbsp;",
								search_content, str_numOfPeople, startDate, endDate, startPageNo, Double.parseDouble(afterLat), Double.parseDouble(afterLon));
				}
		
				pagebar += "</ul>";
	        }
		}

		return pagebar;
	}
}
