package com.typeof.hajota;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.typeof.hajota.member.service.IS_MemberService;

//===== #32. 컨트롤러 선언 =====
@Controller
@Component
/* XML 에서 빈을 만드는 대신에 클래스명 앞에
@Component 어노테이션을 적어주면 해당 클래스는
bean 으로 자동 등록된다.
그리고 bean의 이름(첫글자는 소문자)은 해당 클래스명이 된다.  
*/
public class IS_MemberController {
	
//	===== #33. 의존객체 주입하기(DI : Dependency Injection) ===== 
	@Autowired
	private IS_MemberService service;
	
/*	@RequestMapping(value="/index.go")
	public String test(){		
		return "main/index.tiles";
	}*/
 	
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	// 회원가입 보여주기
	@RequestMapping(value="/memberRegisterForm.go", method={RequestMethod.GET})
	public String memberRegisterForm(HttpServletRequest req){
		return "IS/member/memberRegisterForm.tiles2";	
	} 

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	// 회원가입 정보 입력
	@RequestMapping(value="/memberRegisterFormEnd.go", method={RequestMethod.POST})
	public String memberRegisterFormEnd(HttpServletRequest req){
		
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		String last_name = req.getParameter("last_name");
		String first_name = req.getParameter("first_name");
		String birthday = req.getParameter("birthday");
		String tel = req.getParameter("tel");
		String[] lang = req.getParameterValues("seq_language_type");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("pwd", pwd);
		map.put("last_name", last_name);
		map.put("first_name", first_name);
		map.put("birthday", birthday);
		map.put("tel", tel);
		map.put("lang", lang);
		
		int n = service.memberRegister(map);
	
 		int m = 0;
		
		// 회원가입이 됐으면
		if(n == 1) {
			// 사용가능한 언어 보내기
			for(int i = 0; i < lang.length; ++i) {
				HashMap<String, Object> langmap = new HashMap<String, Object>();
				langmap.put("email", email);
				langmap.put("lang", lang[i]);
				
				m += service.language(langmap);
			}
		}
		
		if((n + m) == 1 + lang.length) {
			n = 1;
		}
		
		else {
			n = 0;
		}
		
		req.setAttribute("n", n);
	
		return "IS/member/memberRegisterFormEnd.tiles2";	
	}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	/*
	// 회원가입 입력정보 받아와서 DB에 넣어주는 메소드 생성
	@RequestMapping(value="/memberRegisterFormEnd.go", method={RequestMethod.POST})
	public String memberEnter(HttpServletRequest req){
	
		String guest_email = req.getParameter("guest_email");
		String pwd = req.getParameter("pwd");
		String first_name = req.getParameter("first_name");
		String last_name = req.getParameter("last_name");
		String birthday = req.getParameter("birthday");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("guest_email", guest_email);
		map.put("pwd", pwd);
		map.put("first_name", first_name);
		map.put("last_name", last_name);
		map.put("birthday", birthday);
		
		int n = service.memberEnter(map);

		req.setAttribute("n", n);
		
		return "IS/member/memberRegisterFormEnd.tiles2";
	}
	*/
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 회원정보수정 뷰단
	@RequestMapping(value="/memberEdit.go", method={RequestMethod.GET})
	public String editUser(HttpServletRequest req){
		return "IS/member/memberEdit.tiles2";
	}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 개인정보수정 비밀번호/연락처 변경
	@RequestMapping(value="/memberEditEnd.go", method={RequestMethod.GET})
	public String editUserEnd(HttpServletRequest req){
		
		String email = req.getParameter("email");
		String pwd = req.getParameter("pwd");
		String tel = req.getParameter("tel");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("pwd", pwd);
		map.put("tel", tel);
		
		int n = service.memberEditEnd(map);
		
		req.setAttribute("n", n);
		
		return "IS/member/memberEditEnd.tiles2";
	}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	// 탈퇴하기 보여주기
	@RequestMapping(value="/signOut.go", method={RequestMethod.GET})
	public String signOut(HttpServletRequest req){
		
		String grade = req.getParameter("grade");
		System.out.println("grade" + grade);
		
		List<HashMap<String, String>> list = service.signOut();
		
		req.setAttribute("list", list);
		
		return "IS/member/signOut.tiles2";
	}	
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
	// 호스트 탈퇴하기 보여주기
	@RequestMapping(value="/HostsignOut.go", method={RequestMethod.GET})
	public String HostsignOut(HttpServletRequest req){

		List<HashMap<String, Object>> list = service.HostsignOut();
		
		req.setAttribute("list", list);
		
		System.out.println("list=======" + list);
		
		return "IS/member/HostsignOut.tiles2";
	}	
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
	// 탈퇴하기 및 탈퇴사유 넣기
	@RequestMapping(value="/signOutEnd.go", method={RequestMethod.POST})
	public String signOutEnd(HttpServletRequest req, HttpSession session){
		
		String value = req.getParameter("reason_value");
		
		/*@SuppressWarnings("unchecked")*/
		HashMap<String, String> loginuser = (HashMap<String, String>)session.getAttribute("loginuser");
		req.setAttribute("loginuser", loginuser);
		String email = loginuser.get("EMAIL");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("value", value);
		
		int n = service.signOutEnd(map);
		
		req.setAttribute("n", n);
		
		if(n == 1) {
			// tbl_guest_withdraw
			n = service.reasonInsert(map);
			
			req.setAttribute("n", n);			
		}
		
		return "IS/member/signOutEnd.tiles2";
	}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
	// 로그인 완료 요청
    @RequestMapping(value="/loginEnd.go", method={RequestMethod.POST})
    public String loginEnd(HttpServletRequest req,  HttpSession session) {
       
       String email = req.getParameter("email");
       String pwd = req.getParameter("pwd");
       
       HashMap<String, Object> map = new HashMap<String, Object>();
       map.put("email", email);
       map.put("pwd", pwd);
 
       int n =service.loginEnd(map);
       req.setAttribute("n", n);
        
       if(n==1) { // 로그인이 되었을때
    	   HashMap<String, String> loginuser = service.getLoginMember(email);
           session.setAttribute("loginuser", loginuser);
        }
        
        return "IS/login/loginEnd.tiles2";
    }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
    // 로그아웃 완료 요청
    @RequestMapping(value="/logout.go", method={RequestMethod.GET})
    public String logout(HttpServletRequest req, HttpSession session) { 
       session.invalidate();
       return "IS/login/logout.tiles2";
    }
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
    // QnA 보여주기
    @RequestMapping(value="/QnA.go", method={RequestMethod.GET})
    public String QnA(HttpServletRequest req) { 
       return "IS/QnA/QnA.tiles2";
    }
*/    
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    
 
    
    
    
    
    
/*	// 개인정보 수정 뷰단
	@RequestMapping(value="/editUserEnd.go", method={RequestMethod.GET})
	public String editUserEnd(HttpServletRequest req){
		return "person/editUser.tiles2";	
	}*/
	
	// 개인정보 수정
	/*
	@RequestMapping(value="/editUser.go", method={RequestMethod.GET})
	public String editUser(HttpServletRequest req){
		
		String pwd = req.getParameter("pwd");
		String last_name = req.getParameter("last_name");
		String first_name = req.getParameter("first_name");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pwd", pwd);
		map.put("last_name", last_name);
		map.put("first_name", first_name);
		
		int n = service.editUser(map);
		
		return "person/editUser.tiles2";
	}
	*/
	
}
