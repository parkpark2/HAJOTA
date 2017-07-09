package com.typeof.hajota.chatting;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


//=== # 웹채팅관련6 === 

@Controller
public class ChattingController {
	
	@RequestMapping(value="/multichat.go", method={RequestMethod.GET})
	public String requireLogin_multichat(HttpServletRequest req, HttpServletResponse res){
		
		return "chatting/multichat.notiles";
	}
	
}
