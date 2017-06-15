package com.typeof.hajota;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.typeof.hajota.manager.service.SH_ManagerService;

//===== #32. 컨트롤러 선언 =====
@Controller
@Component
/*
 * XML 에서 빈을 만드는 대신에 클래스명 앞에
 * 
 * @Component 어노테이션을 적어주면 해당 클래스는 bean 으로 자동 등록된다. 그리고 bean의 이름(첫글자는 소문자)은 해당
 * 클래스명이 된다.
 */
public class SH_ManagerController {

	// ===== #33. 의존객체 주입하기(DI : Dependency Injection) =====

	@Autowired
	private SH_ManagerService service;

	@RequestMapping(value = "/indexManager.go")
	public String index() {

		return "Manager/index.tilesM";
	}

	@RequestMapping(value = "/guestManager.go")
	public String guest() {

		return "Manager/guest.tilesM";
	}

	@RequestMapping(value = "/hostManager.go")
	public String host() {

		return "Manager/host.tilesM";
	}

	@RequestMapping(value = "/eventManager.go")
	public String event() {

		return "Manager/event.tilesM";
	}

	@RequestMapping(value = "/sumManager.go")
	public String sum() {

		return "Manager/sum.tilesM";
	}

	@RequestMapping(value = "/qnaManager.go")
	public String qna() {

		return "Manager/qna.tilesM";
	}

	@RequestMapping(value = "/callManager.go")
	public String call() {

		return "Manager/call.tilesM";
	}

	@RequestMapping(value = "/noticeManager.go")
	public String notice() {

		return "Manager/notice.tilesM";
	}

	
	// ---------------------------------------------------------------------------------------위는
	// 기본 페이지

	// 관리자가 공지사항에 글쓴 것을 보여주는 메소드
	@RequestMapping(value="/noticeManager.go", method={RequestMethod.GET})
    public String notice(HttpServletRequest req) {
    	    	
    	      String pageNo = req.getParameter("pageNo");
    	      
    	      int totalCount = 0;        // 총게시물 건수
    	      int sizePerPage = 10;      // 한 페이지당 보여줄 게시물 갯수 (예: 3, 5, 10) 
    	      int currentShowPageNo = 1; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
    	      int totalPage = 0;         // 총페이지수(웹브라우저상에 보여줄 총 페이지 갯수)
    	      
    	      int start = 0;             // 시작 행 번호
    	      int end = 0;               // 끝 행 번호
    	      int startPageNo = 0;       // 페이지바에서 시작될 페이지 번호 
    	      
    	      int loop = 0;       // startPageNo 값이 증가할때 마다 1씩 증가하는 용도.
    	      int blocksize = 5;  // "페이지바" 에 보여줄 페이지의 갯수 
    	      
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
		    	
		      List<HashMap<String, Object>> noticeList = service.Shownotice(map);
		    
    	      totalCount = service.getTotalCount(map);
    	    	
    	      totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
    	    	
    	      String pagebar = "";
    	      pagebar += "<ul>";

    	      loop = 1;
    	        
    	      startPageNo = ((currentShowPageNo - 1)/blocksize)*blocksize + 1;
    	        
    	      // 이전 5페이지
    	        if(startPageNo == 1) {
    	        	// 첫 페이지바에 도달한 경우
    	        	pagebar += "";
    	        }
    	        else {
    	        	// 첫 페이지바가 아닌 두번째 이상 페이지바에 온 경우
    	        	
    	        	if(colname == null || search == null) {
    	        		// 검색어가 없는 경우
    	        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/noticeManager.go?pageNo=%d'>[이전%d페이지]</a>&nbsp;&nbsp;", startPageNo-1, blocksize); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
    	        	}
    	        	else{
    	        		// 검색어가 있는 경우
    	        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/noticeManager.go?pageNo=%d&colname=%s&search=%s'>[이전%d페이지]</a>&nbsp;&nbsp;", startPageNo-1, colname, search, blocksize); // 검색어 있는 경우        		
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
    		        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/noticeManager.go?pageNo=%d'>%d</a>&nbsp;&nbsp;", startPageNo, startPageNo); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
    		        	}
    		        	else{
    		        		// 검색어가 있는 경우
    		        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/noticeManager.go?pageNo=%d&colname=%s&search=%s'>%d</a>&nbsp;&nbsp;", startPageNo, colname, search, startPageNo); // 검색어 있는 경우        		
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
    	        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/noticeManager.go?pageNo=%d'>[다음%d페이지]</a>&nbsp;&nbsp;", startPageNo, blocksize); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
    	        	}
    	        	else{
    	        		// 검색어가 있는 경우
    	        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/noticeManager.go?pageNo=%d&colname=%s&search=%s'>[다음%d페이지]</a>&nbsp;&nbsp;", startPageNo, colname, search, blocksize); // 검색어 있는 경우        		
    	        	}	
    	        }
    	         	        
    	        pagebar += "</ul>";
    	    	
    	        req.setAttribute("pagebar", pagebar);
    	        req.setAttribute("colname", colname);
    	        req.setAttribute("search", search);
    	        
    	    	req.setAttribute("noticeList", noticeList);

    	    	return "Manager/notice.tilesM";
    	    	// /Board/src/main/webapp/WEB-INF/views2/board/list.jsp 파일을 생성한다.
    }
	
	// ===== 글쓰기 폼페이지 =====
	@RequestMapping(value="/noticewriteManager.go", method={RequestMethod.GET})
    public String noticewrite(HttpServletRequest req) {
    	   	
    	return "Manager/noticewrite.tilesM";
    }
	// ===== 글쓰기 완료 요청 =====
    @RequestMapping(value="/noticewriteEndManager.go", method={RequestMethod.POST}) 
    public String addEnd(HttpServletRequest req) {
    	
    	String admin_id  = req.getParameter("admin_id"); 
    	String subject = req.getParameter("subject");
    	String content = req.getParameter("content");
    	
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("admin_id", admin_id);
    	map.put("subject", subject);
    	map.put("content", content);
    	
    	int n = 0;
    	
    	n = service.noticewrite(map);

    	req.setAttribute("n", n);
    	
    	return "Manager/noticewriteEnd.tilesM";
    	// /Board/src/main/webapp/WEB-INF/views2/board/addEnd.jsp 파일을 생성한다.
    }
    
 // ===== 글 삭제 페이지 =====
    @RequestMapping(value="/delete.go", method={RequestMethod.POST})
    public String delete(HttpServletRequest req) { 
    	
    	String seq_notice = req.getParameter("seq_notice");
   
    	/*
    	if(!manager_id.equals(admin_id)) { 
    		String msg = "다른 사용자의 글은 삭제가 불가합니다.";
    		String loc = "javascript:history.back()";
    		
    		req.setAttribute("msg", msg);
    		req.setAttribute("loc", loc);
    		
    		return "msg.notiles";
    	}
    	else {
    	*/
    		req.setAttribute("seq_notice", seq_notice);
    		
    		HashMap<String, String> map = new HashMap<String, String>();
        	map.put("seq_notice", seq_notice);
        		
        	int n = service.delete(map);

        	req.setAttribute("n", n);
        	
        	return "Manager/deleteEnd.tiles2";
    		
    	
    	
    } 
    
}



