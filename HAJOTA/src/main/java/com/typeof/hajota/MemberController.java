package com.typeof.hajota;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.typeof.hajota.member.service.MemberService;

//===== #32. 컨트롤러 선언 =====
@Controller
@Component
/* XML 에서 빈을 만드는 대신에 클래스명 앞에
@Component 어노테이션을 적어주면 해당 클래스는
bean 으로 자동 등록된다.
그리고 bean의 이름(첫글자는 소문자)은 해당 클래스명이 된다.  
*/
public class MemberController {
	
//	===== #33. 의존객체 주입하기(DI : Dependency Injection) ===== 
	@Autowired
	private MemberService service;

	
	@RequestMapping(value="/index.go")
	public String test(){
		
		
		return "main/index.tiles";
	}

}
