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

import com.typeof.hajota.member.service.JW_MemberService;

//===== #32. 컨트롤러 선언 =====
@Controller
@Component
public class JW_MemberController {
	
//	===== #33. 의존객체 주입하기(DI : Dependency Injection) ===== 
	@Autowired
	private JW_MemberService service;

	
	@RequestMapping(value="/index.go", method={RequestMethod.GET})
	public String test(){
		
		
		return "main/index.tiles";
	}
	
	@RequestMapping(value="/indexChinese.go", method={RequestMethod.GET})
	public String test1(){
		
		
		return "main/indexChinese.tilesC";
	}
/*	
	@RequestMapping(value="/test2.go", method={RequestMethod.GET})
	public String test2(){
		
		System.out.println("adfasdfasdfadfasdfasdf");
		
		return "test2.notiles";
	}
    
    // ===== #44. 로그인 폼 페이지 요청 =====
    @RequestMapping(value="/login.go", method={RequestMethod.GET})
    public String login(HttpServletRequest req) {
    	
    	return "login/loginform.tiles2";
    	// /hajota/src/main/webapp/WEB-INF/views2/login/loginform.jsp 파일을 생성한다.
    }
    
    
    // ===== #45. 로그인 완료 요청 =====
    @RequestMapping(value="/loginEnd.go", method={RequestMethod.POST})
    public String loginEnd(HttpServletRequest req,  HttpSession session) {
    	
    	String guest_email = req.getParameter("guest_email");
    	String pwd = req.getParameter("pwd");
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("guest_email", guest_email);
    	map.put("pwd", pwd);
    	
 
    	 int n =service.loginEnd(map);
    	
    	 req.setAttribute("n", n);
    	 
    	 if(n==1) {
    		 HashMap<String, String> loginuser = service.getLoginMember(guest_email);
    		 session.setAttribute("loginuser", loginuser);
    		 
    		 
    		 String url = (String)session.getAttribute("url");
    		 req.setAttribute("url", url);
    	 }
    	
    	return "login/loginEnd.tiles2";
    	
    	
    	// /hajota/src/main/webapp/WEB-INF/views2/login/loginEnd.jsp 파일을 생성한다
    }
	
    
    // ===== #53. 로그아웃 완료 요청 =====
    @RequestMapping(value="/logout.go", method={RequestMethod.GET})
    public String logout(HttpServletRequest req, HttpSession session) { 
    	
    	session.invalidate();
    	
    	return "login/logout.tiles2";
    	// /Board/src/main/webapp/WEB-INF/views2/login/logout.jsp 파일을 생성한다.
    }
    
    
 // ===== 회원가입 폼 페이지 요청 =====
    @RequestMapping(value="/join.go", method={RequestMethod.GET})
    public String join(HttpServletRequest req) {
    	
    	return "join/joinform.tiles2";
    	// /hajota/src/main/webapp/WEB-INF/views2/join/joinform.jsp 파일을 생성한다.
    }
    
 // ===== #45. 회원가입 완료 요청 =====
    @RequestMapping(value="/joinEnd.go", method={RequestMethod.POST})
    public String joinEnd(HttpServletRequest req,  HttpSession session) {
    	
    	String guest_email = req.getParameter("guest_email");
    	String pwd = req.getParameter("pwd");
    	String last_name = req.getParameter("last_name");
    	String first_name = req.getParameter("first_name");
    	String birthday = req.getParameter("birthday");
    	
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("guest_email", guest_email);
    	map.put("pwd", pwd);
    	map.put("last_name", last_name);
    	map.put("first_name", first_name);
    	map.put("birthday", birthday);
    	
    	int n = 0;
    	n = service.joinEnd(map);
    	
    	   String msg = "";
		   String loc = "";
		   String type = "";	
		   String title = "";
		   
		   if(n==1) {
			   msg = "로그인페이지로 이동하시겠습니까?";
			   loc = "javascript:history.back();";
			   type = "success";
			   title = "가입을 축하드립니다~~";
		   }
		   
		   
		   req.setAttribute("msg", msg);
		   req.setAttribute("loc", loc);
		   req.setAttribute("type", type);
		   req.setAttribute("title", title);
    	 
		   return "msg.notiles";
    	
    	// /HAJOTA/src/main/webapp/WEB-INF/notiles/msg.jsp 파일을 생성한다
    }
*/
	
	

}
