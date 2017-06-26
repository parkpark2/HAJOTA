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
	/*
	@RequestMapping(value="/index.go")
	public String test(){		
		return "main/index.tiles";
	}
 	*/
	/*
	// 로그인폼 페이지
	@RequestMapping(value="/loginform.go", method={RequestMethod.GET})
	public String loginform(HttpServletRequest req){
		return "IS/login/loginform.tiles2";
	}
	*/
	/*
	// 로그인 완료 요청
	@RequestMapping(value="/loginEnd.go", method={RequestMethod.POST})
	public String loginEnd(HttpServletRequest req, HttpSession session){
		
		String guest_email = req.getParameter("guest_email");
		String pwd = req.getParameter("pwd");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("guest_email", guest_email);
		map.put("pwd", pwd);
		
		int n = service.loginEnd(map);
		
		req.setAttribute("n", n);
		
		if(n==1){
			HashMap<String, Object> loginuser = service.getLoginMember(map);
			System.out.println("loginuser" + loginuser.get("guest_email"));
			session.setAttribute("loginuser", loginuser);
		}
		
		
		return "IS/login/loginEnd.tiles2";
	
	}
	*/
	/*
	// 회원가입 하기	
	@RequestMapping(value="/memberRegisterForm.go", method={RequestMethod.GET})
	public String memberRegisterForm(HttpServletRequest req){
		
		return "IS/member/memberRegisterForm.tiles2";	
		
	}
	*/
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
	/*
	// 개인정보수정 뷰단
	@RequestMapping(value="/editUser.go", method={RequestMethod.GET})
	public String editUser(HttpServletRequest req){
		return "IS/person/editUser.tiles2";
	}
	*/
	/*
	// 개인정보수정 비밀번호 변경
	@RequestMapping(value="/editUserEnd.go", method={RequestMethod.GET})
	public String editUserEnd(HttpServletRequest req){
		
		String guest_email = req.getParameter("guest_email");
		String pwd = req.getParameter("pwd");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("guest_email", guest_email);
		map.put("pwd", pwd);
		
		int n = service.editUserEnd(map);
		
		req.setAttribute("n", n);
		
		return "IS/person/editUserEnd.tiles2";		
	}
	*/
	// 탈퇴하기 보여주기
	@RequestMapping(value="/signOut.go", method={RequestMethod.GET})
	public String signOut(HttpServletRequest req){
		
		List<HashMap<String, String>> list = service.signOut();
		
		req.setAttribute("list", list);
		
		return "IS/person/signOut.tiles2";
	}	
		
	// 탈퇴하기
	@RequestMapping(value="/signOutEnd.go", method={RequestMethod.POST})
	public String signOutEnd(HttpServletRequest req, HttpSession session){
		
		String value = req.getParameter("reason_value");
		
		System.out.println(value);
		
		/*@SuppressWarnings("unchecked")*/
		HashMap<String, String> loginuser = (HashMap<String, String>)session.getAttribute("loginuser");
		req.setAttribute("loginuser", loginuser);
		String guest_email = loginuser.get("GUEST_EMAIL");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("guest_email", guest_email);
		map.put("value", value);
		
		int n = service.signOutEnd(map);
		
		req.setAttribute("n", n);
		
		if(n == 1) {
			// tbl_guest_withdraw
			n = service.reasonInsert(map);
			
			req.setAttribute("n", n);			
		}
		
		return "IS/person/signOutEnd.tiles2";
	}
		
	
	
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
	
	// 사이드바 뷰단
	@RequestMapping(value="/sidebar.go", method={RequestMethod.GET})
	public String sidebar(HttpServletRequest req){
		return "IS/sidebar/sidebar.tiles2";	
	}
	
	// 에어비엔비 사이드바 뷰단
	@RequestMapping(value="/airbnbSidebar.go", method={RequestMethod.GET})
	public String airbnbSidebar(HttpServletRequest req){
		return "IS/sidebar/airbnbSidebar.tiles2";
	}
	

}
