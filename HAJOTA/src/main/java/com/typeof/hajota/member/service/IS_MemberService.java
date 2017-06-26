package com.typeof.hajota.member.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.typeof.hajota.member.model.IS_MemberDAO;

@Service
public class IS_MemberService {

//	===== #31. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private IS_MemberDAO dao;

	// 로그인 여부 알아오기
	public int loginEnd(HashMap<String, String> map) {
		int n = dao.loginEnd(map);
		return n;
	}
	
	// 로그인 성공한 사용자 정보 가져오기
	
	public HashMap<String, Object> getLoginMember(HashMap<String, String> map) {
		HashMap<String, Object> loginuser = dao.getLoginMember(map);
		return loginuser;
}
	
	public int memberEnter(HashMap<String, Object> map) {
		int n = dao.memberEnter(map);
		return n;
	}

	// 개인정보 수정
	
	public int editUser(HashMap<String, Object> map) {
		int n = dao.editUser(map);
		return n;
	}

	// 비밀번호 변경
	public int editUserEnd(HashMap<String, String> map) {
		int n = dao.editUserEnd(map);
		return n;
	}

	// 회원탈퇴
	public int signOutEnd(HashMap<String, String> map) {
		int n = dao.signOutEnd(map);
		return n;
	}

	// DB에서 SEQ_GUEST_WITHDRAW_REASON / WITHDRAW_REASON 값 가져오기
	public List<HashMap<String, String>> signOut() {
		List<HashMap<String, String>> list = dao.signOut();
		return list;
	}

	public int reasonInsert(HashMap<String, String> map) {
		int n = dao.reasonInsert(map);
		return n;
	}

}