package com.typeof.hajota;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.typeof.hajota.manager.service.ManagerService;

//===== 컨트롤러 선언 =====
@Controller
@Component

public class ManagerController {

	@Autowired
	private ManagerService service;

	
	// ---------------------------------------------------------------------------------------위는
	// 기본 페이지

    // ===== 게스트 목록을 보여주는 리스트 =====
    @RequestMapping(value="/guestManager.go", method={RequestMethod.GET})
    public String guest(HttpServletRequest req) {
    	    	
      String pageNo = req.getParameter("pageNo");
      
      int totalCount = 0;        // 총게시물 건수
      int sizePerPage = 8;      // 한 페이지당 보여줄 게시물 갯수 (예: 3, 5, 10) 
      int currentShowPageNo = 1; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
      int totalPage = 0;         // 총페이지수(웹브라우저상에 보여줄 총 페이지 갯수)
      
      int start = 0;             // 시작 행 번호
      int end = 0;               // 끝 행 번호
      int startPageNo = 0;       // 페이지바에서 시작될 페이지 번호 
      
      int loop = 0;       // startPageNo 값이 증가할때 마다 1씩 증가하는 용도.
      int blocksize = 10;  // "페이지바" 에 보여줄 페이지의 갯수 
      
      if(pageNo == null) {
    	  currentShowPageNo = 1;    	  
      }
      else {
    	  currentShowPageNo = Integer.parseInt(pageNo);
      }
      
      start = ((currentShowPageNo - 1) * sizePerPage) + 1;  
      end = start + sizePerPage - 1;		  
    	
      String colname = req.getParameter("colname");
      String search = req.getParameter("search");		      
    	
   //   System.out.println("colname : "+ colname);
      
      HashMap<String, String> map = new HashMap<String, String>();
      map.put("colname", colname);
      map.put("search", search);
    	
      map.put("start", String.valueOf(start) ); // 키값 start, 밸류값은 해쉬맵이 String 타입인데 start 는 int 타입이어서 String 타입으로 변경함. 
      map.put("end", String.valueOf(end) );     // 키값 end,   밸류값은 해쉬맵이 String 타입인데 end 는 int 타입이어서 String 타입으로 변경함. 
    	
      List<HashMap<String, Object>> guestList = service.ShowguestList(map);
    
   // System.out.println(guestList);   
      
      totalCount = service.getGuestCount(map); 
    	
      totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
    	
      String pagebar = "";
      pagebar += "<ul>";

      loop = 1;
        
      startPageNo = ((currentShowPageNo - 1)/blocksize)*blocksize + 1;
        
      // 이전 페이지
        if(startPageNo == 1) {
        	// 첫 페이지바에 도달한 경우
        	pagebar += "";
        }
        else {
        	// 첫 페이지바가 아닌 두번째 이상 페이지바에 온 경우
        	
        	if(colname == null || search == null) {
        		// 검색어가 없는 경우
        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/guestManager.go?pageNo=%d'>[이전페이지]</a>&nbsp;&nbsp;", startPageNo-1, blocksize); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
        	}
        	else{
        		// 검색어가 있는 경우
        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/guestManager.go?pageNo=%d&colname=%s&search=%s'>[이전페이지]</a>&nbsp;&nbsp;", startPageNo-1, colname, search, blocksize); // 검색어 있는 경우        		
        	}	
        }        
            	
        // **** 이전5페이지 와 다음5페이지 사이에 들어가는 것을 만드는 것
        while( !(loop > blocksize ||
        		 startPageNo > totalPage) ) {
        	
        	if(startPageNo == currentShowPageNo) {
        		pagebar += String.format("&nbsp;&nbsp;<span style='color:red; font-weight:bold; text-decoration:underline;'>%d</span>&nbsp;&nbsp;", startPageNo);	
        	}
        	else {
	        	if(colname == null || search == null) {
	        		// 검색어가 없는 경우
	        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/guestManager.go?pageNo=%d'>%d</a>&nbsp;&nbsp;", startPageNo, startPageNo); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
	        	}
	        	else{
	        		// 검색어가 있는 경우
	        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/guestManager.go?pageNo=%d&colname=%s&search=%s'>%d</a>&nbsp;&nbsp;", startPageNo, colname, search, startPageNo); // 검색어 있는 경우        		
	        	}
        	}
        	
        	loop++;
        	startPageNo++;
        	
        }// end of while--------------------
                
        // 다음 5페이지 만들기
        if(startPageNo > totalPage) {
        	// 마지막 페이지바에 도달한 경우
        	pagebar += "";
        }
        else {
        	// 마지막 페이지바가 아닌 경우
        	
        	if(colname == null || search == null) {
        		// 검색어가 없는 경우
        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/guestManager.go?pageNo=%d'>[다음%d페이지]</a>&nbsp;&nbsp;", startPageNo, blocksize); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
        	}
        	else{
        		// 검색어가 있는 경우
        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/guestManager.go?pageNo=%d&colname=%s&search=%s'>[다음%d페이지]</a>&nbsp;&nbsp;", startPageNo, colname, search, blocksize); // 검색어 있는 경우        		
        	}	
        }
         	        
        pagebar += "</ul>";
    	
        req.setAttribute("pagebar", pagebar);
        req.setAttribute("colname", colname);
        req.setAttribute("search", search);
        req.setAttribute("totalCount", totalCount);
    	req.setAttribute("guestList", guestList);

    	return "Manager/guest.tilesM";
    }
    

    // ===== 게스트 강제 탈퇴 시키기 =====
    @RequestMapping(value="/guestDelete.go", method={RequestMethod.POST})
    public String guestDelete(HttpServletRequest req) 
    	throws Throwable { 
    	
    	// 탈퇴시킬 게스트 이메일 가져오기
    	String email = req.getParameter("email");
    
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("email", email);
        	
    	int n = service.guestDelete(map);
    	// 넘겨받은 값이 1이면 게스트 탈퇴 성공,
    	// 넘겨받은 값이 0이면 게스트 탈퇴 실패.
    	
    	// n(게스트 탈퇴 성공 또는 실패)값을 request 영역에 저장시켜서 view 단 페이지로 넘긴다.
    	req.setAttribute("n", n);
    	
    	return "Manager/guestDelete.tilesM";
    	
    }  
    
	 // ===== 게스트 회원복구 시키기 =====
	    @RequestMapping(value="/guestRecover.go", method={RequestMethod.POST})
	    public String guestRecover(HttpServletRequest req) 
	    	throws Throwable { 
	    	
	    	// 복구시킬 게스트 이메일 가져오기
	    	String email = req.getParameter("email");
	    
	    	HashMap<String, String> map = new HashMap<String, String>();
	    	map.put("email", email);
	        	
	    	int n = service.guestRecover(map);
	    	// 넘겨받은 값이 1이면 게스트 복구 성공,
	    	// 넘겨받은 값이 0이면 게스트 복구 실패.
	    	
	    	// n(게스트 복구 성공 또는 실패)값을 request 영역에 저장시켜서 view 단 페이지로 넘긴다.
	    	req.setAttribute("n", n);
	    	
	    	return "Manager/guestRecover.tilesM";
	    	
	    }
 
	    // ===== 호스트 목록을 보여주는 리스트 =====
	    @RequestMapping(value="/hostManager.go", method={RequestMethod.GET})
	    public String host(HttpServletRequest req) {
	    	    	
	      String pageNo = req.getParameter("pageNo");
	      
	      int totalCount = 0;        // 총게시물 건수
	      int sizePerPage = 8;      // 한 페이지당 보여줄 게시물 갯수 (예: 3, 5, 10) 
	      int currentShowPageNo = 1; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
	      int totalPage = 0;         // 총페이지수(웹브라우저상에 보여줄 총 페이지 갯수)
	      
	      int start = 0;             // 시작 행 번호
	      int end = 0;               // 끝 행 번호
	      int startPageNo = 0;       // 페이지바에서 시작될 페이지 번호 
	      
	      int loop = 0;       // startPageNo 값이 증가할때 마다 1씩 증가하는 용도.
	      int blocksize = 10;  // "페이지바" 에 보여줄 페이지의 갯수 
	      
	      if(pageNo == null) {
	    	  currentShowPageNo = 1;    	  
	      }
	      else {
	    	  currentShowPageNo = Integer.parseInt(pageNo);
	      }
	      
	      start = ((currentShowPageNo - 1) * sizePerPage) + 1;  
	      end = start + sizePerPage - 1;		  
	    	
	      String colname = req.getParameter("colname");
	      String search = req.getParameter("search");		      
	    	
	    
	      HashMap<String, String> map = new HashMap<String, String>();
	      map.put("colname", colname);
	      map.put("search", search);
	    	
	      map.put("start", String.valueOf(start) ); // 키값 start, 밸류값은 해쉬맵이 String 타입인데 start 는 int 타입이어서 String 타입으로 변경함. 
	      map.put("end", String.valueOf(end) );     // 키값 end,   밸류값은 해쉬맵이 String 타입인데 end 는 int 타입이어서 String 타입으로 변경함. 
	    	
	      List<HashMap<String, Object>> hostList = service.ShowhostList(map);
	   
	      totalCount = service.gethostCount(map);
	    	
	      totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
	    	
	      String pagebar = "";
	      pagebar += "<ul>";

	      loop = 1;
	        
	      startPageNo = ((currentShowPageNo - 1)/blocksize)*blocksize + 1;
	        
	      // 이전 페이지
	        if(startPageNo == 1) {
	        	// 첫 페이지바에 도달한 경우
	        	pagebar += "";
	        }
	        else {
	        	// 첫 페이지바가 아닌 두번째 이상 페이지바에 온 경우
	        	
	        	if(colname == null || search == null) {
	        		// 검색어가 없는 경우
	        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/hostManager.go?pageNo=%d'>[이전페이지]</a>&nbsp;&nbsp;", startPageNo-1, blocksize); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
	        	}
	        	else{
	        		// 검색어가 있는 경우
	        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/hostManager.go?pageNo=%d&colname=%s&search=%s'>[이전페이지]</a>&nbsp;&nbsp;", startPageNo-1, colname, search, blocksize); // 검색어 있는 경우        		
	        	}	
	        }        
	            	
	        // **** 이전5페이지 와 다음5페이지 사이에 들어가는 것을 만드는 것
	        while( !(loop > blocksize ||
	        		 startPageNo > totalPage) ) {
	        	
	        	if(startPageNo == currentShowPageNo) {
	        		pagebar += String.format("&nbsp;&nbsp;<span style='color:red; font-weight:bold; text-decoration:underline;'>%d</span>&nbsp;&nbsp;", startPageNo);	
	        	}
	        	else {
		        	if(colname == null || search == null) {
		        		// 검색어가 없는 경우
		        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/hostManager.go?pageNo=%d'>%d</a>&nbsp;&nbsp;", startPageNo, startPageNo); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
		        	}
		        	else{
		        		// 검색어가 있는 경우
		        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/hostManager.go?pageNo=%d&colname=%s&search=%s'>%d</a>&nbsp;&nbsp;", startPageNo, colname, search, startPageNo); // 검색어 있는 경우        		
		        	}
	        	}
	        	
	        	loop++;
	        	startPageNo++;
	        	
	        }// end of while--------------------
	                
	        // 다음 5페이지 만들기
	        if(startPageNo > totalPage) {
	        	// 마지막 페이지바에 도달한 경우
	        	pagebar += "";
	        }
	        else {
	        	// 마지막 페이지바가 아닌 경우
	        	
	        	if(colname == null || search == null) {
	        		// 검색어가 없는 경우
	        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/hostManager.go?pageNo=%d'>[다음%d페이지]</a>&nbsp;&nbsp;", startPageNo, blocksize); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
	        	}
	        	else{
	        		// 검색어가 있는 경우
	        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/hostManager.go?pageNo=%d&colname=%s&search=%s'>[다음%d페이지]</a>&nbsp;&nbsp;", startPageNo, colname, search, blocksize); // 검색어 있는 경우        		
	        	}	
	        }
	         	        
	        pagebar += "</ul>";
	    	
	        req.setAttribute("pagebar", pagebar);
	        req.setAttribute("colname", colname);
	        req.setAttribute("search", search);
	        req.setAttribute("totalCount", totalCount);
	    	req.setAttribute("hostList", hostList);

	    	return "Manager/host.tilesM";
	    }
	    

	    // ===== 호스트 강제 탈퇴 시키기 =====
	    @RequestMapping(value="/hostDelete.go", method={RequestMethod.POST})
	    public String hostDelete(HttpServletRequest req) 
	    	throws Throwable { 
	    	
	    	// 탈퇴시킬 호스트 이메일 가져오기
	    	String email = req.getParameter("email");
	    
	    	HashMap<String, String> map = new HashMap<String, String>();
	    	map.put("email", email);
	        	
	    	int n = service.hostDelete(map);
	    	// 넘겨받은 값이 1이면 호스트 탈퇴 성공,
	    	// 넘겨받은 값이 0이면 호스트 탈퇴 실패.
	    	
	    	// n(호스트 탈퇴 성공 또는 실패)값을 request 영역에 저장시켜서 view 단 페이지로 넘긴다.
	    	req.setAttribute("n", n);
	    	
	    	return "Manager/hostDelete.tilesM";
	    	
	    }  
	    
		 // ===== 호스트 회원복구시키기 =====
		    @RequestMapping(value="/hostRecover.go", method={RequestMethod.POST})
		    public String hostRecover(HttpServletRequest req) 
		    	throws Throwable { 
		    	
		    	// 복구시킬 호스트 이메일 가져오기
		    	String email = req.getParameter("email");
		    
		    	HashMap<String, String> map = new HashMap<String, String>();
		    	map.put("email", email);
		        	
		    	int n = service.hostRecover(map);
		    	// 넘겨받은 값이 1이면 호스트 복구 성공,
		    	// 넘겨받은 값이 0이면 호스트 복구 실패.
		    	
		    	// n(호스트 복구 성공 또는 실패)값을 request 영역에 저장시켜서 view 단 페이지로 넘긴다.
		    	req.setAttribute("n", n);
		    	
		    	return "Manager/hostRecover.tilesM";
		    	
		    }
		    
		  // ======= 관리자 이벤트 페이지 =======		 
	    @RequestMapping(value="/eventManager.go", method={RequestMethod.GET})
	    public String eventManager(HttpServletRequest req) {
	    	    	
	      String pageNo = req.getParameter("pageNo");
	      
	      int totalCount = 0;        // 총게시물 건수
	      int sizePerPage = 5;       // 한 페이지당 보여줄 게시물 갯수 (예: 3, 5, 10) 
	      int currentShowPageNo = 1; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
	      int totalPage = 0;         // 총페이지수(웹브라우저상에 보여줄 총 페이지 갯수)
	      
	      int start = 0;             // 시작 행 번호
	      int end = 0;               // 끝 행 번호
	      int startPageNo = 0;       // 페이지바에서 시작될 페이지 번호 
	      
	      int loop = 0;          // startPageNo 값이 증가할때 마다 1씩 증가하는 용도.
	      int blocksize = 10;    // "페이지바" 에 보여줄 페이지의 갯수 
	      
	      if(pageNo == null) {
	    	  currentShowPageNo = 1;    	  
	      }
	      else {
	    	  currentShowPageNo = Integer.parseInt(pageNo);
	      }
	      
	      start = ((currentShowPageNo - 1) * sizePerPage) + 1;  
	      end = start + sizePerPage - 1;		  
	    	
	      String colname = req.getParameter("colname");
	      String search = req.getParameter("search");		      
	    
	      HashMap<String, String> map = new HashMap<String, String>();
	      map.put("colname", colname);
	      map.put("search", search);
	    	
	      map.put("start", String.valueOf(start) );  // 키값 start, 밸류값은 해쉬맵이 String 타입인데 start 는 int 타입이어서 String 타입으로 변경함. 
	      map.put("end", String.valueOf(end) );      // 키값 end,   밸류값은 해쉬맵이 String 타입인데 end 는 int 타입이어서 String 타입으로 변경함. 
	    	
	      List<HashMap<String, Object>> couponList = service.ShoweventList(map);
	      
	      totalCount = service.getEventCount(map);
	    	
	      totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
	    	
	      String pagebar = "";
	      pagebar += "<ul>";

	      loop = 1;
	        
	      startPageNo = ((currentShowPageNo - 1)/blocksize)*blocksize + 1;
	        
	      // 이전 페이지
	        if(startPageNo == 1) {
	        	// 첫 페이지바에 도달한 경우
	        	pagebar += "";
	        }
	        else {
	        	// 첫 페이지바가 아닌 두번째 이상 페이지바에 온 경우
	        	
	        	if(colname == null || search == null) {
	        		// 검색어가 없는 경우
	        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/eventManager.go?pageNo=%d'>[이전페이지]</a>&nbsp;&nbsp;", startPageNo-1, blocksize); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
	        	}
	        	else{
	        		// 검색어가 있는 경우
	        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/eventManager.go?pageNo=%d&colname=%s&search=%s'>[이전페이지]</a>&nbsp;&nbsp;", startPageNo-1, colname, search, blocksize); // 검색어 있는 경우        		
	        	}	
	        }        
	            	
	        // **** 이전5페이지 와 다음5페이지 사이에 들어가는 것을 만드는 것
	        while( !(loop > blocksize ||
	        		 startPageNo > totalPage) ) {
	        	
	        	if(startPageNo == currentShowPageNo) {
	        		pagebar += String.format("&nbsp;&nbsp;<span style='color:red; font-weight:bold; text-decoration:underline;'>%d</span>&nbsp;&nbsp;", startPageNo);	
	        	}
	        	else {
		        	if(colname == null || search == null) {
		        		// 검색어가 없는 경우
		        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/eventManager.go?pageNo=%d'>%d</a>&nbsp;&nbsp;", startPageNo, startPageNo); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
		        	}
		        	else{
		        		// 검색어가 있는 경우
		        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/eventManager.go?pageNo=%d&colname=%s&search=%s'>%d</a>&nbsp;&nbsp;", startPageNo, colname, search, startPageNo); // 검색어 있는 경우        		
		        	}
	        	}
	        	
	        	loop++;
	        	startPageNo++;
	        	
	        }// end of while--------------------
	                
	        // 다음 5페이지 만들기
	        if(startPageNo > totalPage) {
	        	// 마지막 페이지바에 도달한 경우
	        	pagebar += "";
	        }
	        else {
	        	// 마지막 페이지바가 아닌 경우
	        	
	        	if(colname == null || search == null) {
	        		// 검색어가 없는 경우
	        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/eventManager.go?pageNo=%d'>[다음%d페이지]</a>&nbsp;&nbsp;", startPageNo, blocksize); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
	        	}
	        	else{
	        		// 검색어가 있는 경우
	        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/eventManager.go?pageNo=%d&colname=%s&search=%s'>[다음%d페이지]</a>&nbsp;&nbsp;", startPageNo, colname, search, blocksize); // 검색어 있는 경우        		
	        	}	
	        }
	         	        
	        pagebar += "</ul>";
	    	
	        // ===== 이벤트게임 사용현황 가져오기 =====
	        List<HashMap<String, Object>> eventGame = service.ShoweventGame(map);
	        

			// ===== 오늘 생일인 회원리스트 뽑아오기 =====
	        List<HashMap<String, Object>> birthUserList = service.ShowbirthUserList(map); 
	        
	        req.setAttribute("pagebar", pagebar);
	        req.setAttribute("colname", colname);
	        req.setAttribute("search", search);
	        req.setAttribute("totalCount", totalCount);
	    	req.setAttribute("couponList", couponList);
	    	req.setAttribute("eventGame", eventGame);
	    	req.setAttribute("birthUserList", birthUserList);

	    	return "Manager/event.tilesM";
	    }
	    
	 // ===== 이벤트게임 정지시키기 =====
	    @RequestMapping(value="/eventDelete.go", method={RequestMethod.POST})
	    public String eventDelete(HttpServletRequest req) 
	    	throws Throwable { 
	    	
	    	// 정지시킬 게임 seq 가져오기
	    	String seq_event = req.getParameter("seq_event");
	    
	    	HashMap<String, String> map = new HashMap<String, String>();
	    	map.put("seq_event", seq_event);
	        	
	    	int n = service.eventDelete(map);
	    	// 넘겨받은 값이 1이면 게임정지 성공,
	    	// 넘겨받은 값이 0이면 게임정지 실패.
	    		    	
	    	req.setAttribute("n", n);
	    	
	    	return "Manager/eventDelete.tilesM";
	    	
	    }  
	    
	 // ===== 이벤트게임 재실행하기 =====
	    @RequestMapping(value="/eventRecover.go", method={RequestMethod.POST})
	    public String eventRecover(HttpServletRequest req) 
	    	throws Throwable { 
	    	
	    	// 복구시킬 게임 seq 가져오기
	    	String seq_event = req.getParameter("seq_event");
	    
	    	HashMap<String, String> map = new HashMap<String, String>();
	    	map.put("seq_event", seq_event);
	        	
	    	int n = service.eventRecover(map);
	    	// 넘겨받은 값이 1이면 게임 복구 성공,
	    	// 넘겨받은 값이 0이면 게임 복구 실패.
	
	    	req.setAttribute("n", n);
	    	
	    	return "Manager/eventRecover.tilesM";
	    	
	    }

	    // ===== 쿠폰받기 페이지 =====
		@RequestMapping(value="/coupon.go")
		public String coupon(HttpServletRequest req, HttpSession session) 
    	{ 			
			@SuppressWarnings("unchecked")
			HashMap<String, Object> loginuser = (HashMap<String, Object>)session.getAttribute("loginuser");
	        String email = (String)loginuser.get("EMAIL");
	    
	    	HashMap<String, String> map = new HashMap<String, String>();
	    	map.put("email", email);	        
			
			// 돌려돌려돌림판 사용가능현황 가져오기
	        int dolGame = service.ShowdolGame(map);
	        
	        // 돌려돌려돌림판 참여이력
	        int dolWanrle = service.dolWanrle(map);
	        
	        // 사다리게임 사용가능현황 가져오기
	        int sadaliGame = service.ShowsadaliGame(map);
	        
	        // 사다리게임 참여이력
	        int sadaliWanrle = service.sadaliWanrle(map);
	        
	        req.setAttribute("dolGame", dolGame);
	        req.setAttribute("sadaliGame", sadaliGame);
	        req.setAttribute("dolWanrle", dolWanrle);
	        req.setAttribute("sadaliWanrle", sadaliWanrle);
	        
			return "coupon.tiles2";
		}
		
		
		// ===== 생일인 사람 쿠폰 이메일 발송하기 =====
	    @RequestMapping(value="/birthEmail.go", method={RequestMethod.GET, RequestMethod.POST})
	      public String birthEmail(HttpServletRequest req) {
	       
	       String method = req.getMethod();
	       
	       if("POST".equalsIgnoreCase(method)) {   // 발송하기 버튼을 눌렀을때만 실행!!

	          String email = req.getParameter("email");

	          HashMap<String, String> map = new HashMap<String, String>();
	          map.put("email", email);

	          int n = service.getbirthUsercount(map); // 생일인 유저가 있는지 확인하기
	          
	          if (n == 1) { // 이메일이 존재하면

	             // ***** 인증메일 발송 ******
	             GoogleMail mail = new GoogleMail();

	             try {	                
	              /*  mail.sendmailbirth(email);*/
	                 req.setAttribute("email", email);
	             } catch (Exception e) {
	                e.printStackTrace();

	                n = -1;
	                req.setAttribute("n", n);
	                req.setAttribute("sendFailmsg", "메일발송을 실패했습니다.");

	             } // end of try ~ catch---------------------

	          } else { // 이메일이 존재하지 않으면
	             n = 0;
	          }
	          
	          req.setAttribute("n", n);
	          
	       }
	      
	       return "Manager/birthEmail.tilesM";
	    }
		
	    
	 // ===== 돌려돌려판 쿠폰받기 =====
	    @RequestMapping(value="/getCoupon.go", method={RequestMethod.POST})
	    public String getCoupon(HttpServletRequest req, HttpSession session) 
	    	throws Throwable { 
	    	
	    	// 게임에 참여해서 얻은 퍼센트 가져오기
	    	String percent = req.getParameter("percent");
	   	    	
	    	// 게임에 참여한 게스트 이메일 가져오기
	    	@SuppressWarnings("unchecked")
			HashMap<String, Object> loginuser = (HashMap<String, Object>)session.getAttribute("loginuser");
	        String email = (String)loginuser.get("EMAIL");
	    
	    	HashMap<String, String> map = new HashMap<String, String>();
	    	map.put("email", email);
	    	map.put("percent", percent);
	        
	    	// 게임에 참여했던 기록 남기기
	    	int a = service.InsertDolGame(map);
	    	
	    	// 게임에 참여하면 실행횟수 증가 시키기
	        int b = service.plusDolGame(map);
	    		    	
	    	int n = service.getCoupon(map);
	    	// 넘겨받은 값이 1이면 쿠폰등록 성공,
	    	// 넘겨받은 값이 0이면 쿠폰등록 실패.
	    	
	    	req.setAttribute("n", n);
	    	
	    	return "getCoupon.tiles2";
	    	
	    }

	    

}



