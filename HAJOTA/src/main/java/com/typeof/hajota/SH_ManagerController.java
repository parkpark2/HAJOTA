package com.typeof.hajota;

import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.typeof.hajota.manager.service.SH_ManagerService;


@Controller
@Component

public class SH_ManagerController {


	@Autowired
	private SH_ManagerService service;

	@RequestMapping(value = "/callManager.go")
	public String call() {

		return "Manager/call.tilesM";
	}
	
	// ===== 공지사항 =====
	@RequestMapping(value="/noticeManager.go", method={RequestMethod.GET})
    public String notice(HttpServletRequest req) {
    	    	
      String pageNo = req.getParameter("pageNo");
      
      int totalCount = 0;        
      int sizePerPage = 10;      
      int currentShowPageNo = 1; 
      int totalPage = 0;     
      
      int start = 0;           
      int end = 0;              
      int startPageNo = 0;       
      
      int loop = 0;      
      int blocksize = 5;  
      
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
    	
      map.put("start", String.valueOf(start) ); 
      map.put("end", String.valueOf(end) );     
      
      List<HashMap<String, Object>> noticeList = service.Shownotice(map);
    
      totalCount = service.getTotalCount(map);
    	
      totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
    	
      String pagebar = "";
      pagebar += "<ul>";

      loop = 1;
        
      startPageNo = ((currentShowPageNo - 1)/blocksize)*blocksize + 1;
        
   
        if(startPageNo == 1) {
        	
        	pagebar += "";
        }
        else {
        	
        	
        	if(colname == null || search == null) {
        		
        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/noticeManager.go?pageNo=%d'>[이전페이지]</a>&nbsp;&nbsp;", startPageNo-1, blocksize); 		
        	}
        	else{
        		
        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/noticeManager.go?pageNo=%d&colname=%s&search=%s'>[다음페이지]</a>&nbsp;&nbsp;", startPageNo-1, colname, search, blocksize);       		
        	}	
        }        
            	
        
        while( !(loop > blocksize ||
        		 startPageNo > totalPage) ) {
        	
        	if(startPageNo == currentShowPageNo) {
        		pagebar += String.format("&nbsp;&nbsp;<span style='color:red; font-weight:bold; text-decoration:underline;'>%d</span>&nbsp;&nbsp;", startPageNo);	
        	}
        	else {
	        	if(colname == null || search == null) {
	        		
	        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/noticeManager.go?pageNo=%d'>%d</a>&nbsp;&nbsp;", startPageNo, startPageNo); 	
	        	}
	        	else{
	        		
	        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/noticeManager.go?pageNo=%d&colname=%s&search=%s'>%d</a>&nbsp;&nbsp;", startPageNo, colname, search, startPageNo);       		
	        	}
        	}
        	
        	loop++;
        	startPageNo++;
        	
        }// end of while--------------------
                
        
        if(startPageNo > totalPage) {
        	
        	pagebar += "";
        }
        else {
        	
        	
        	if(colname == null || search == null) {
        		
        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/noticeManager.go?pageNo=%d'>[�떎�쓬%d�럹�씠吏�]</a>&nbsp;&nbsp;", startPageNo, blocksize); 	
        	}
        	else{
        		
        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/noticeManager.go?pageNo=%d&colname=%s&search=%s'>[�떎�쓬%d�럹�씠吏�]</a>&nbsp;&nbsp;", startPageNo, colname, search, blocksize);      		
        	}	
        }
         	        
        pagebar += "</ul>";
    	
        req.setAttribute("pagebar", pagebar);
        req.setAttribute("colname", colname);
        req.setAttribute("search", search);
        
    	req.setAttribute("noticeList", noticeList);

    	return "Manager/notice.tilesM";
    	// /Board/src/main/webapp/WEB-INF/views2/board/list.jsp �뙆�씪�쓣 �깮�꽦�븳�떎.
    }
	
	// ===== 공지사항 글쓰기 =====
	@RequestMapping(value="/noticewriteManager.go", method={RequestMethod.GET})
    public String noticewrite(HttpServletRequest req) {
    	 
		
    	return "Manager/noticewrite.tilesM";
    }
	
	// ===== 공지사항 글쓰기 END =====
    @RequestMapping(value="/noticewriteEndManager.go", method={RequestMethod.POST}) 
    public String addEnd(HttpServletRequest req) {
    	
    	String email = service.getEmail();
    	
		req.setAttribute("email", email);
		
    	String subject = req.getParameter("subject");
    	String content = req.getParameter("content");
    	
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("email", email);
    	map.put("subject", subject);
    	map.put("content", content);
    	
    	int n = 0;
    	
    	n = service.noticewrite(map);

    	req.setAttribute("n", n);
    	
    	return "Manager/noticewriteEnd.tilesM";
    }
    
 // ===== 공지사항 삭제 =====
    @RequestMapping(value="/delete.go", method={RequestMethod.POST})
    public String delete(HttpServletRequest req) { 
    	
    	String seq_notice = req.getParameter("seq_notice");
   
    		req.setAttribute("seq_notice", seq_notice);
    		
    		HashMap<String, String> map = new HashMap<String, String>();
        	map.put("seq_notice", seq_notice);
        		
        	int n = service.delete(map);

        	req.setAttribute("n", n);
        	
        	return "Manager/deleteEnd.tilesM";
    		
    } 
    
    // ===== 공지사항 디테일 =====
    @RequestMapping(value="/noticedetail.go", method={RequestMethod.GET})
    public String detail(HttpServletRequest req) { 
    	
	    	String content = req.getParameter("content");
	    	String subject = req.getParameter("subject");
	    	String seq_notice = req.getParameter("seq");
    	
    		HashMap<String, String> map = new HashMap<String, String>();
        	map.put("content", content);
        	map.put("subject", subject);
        	map.put("seq_notice", seq_notice);
        	
        	HashMap<String, Object> n = service.detailShow(map);

        	req.setAttribute("n", n);
        	
        	return "Manager/noticedetailEnd.tilesM";
    		
    } 
    
    // ===== 공지사항 수정 =====
    @RequestMapping(value="/noticechangeManager.go", method={RequestMethod.POST})
    public String change(HttpServletRequest req) { 
    	
	    	String content = req.getParameter("content");
	    	String subject = req.getParameter("subject");
	    	String seq_notice = req.getParameter("seq_notice");
    	
    		HashMap<String, String> map = new HashMap<String, String>();
        	map.put("content", content);
        	map.put("subject", subject);
        	map.put("seq_notice", seq_notice);
        	
        	int n = service.noticeChange(map);

        	req.setAttribute("n", n);
        	
        	return "Manager/noticechangeEnd.tilesM";
    		
    }
    
 // qna 전체보기
	@RequestMapping(value = "/qnaManager.go", method={RequestMethod.GET})
      public String allqna(HttpServletRequest req) {
      	    	     
  		  String pageNo = req.getParameter("pageNo");
	      
	      int totalguestqnaCount = 0;    
	      int sizePerPage = 10;    
	      int currentShowPageNo = 1;
	      int totalPage = 0;        
	      
	      int start = 0;         
	      int end = 0;             
	      int startPageNo = 0;      
	      
	      int loop = 0;       
	      int blocksize = 5;  
	      
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
	    	
	      map.put("start", String.valueOf(start) ); 
	      map.put("end", String.valueOf(end) );  
	    
	   
	      List<HashMap<String, Object>> allqnaList = service.Showallqna(map);
	      
	      totalguestqnaCount = service.getTotalqnaCount(map);
	      
	      totalPage = (int)Math.ceil((double)totalguestqnaCount/sizePerPage);
	    	
	      String pagebar = "";
	      pagebar += "<ul>";

	      loop = 1;
	        
	      startPageNo = ((currentShowPageNo - 1)/blocksize)*blocksize + 1;
	        
	    
	        if(startPageNo == 1) {
	        	
	        	pagebar += "";
	        }
	        else {
	        
	        	
	        	if(colname == null || search == null) {
	        		
	        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/qnaManager.go?pageNo=%d'>[�씠�쟾%d�럹�씠吏�]</a>&nbsp;&nbsp;", startPageNo-1, blocksize); // 泥섏쓬 %d �뿉�뒗 startPageNo媛� , �몢踰덉㎏ %d �뿉�뒗 �럹�씠吏�諛붿뿉 �굹���궪 startPageNo媛� �씠�떎.		
	        	}
	        	else{
	        	
	        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/qnaManager.go?pageNo=%d&colname=%s&search=%s'>[�씠�쟾%d�럹�씠吏�]</a>&nbsp;&nbsp;", startPageNo-1, colname, search, blocksize); // 寃��깋�뼱 �엳�뒗 寃쎌슦        		
	        	}	
	        }        
	            	
	        
	        while( !(loop > blocksize ||
	        		 startPageNo > totalPage) ) {
	        	
	        	if(startPageNo == currentShowPageNo) {
	        		pagebar += String.format("&nbsp;&nbsp;<span style='color:red; font-weight:bold; text-decoration:underline;'>%d</span>&nbsp;&nbsp;", startPageNo);	
	        	}
	        	else {
		        	if(colname == null || search == null) {
		        	
		        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/qnaManager.go?pageNo=%d'>%d</a>&nbsp;&nbsp;", startPageNo, startPageNo); // 泥섏쓬 %d �뿉�뒗 startPageNo媛� , �몢踰덉㎏ %d �뿉�뒗 �럹�씠吏�諛붿뿉 �굹���궪 startPageNo媛� �씠�떎.		
		        	}
		        	else{
		        		
		        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/qnaManager.go?pageNo=%d&colname=%s&search=%s'>%d</a>&nbsp;&nbsp;", startPageNo, colname, search, startPageNo); // 寃��깋�뼱 �엳�뒗 寃쎌슦        		
		        	}
	        	}
	        	
	        	loop++;
	        	startPageNo++;
	        	
	        }// end of while--------------------
	                
	       
	        if(startPageNo > totalPage) {
	        	
	        	pagebar += "";
	        }
	        else {
	     
	        	
	        	if(colname == null || search == null) {
	        		
	        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/qnaManager.go?pageNo=%d'>[�떎�쓬%d�럹�씠吏�]</a>&nbsp;&nbsp;", startPageNo, blocksize); // 泥섏쓬 %d �뿉�뒗 startPageNo媛� , �몢踰덉㎏ %d �뿉�뒗 �럹�씠吏�諛붿뿉 �굹���궪 startPageNo媛� �씠�떎.		
	        	}
	        	else{
	        	
	        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/qnaManager.go?pageNo=%d&colname=%s&search=%s'>[�떎�쓬%d�럹�씠吏�]</a>&nbsp;&nbsp;", startPageNo, colname, search, blocksize); // 寃��깋�뼱 �엳�뒗 寃쎌슦        		
	        	}	
	        }
	         	        
	        pagebar += "</ul>";	      
	    	  
	        req.setAttribute("pagebar", pagebar);
	        req.setAttribute("colname", colname);
	        req.setAttribute("search", search);
      	        
      	    req.setAttribute("allqnaList", allqnaList);

      	    return "Manager/qna.tilesM";

      }
    
 // ===== qna delete =====
    @RequestMapping(value="/qnadelete.go", method={RequestMethod.POST})
    public String qnadelete(HttpServletRequest req) { 
    	
    	String seq_question = req.getParameter("seq_question");
    		
		HashMap<String, String> map = new HashMap<String, String>();
    	map.put("seq_question", seq_question);
    		
    	int n = service.guestqnadelete(map);
    	
    	if(n==0) {
    		n = service.hostqnadelete(map);	
    	}
    	
    	req.setAttribute("n", n);
    	
    	return "Manager/qnadeleteEnd.tilesM";
		
    } 
    
    // ===== qna detail =====
    @RequestMapping(value="/qnadetail.go", method={RequestMethod.GET})
    public String qnadetail(HttpServletRequest req) { 
    		
    		String seq_question = req.getParameter("seq");
    		
    		HashMap<String, String> map = new HashMap<String, String>();
    		
			if(seq_question != null || !"".equals(seq_question)) {
	    		map.put("seq_question", seq_question);
	    	
	    		service.changeStatus(map);
			}
    		String email = req.getParameter("email");
	    	String content = req.getParameter("content");
	    	String subject = req.getParameter("subject");
	    	
    		map.put("content", content);
        	map.put("subject", subject);
        	map.put("email", email);
      	
        	HashMap<String, Object> n = service.qnadetailShow(map);
        	
        	HashMap<String, Object> m = null;
        	
        	if("1".equals(n.get("REPLYSTATUS").toString())) {
        		m = service.answerdetailShow(map);
        	}

        	req.setAttribute("n", n);
        	req.setAttribute("m", m);
        	
        	return "Manager/qnadetailEnd.tilesM";
    		
    } 
    
 // ===== qna 게스트 보기 =====
    @RequestMapping(value="/qnaguestManager.go", method={RequestMethod.GET})
    public String qnaguest(HttpServletRequest req) { 
    	
    	String seq_question = req.getParameter("seq_question");
    	String colname = req.getParameter("colname");
	    String search = req.getParameter("search");	
	    String pageNo = req.getParameter("pageNo");
	    String email = req.getParameter("email");
    	
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("seq_question", seq_question);
		map.put("colname", colname);
		map.put("search", search);	
		map.put("email", email);
						
        int currentShowPageNo = 1;
        
        if(pageNo == null) {
    	  currentShowPageNo = 1;    	  
        }
        else {
    	  currentShowPageNo = Integer.parseInt(pageNo);
        }
    	
    	int sizePerPage = 10;     
    	int start = 0;
    	int offset = 0;
    	int totalqnaCount = 0;
    	int loop = 0;      
	    int blocksize = 5;
	    int totalPage = 0;
	    int startPageNo = 0;
    	
    	start = (currentShowPageNo - 1) * sizePerPage;
    	offset = sizePerPage;
    	
    	RowBounds rowBounds = new RowBounds(start, offset);
    	
    	List<HashMap<String, Object>> qnaguestlist = service.Showguestqna(map, rowBounds);
    	
    	///////////////////////////////////////
    	totalqnaCount = service.getTotalguestqnaCount(map);
    	
	      totalPage = (int)Math.ceil((double)totalqnaCount/sizePerPage);
	    	
	      String pagebar = "";
	      pagebar += "<ul>";

	      loop = 1;
	        
	      startPageNo = ((currentShowPageNo - 1)/blocksize)*blocksize + 1;
	        
	     
	        if(startPageNo == 1) {
	        
	        	pagebar += "";
	        }
	        else {
	        
	        	
	        	if(colname == null || search == null) {
	        		
	        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/qnaguestManager.go?pageNo=%d'>[�씠�쟾%d�럹�씠吏�]</a>&nbsp;&nbsp;", startPageNo-1, blocksize); // 泥섏쓬 %d �뿉�뒗 startPageNo媛� , �몢踰덉㎏ %d �뿉�뒗 �럹�씠吏�諛붿뿉 �굹���궪 startPageNo媛� �씠�떎.		
	        	}
	        	else{
	        	
	        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/qnaguestManager.go?pageNo=%d&colname=%s&search=%s'>[�씠�쟾%d�럹�씠吏�]</a>&nbsp;&nbsp;", startPageNo-1, colname, search, blocksize); // 寃��깋�뼱 �엳�뒗 寃쎌슦        		
	        	}	
	        }        
	            	
	       
	        while( !(loop > blocksize ||
	        		 startPageNo > totalPage) ) {
	        	
	        	if(startPageNo == currentShowPageNo) {
	        		pagebar += String.format("&nbsp;&nbsp;<span style='color:red; font-weight:bold; text-decoration:underline;'>%d</span>&nbsp;&nbsp;", startPageNo);	
	        	}
	        	else {
		        	if(colname == null || search == null) {
		        		
		        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/qnaguestManager.go?pageNo=%d'>%d</a>&nbsp;&nbsp;", startPageNo, startPageNo); // 泥섏쓬 %d �뿉�뒗 startPageNo媛� , �몢踰덉㎏ %d �뿉�뒗 �럹�씠吏�諛붿뿉 �굹���궪 startPageNo媛� �씠�떎.		
		        	}
		        	else{
		        		
		        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/qnaguestManager.go?pageNo=%d&colname=%s&search=%s'>%d</a>&nbsp;&nbsp;", startPageNo, colname, search, startPageNo); // 寃��깋�뼱 �엳�뒗 寃쎌슦        		
		        	}
	        	}
	        	
	        	loop++;
	        	startPageNo++;
	        	
	        }// end of while--------------------
	                
	      
	        if(startPageNo > totalPage) {
	        
	        	pagebar += "";
	        }
	        else {
	        	        	
	        	if(colname == null || search == null) {
	        	
	        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/qnaguestManager.go?pageNo=%d'>[�떎�쓬%d�럹�씠吏�]</a>&nbsp;&nbsp;", startPageNo, blocksize); // 泥섏쓬 %d �뿉�뒗 startPageNo媛� , �몢踰덉㎏ %d �뿉�뒗 �럹�씠吏�諛붿뿉 �굹���궪 startPageNo媛� �씠�떎.		
	        	}
	        	else{	        		
	        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/qnaguestManager.go?pageNo=%d&colname=%s&search=%s'>[�떎�쓬%d�럹�씠吏�]</a>&nbsp;&nbsp;", startPageNo, colname, search, blocksize); // 寃��깋�뼱 �엳�뒗 寃쎌슦        		
	        	}	
	        }
	         	        
	        pagebar += "</ul>";
    	
    	req.setAttribute("colname", colname);
    	req.setAttribute("search", search);
    	req.setAttribute("qnaguestlist", qnaguestlist);
    	req.setAttribute("pagebar", pagebar);
    	
    	return "Manager/qnaguest.tilesM";
		
    } 
    
 // ===== qna guest delete =====
    @RequestMapping(value="/guestqnadeleteManager.go", method={RequestMethod.POST})
    public String qnaguestdelete(HttpServletRequest req) { 
    	
    	String seq_question = req.getParameter("seq_question");
    		
		HashMap<String, String> map = new HashMap<String, String>();
    	map.put("seq_question", seq_question);
    		
    	int n = service.guestqnadelete(map);
    	
    	req.setAttribute("n", n);
    	
    	return "Manager/qnaguestdeleteEnd.tilesM";
		
    } 
    
    // ===== guest qna detail =====
    @RequestMapping(value="/qnaguestdetail.go", method={RequestMethod.GET})
    public String qnaguestdetail(HttpServletRequest req) { 
    		
    		String email = req.getParameter("email");
	    	String content = req.getParameter("content");
	    	String subject = req.getParameter("subject");
	    	String seq_question = req.getParameter("seq");
	    	
    		HashMap<String, String> map = new HashMap<String, String>();
        	map.put("content", content);
        	map.put("subject", subject);
        	map.put("seq_question", seq_question);
        	map.put("email", email);
      	
        	HashMap<String, Object> n = service.qnaguestdetailShow(map);

        	req.setAttribute("n", n);
        	
        	return "Manager/qnaguestdetailEnd.tilesM";
    		
    } 
    
 // ===== qna 호스트 보기 =====
    @RequestMapping(value="/qnahostManager.go", method={RequestMethod.GET})
    public String qnahost(HttpServletRequest req) { 
    	
    	String seq_question = req.getParameter("seq_question");
    	String colname = req.getParameter("colname");
	    String search = req.getParameter("search");	
	    String pageNo = req.getParameter("pageNo"); 
    	
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("seq_question", seq_question);
		map.put("colname", colname);
		map.put("search", search);
						
        int currentShowPageNo = 1;
        
        if(pageNo == null) {
    	  currentShowPageNo = 1;    	  
        }
        else {
    	  currentShowPageNo = Integer.parseInt(pageNo);
        }
    	
    	int sizePerPage = 10;     
    	int start = 0;
    	int offset = 0;
    	int totalqnaCount = 0;
    	int loop = 0;      
	    int blocksize = 5;
	    int totalPage = 0;
	    int startPageNo = 0;
    	
    	start = (currentShowPageNo - 1) * sizePerPage;
    	offset = sizePerPage;
    	
    	RowBounds rowBounds = new RowBounds(start, offset);
    	
    	List<HashMap<String, Object>> qnahostlist = service.Showhostqna(map, rowBounds);
    	
    	///////////////////////////////////////
    	totalqnaCount = service.getTotalhostqnaCount(map);
    	
	      totalPage = (int)Math.ceil((double)totalqnaCount/sizePerPage);
	    	
	      String pagebar = "";
	      pagebar += "<ul>";

	      loop = 1;
	        
	      startPageNo = ((currentShowPageNo - 1)/blocksize)*blocksize + 1;
	        
	      
	        if(startPageNo == 1) {
	        	
	        	pagebar += "";
	        }
	        else {
	        	
	        	
	        	if(colname == null || search == null) {
	        	
	        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/qnahostManager.go?pageNo=%d'>[�씠�쟾%d�럹�씠吏�]</a>&nbsp;&nbsp;", startPageNo-1, blocksize); // 泥섏쓬 %d �뿉�뒗 startPageNo媛� , �몢踰덉㎏ %d �뿉�뒗 �럹�씠吏�諛붿뿉 �굹���궪 startPageNo媛� �씠�떎.		
	        	}
	        	else{
	        	
	        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/qnahostManager.go?pageNo=%d&colname=%s&search=%s'>[�씠�쟾%d�럹�씠吏�]</a>&nbsp;&nbsp;", startPageNo-1, colname, search, blocksize); // 寃��깋�뼱 �엳�뒗 寃쎌슦        		
	        	}	
	        }        
	            	
	        // **** 
	        while( !(loop > blocksize ||
	        		 startPageNo > totalPage) ) {
	        	
	        	if(startPageNo == currentShowPageNo) {
	        		pagebar += String.format("&nbsp;&nbsp;<span style='color:red; font-weight:bold; text-decoration:underline;'>%d</span>&nbsp;&nbsp;", startPageNo);	
	        	}
	        	else {
		        	if(colname == null || search == null) {
		        	
		        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/qnahostManager.go?pageNo=%d'>%d</a>&nbsp;&nbsp;", startPageNo, startPageNo); // 泥섏쓬 %d �뿉�뒗 startPageNo媛� , �몢踰덉㎏ %d �뿉�뒗 �럹�씠吏�諛붿뿉 �굹���궪 startPageNo媛� �씠�떎.		
		        	}
		        	else{		        		
		        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/qnahostManager.go?pageNo=%d&colname=%s&search=%s'>%d</a>&nbsp;&nbsp;", startPageNo, colname, search, startPageNo); // 寃��깋�뼱 �엳�뒗 寃쎌슦        		
		        	}
	        	}
	        	
	        	loop++;
	        	startPageNo++;
	        	
	        }// end of while--------------------
	                
	       
	        if(startPageNo > totalPage) {
	        	
	        	pagebar += "";
	        }
	        else {
	        		        	
	        	if(colname == null || search == null) {
	        		
	        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/qnahostManager.go?pageNo=%d'>[�떎�쓬%d�럹�씠吏�]</a>&nbsp;&nbsp;", startPageNo, blocksize); // 泥섏쓬 %d �뿉�뒗 startPageNo媛� , �몢踰덉㎏ %d �뿉�뒗 �럹�씠吏�諛붿뿉 �굹���궪 startPageNo媛� �씠�떎.		
	        	}
	        	else{	        		
	        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/qnahostManager.go?pageNo=%d&colname=%s&search=%s'>[�떎�쓬%d�럹�씠吏�]</a>&nbsp;&nbsp;", startPageNo, colname, search, blocksize); // 寃��깋�뼱 �엳�뒗 寃쎌슦        		
	        	}	
	        }
	         	        
	        pagebar += "</ul>";
    	
    	req.setAttribute("colname", colname);
    	req.setAttribute("search", search);
    	req.setAttribute("qnahostlist", qnahostlist);
    	req.setAttribute("pagebar", pagebar);
    	
    	return "Manager/qnahost.tilesM";
		
    } 
    
    // ===== qna host delete =====
    @RequestMapping(value="/hostqnadeleteManager.go", method={RequestMethod.POST})
    public String qnahostdelete(HttpServletRequest req) { 
    	
    	String seq_question = req.getParameter("seq_question");
    		
		HashMap<String, String> map = new HashMap<String, String>();
    	map.put("seq_question", seq_question);
    		
    	int n = service.hostqnadelete(map);
    	
    	req.setAttribute("n", n);
    	
    	return "Manager/qnahostdeleteEnd.tilesM";
		
    } 
    
 // ===== guest qna detail =====
    @RequestMapping(value="/qnahostdetail.go", method={RequestMethod.GET})
    public String qnahostdetail(HttpServletRequest req) { 
		
		String email = req.getParameter("email");
    	String content = req.getParameter("content");
    	String subject = req.getParameter("subject");
    	String seq_question = req.getParameter("seq");
    	
		HashMap<String, String> map = new HashMap<String, String>();
    	map.put("content", content);
    	map.put("subject", subject);
    	map.put("seq_question", seq_question);
    	map.put("email", email);
  	
    	HashMap<String, Object> n = service.qnahostdetailShow(map);

    	req.setAttribute("n", n);
    	
    	return "Manager/qnahostdetailEnd.tilesM";
		
    } 
    
 // ===== index show =====
    @RequestMapping(value="/indexManager.go", method={RequestMethod.GET})
    public String indexShow(HttpServletRequest req) {
    	
    	int n = service.guestcount();
		req.setAttribute("n", n);
		
		int t = service.hostcount();
		req.setAttribute("t", t);
    	
    	RowBounds rowBounds = new RowBounds(0, 3); 
    	
    	List<HashMap<String, Object>> indexguestqnaList = service.Showindexguestqna(rowBounds);   	
    	List<HashMap<String, Object>> indexhostqnaList = service.Showindexhostqna(rowBounds);
    	List<HashMap<String, Object>> indexnoticeList = service.Showindexnotice(rowBounds);
    	
    	// 인덱스 페이지에 나타내기 위해서 년도를 받아오자
    	GregorianCalendar today = new GregorianCalendar();     	 
       	int year = today.get(today.YEAR);
       	
       	// 인덱스 페이지에 그래프 뽑아오기
       	String Graphyear = req.getParameter("year");
       //	System.out.println("year : " + Graphyear);
       	
       	// 인덱스 해당 년의 총 수입 뽑아오기
       	HashMap<String, String> map = new HashMap<String, String>();
       	map.put("Graphyear", Graphyear);
       	
        int totalincome = service.totalincome(map);
       	
		 // 오늘 접속자 수 구하기
     	int jintianCount = service.jintianCount();
        
     	// 지구본에 들어갈 Q&A 가져오기
     	List<HashMap<String, Object>> LingqnaList = service.ShowqnaList();  
     	
     	// 알람 누르지 않은 갯수 구하기
     	int LingCount = service.LingCount();
     	
    	req.setAttribute("indexguestqnaList", indexguestqnaList);    	
    	req.setAttribute("indexhostqnaList", indexhostqnaList);
    	req.setAttribute("indexnoticeList", indexnoticeList);
    	req.setAttribute("year", year);
    	req.setAttribute("Graphyear", Graphyear);
    	req.setAttribute("totalincome", totalincome);
		req.setAttribute("jintianCount", jintianCount);
		req.setAttribute("LingqnaList", LingqnaList);
		req.setAttribute("LingCount", LingCount);
		
    	return "Manager/index.tilesM";
    } 
    
 // ===== 알림을 누르면 Status변경 =====
/*    @RequestMapping(value="/goStatus.go", method={RequestMethod.POST})
    void goStatus(HttpServletRequest req) {
    	
    	String seq_question = req.getParameter("seq_question");
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("seq_question", seq_question);
    	
    	service.changeStatus(map);
    	
    }*/

    // qna 답변
    @RequestMapping(value="/answerEnterEndManager.go", method={RequestMethod.POST})
    public String answerEnterEnd(HttpServletRequest req) {
    	
    	String seq_question = req.getParameter("seq_question");
    	String reply = req.getParameter("reply");
    	String email = req.getParameter("email");
    	String subject = req.getParameter("subject");
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("seq_question", seq_question);
    	map.put("reply", reply);
    	map.put("email", email);
    	map.put("subject", subject);
    	
    	// 모든 정보를 가지고 답변테이블에 insert 하자
    	int n = service.answerInput(map);
    	int replySuccess = 0;
    	
    	// 답변이 달렸으면 뷰단에 미답변 --> 답변완료로 바꾸자
    	if(n == 1) {
    		replySuccess = service.AllqnaReply(map);
    		    		
    	}
    	
    	req.setAttribute("replySuccess", replySuccess);

    	return "Manager/answerEnterEnd.tilesM";
    }
    
    // 통계
    @RequestMapping(value="/sumManager.go", method={RequestMethod.GET})
	public String sum(HttpServletRequest req) {
    	
    	return "Manager/sum.tilesM";
    }
    
    
    // 통계1
    @RequestMapping(value="/sumManagerEnd.go", method={RequestMethod.GET})
    @ResponseBody   
	public List<HashMap<String, Object>> sumlist(HttpServletRequest req) {
    	   	
    	// 년도를 받아오자
    	String year = req.getParameter("year");
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("year", year);
     	
    	List<HashMap<String, Object>> sumlist = service.getSum(map);
    	
    //	System.out.println("sum : " + sumlist);
    	return sumlist;
    }
    
    // 통계2
    @RequestMapping(value="/sumManagerEnd2.go", method={RequestMethod.GET})
    @ResponseBody  
	public List<HashMap<String, Object>> qnasumlist(HttpServletRequest req) {
    	    	
    	// 년도를 받아오자
    	String year = req.getParameter("year");
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("year", year);
    	
    	List<HashMap<String, Object>> qnasumlist = service.getSumqna(map);
    	
    //	System.out.println("qna :"  + qnasumlist);
    	return qnasumlist;
    }
    
 // 신고 목록
    @RequestMapping(value="/reportManager.go", method={RequestMethod.GET})
   public String allreportList(HttpServletRequest req) {
                    
       List<HashMap<String, Object>> allreportList = service.allreportList();
       
       System.out.println(allreportList);
       
       req.setAttribute("allreportList", allreportList);
       
       return "Manager/report.tilesM";
    }

    @RequestMapping(value="/Delreport.go", method={RequestMethod.GET})
    @ResponseBody
   public int  Delreport(HttpServletRequest req) {
                    
       String reportno = req.getParameter("reportno");
       
       int n = service.delreport(reportno);
       
       System.out.println(n);
       
       return n;
    }
   
}



