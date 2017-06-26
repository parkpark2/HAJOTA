package com.typeof.hajota.member.model;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public interface IS_InterMemberDAO {

	int loginEnd(HashMap<String, Object> map); // 로그인 여부 알아오기
	
	HashMap<String, Object> getLoginMember(HashMap<String, String> map); // 로그인 사용자 정보 가져오기
	
	int memberEnter(HashMap<String, Object> map); // 회원가입
	
	int editUser(HashMap<String, Object> map); // 개인정보 수정
	
	int proeditEnd(String pwd); // 비밀번호 변경
	
}
