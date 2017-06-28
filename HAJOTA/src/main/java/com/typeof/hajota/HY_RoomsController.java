package com.typeof.hajota;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.typeof.hajota.rooms.service.HY_RoomsService;
import com.typeof.hajota.rooms.service.RoomsService;

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
      HashMap<String, String> mainmap = new HashMap<String, String>();
      
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
      
      System.out.println(newFileName);
      System.out.println(mainimage.getOriginalFilename());
      System.out.println(String.valueOf(fileSize));
      
      List<MultipartFile> attachList = req.getFiles("attach");
      List<HashMap<String, String>> mapProductimageList = new ArrayList<HashMap<String, String>>();
      
      /*   
        ===== #135. 사용자가 쓴 글에 파일이 첨부가 된것인지
                      아니면 파일첨부가 안된것인지 구분을 지어주어야 한다. =====
      */
      // **** 첨부파일이 있는지 없는지? ****
      if(attachList != null) {
           
           
           
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
           
            
       
          return "addtest.tiles6";
          // /Board/src/main/webapp/WEB-INF/views/main/test.jsp 파일을 생성한다.
       }
    
   
   
    @RequestMapping(value="/listdetailtest.go", method={RequestMethod.GET})
       public String listdetailtest(HttpServletRequest req) {
          
        String seq = (String)req.getParameter("seq_lodge");
        
        HashMap<String, Object> listdetail = service.getlistdetail(seq);
        
        req.setAttribute("listdetail", listdetail);
       
          return "listdetailtest.tiles5";
          // /Board/src/main/webapp/WEB-INF/views/main/test.jsp 파일을 생성한다.
       }
    
    @RequestMapping(value="/hyhostinsert.go", method={RequestMethod.GET})
    public String hyhostinsert(HttpServletRequest req) {
    	
	 
    	return "hyhostinsert.notiles";
    	// /Board/src/main/webapp/WEB-INF/views/main/test.jsp 파일을 생성한다.
    }
   

}