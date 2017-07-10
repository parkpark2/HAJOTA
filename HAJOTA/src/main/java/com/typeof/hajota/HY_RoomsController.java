package com.typeof.hajota;


import java.util.HashMap;
import java.util.List;

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

import com.typeof.hajota.rooms.service.HY_RoomsService;

//===== #32. 컨트롤러 선언 =====
@Controller
@Component
/* XML 에서 빈을 만드는 대신에 클래스명 앞에
@Component 어노테이션을 적어주면 해당 클래스는
bean 으로 자동 등록된다.
그리고 bean의 이름(첫글자는 소문자)은 해당 클래스명이 된다.  
*/
public class HY_RoomsController {
   
//   ===== #33. 의존객체 주입하기(DI : Dependency Injection) ===== 
   @Autowired
   private HY_RoomsService service;

   
   @Autowired
   private FileManager fileManager;
   
   
   
   
    
    @RequestMapping(value="/hostinsert.go", method={RequestMethod.GET})
       public String hostinsert(HttpServletRequest req) {

          return "hostinsert.tiles6";
          // /Board/src/main/webapp/WEB-INF/views/main/test.jsp 파일을 생성한다.
       }
    
    @RequestMapping(value="/addtest.go", method={RequestMethod.POST})
       public String addtest(MultipartHttpServletRequest req , HttpSession session , HttpServletResponse res) {
       
       List<MultipartFile> attachList = req.getFiles("attach");
       
       String email = req.getParameter("email");
       String roomsname = req.getParameter("roomsname");
       String TYPE_LODGE = req.getParameter("TYPE_LODGE");
       String TYPE_BUILDING = req.getParameter("TYPE_BUILDING");
       String maxpeople = req.getParameter("maxpeople");
       
       System.out.println("email = " + email);
       System.out.println("roomsname = " + roomsname);
       System.out.println("TYPE_LODGE = " + TYPE_LODGE);
       System.out.println("TYPE_BUILDING = " + TYPE_BUILDING);
       System.out.println("maxpeople = " + maxpeople);
       
      /* List<HashMap<String, String>> mapProductimageList = new ArrayList<HashMap<String, String>>();
          
         ===== #135. 사용자가 쓴 글에 파일이 첨부가 된것인지
                       아니면 파일첨부가 안된것인지 구분을 지어주어야 한다. =====
       
       // **** 첨부파일이 있는지 없는지? ****
       if(attachList != null) {
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
            
            
            for(int i=0; i<attachList.size(); i++) {
               try {
                   bytes = attachList.get(i).getBytes();
                   
                   newFileName = fileManager.doFileUpload(bytes, attachList.get(i).getOriginalFilename(), path);
                   
                   fileSize = attachList.get(i).getSize();
                   
                  // === >>>> thumbnail 파일 생성을 위한 작업 <<<<    =========  //
                  
                  // ===================================================  //
                   
                   HashMap<String, String> mapProductimage = new HashMap<String, String>();
                   
                   
                   mapProductimage.put("imagefilename", newFileName);
                   mapProductimage.put("imageorgFilename", attachList.get(i).getOriginalFilename());
                   mapProductimage.put("imagefileSize", String.valueOf(fileSize));
                   
                   
                   mapProductimageList.add(mapProductimage);
                   
               } catch (Exception e) {
                  
               }
               
            }// end of for-------------------------
            
         }// end of if------------------------------
         
         
        // **** 폼에서 입력받은 제품입력정보 값을 
        //      Service 단으로 넘겨서 테이블에 insert 하기로 한다.
            
             // 이미지파일첨부가 없는 경우 또는 이미지파일첨부가 있는 경우로 나누어서
            // Service 단으로 호출하기
            int n = 0;
            int m = 0;
            int count = 0;
            
         
               for(int i=0; i<mapProductimageList.size(); i++) {
                  m = service.addFile(mapProductimageList.get(i));
                  if(m==1) count++;
               }
               
               if(mapProductimageList.size() == count) {
                  n=1;
               }
               else {
                  n=0;
               }
           
                  req.setAttribute("n", n);      
           */
            
       
          return "addtest.notiles";
          // /Board/src/main/webapp/WEB-INF/views/main/test.jsp 파일을 생성한다.
       }
    
   
   /*숙소디테일*/
    @RequestMapping(value="/listdetailtest.go", method={RequestMethod.GET})
       public String listdetailtest(HttpServletRequest req, HttpSession session) {
    	HashMap<String, Object> loginuser = (HashMap<String, Object>)session.getAttribute("loginuser");
    	
    	
        String email = (String)loginuser.get("EMAIL");  
        String seq = (String)req.getParameter("seq_lodge");
        
        int totalcount = service.getreviewcount(seq);
        HashMap<String, Object> listdetail = service.getlistdetail(seq);
        
        
        req.setAttribute("email", email);
        req.setAttribute("totalcount", totalcount);
        req.setAttribute("listdetail", listdetail);
       
          return "listdetailtest.roomsdetail";
          // /Board/src/main/webapp/WEB-INF/views/main/test.jsp 파일을 생성한다.
       }
    /*호스팅하기*/
    @RequestMapping(value="/hyhostinsert.go", method={RequestMethod.GET})
    public String hyhostinsert(HttpServletRequest req) {
    	
	 
    	return "hyhostinsert.notiles";
    	
    }
    /*이건뭔데?*/
    @RequestMapping(value="/controll.go", method={RequestMethod.GET})
    public String controll(HttpServletRequest req) {
    	
	 
    	return "controll.notiles";
    	// /Board/src/main/webapp/WEB-INF/views/main/test.jsp 파일을 생성한다.
    }
    /*숙소 결제*/ 
   @RequestMapping(value="/addtrip.go", method={RequestMethod.POST})
   @ResponseBody
    public int addtrip(HttpServletRequest req) {
    
	    String email = req.getParameter("email");
    	String roomno = req.getParameter("roomno");
    	String cupon = req.getParameter("cupon");
    	String people = req.getParameter("people");
    	String startdate = req.getParameter("startdate");
    	String enddate = req.getParameter("enddate");
    	String totalsaleprice = req.getParameter("totalsaleprice");
    	
    	System.out.println(email);
    	System.out.println(roomno);
    	System.out.println(cupon);
    	System.out.println(people);
    	System.out.println(startdate);
    	System.out.println(enddate);
    	System.out.println(totalsaleprice);
    	
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("email", email);
    	map.put("roomno", roomno);
    	map.put("cupon", cupon);
    	map.put("people", people);
    	map.put("startdate", startdate);
    	map.put("enddate", enddate);
    	map.put("totalsaleprice", totalsaleprice);
    	
    	int n = 0;
    	int m = 0;
    	
    	if(cupon != null){
    		m = service.usecoupon(cupon);
    	}
    	
    		n = service.addtrip(map);
    	
    	    
    	
    	
    	
    	
    	return n;
    	// /Board/src/main/webapp/WEB-INF/views/main/test.jsp 파일을 생성한다.
    }
   
   
    /*숙소 결제 전단계*/ 
    @RequestMapping(value="confirmroom.go" , method={RequestMethod.GET})
    public String confirmroom(HttpServletRequest req , HttpSession session){
    	
    	HashMap<String, Object> loginuser = (HashMap<String, Object>)session.getAttribute("loginuser");
    	
    	
        String email = (String)loginuser.get("EMAIL");
    	String roomno = req.getParameter("roomno");
    	String totalprice = req.getParameter("totalprice");
    	String depositprice = req.getParameter("depositprice");
    	String cleanprice = req.getParameter("cleanprice");
    	String roomprice = req.getParameter("roomprice");
    	
    	
    	
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("email", email);
    	List<HashMap<String, String>> cuponlist = service.getcuponlist(map);
    	
    	
    	req.setAttribute("email", email);
    	req.setAttribute("roomno", roomno);
    	req.setAttribute("totalprice", totalprice);
    	req.setAttribute("depositprice", depositprice);
    	req.setAttribute("cleanprice", cleanprice);
    	req.setAttribute("roomprice", roomprice);
    	req.setAttribute("cuponlist", cuponlist);
    	
    	return "confirmroom.notiles";
    }
    
    /*리뷰를 뽑아주는 ajax*/
    @RequestMapping(value="/showreview.go", method={RequestMethod.GET})
    @ResponseBody
    public List<HashMap<String, String>> showreview(HttpServletRequest req) {
    	
    	String seq_lodge = req.getParameter("seq_lodge");
    	
    	int start = 0;
    	int offset = 0;
    	
    	
    	int pageno = Integer.parseInt(req.getParameter("pageno"));
    	
    	
    	start = 0;
    	offset = pageno;
    	
    	RowBounds rowbounds = new RowBounds(start, offset);
    	

    	List<HashMap<String, String>> reviewlist = service.getreviewlist(seq_lodge,rowbounds);
    	
    	
    	
    	return reviewlist;
    	// /Board/src/main/webapp/WEB-INF/views/main/test.jsp 파일을 생성한다.
    }
    
    /*리뷰 신고 하기*/
    @RequestMapping(value="/Reviewreport.go", method={RequestMethod.GET})
    public String Reviewreport(HttpServletRequest req , HttpSession session) {
    	HashMap<String, Object> loginuser = (HashMap<String, Object>)session.getAttribute("loginuser");
    	
        String email = (String)loginuser.get("EMAIL");
    	String reviewno = req.getParameter("reviewno");
    	
    	
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("email", email);
    	map.put("reviewno", reviewno);
    	
    	
    	req.setAttribute("email", email);
    	req.setAttribute("reviewno", reviewno);
    	return "Reviewreport.notiles";
    	
    }
    /*리뷰 신고 하기*/
    @RequestMapping(value="/ReviewreportEnd.go", method={RequestMethod.GET})
    @ResponseBody
    public int ReviewreportEnd(HttpServletRequest req , HttpSession session) {
    	
    	
        String email = req.getParameter("email");
    	String reviewno = req.getParameter("reviewno");
    	String content = req.getParameter("reviewcontent");
    	
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("email", email);
    	map.put("reviewno", reviewno);
    	map.put("content", content);
    	
    	
    	int n = service.insertreport(map);


    	
    	
    	return n;
    	
    }
    
    
    
}