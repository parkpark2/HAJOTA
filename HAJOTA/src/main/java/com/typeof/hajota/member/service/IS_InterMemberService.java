package com.typeof.hajota.member.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface IS_InterMemberService {

	String loginEnd(HttpServletRequest req, HttpSession session); // 로그인 여부 알아오기
	
	HashMap<String, String> getLoginMember(HashMap<String, String> map); // 로그인 성공한 사용자 정보 가져오기

	int memberEnter(HashMap<String, Object> map); // 회원가입
	
//	int editUser(HashMap<String, Object> map); // 개인정보 수정

	String proeditEnd(String pwd); // 비밀번호 변경
	
}
