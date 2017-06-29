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
	public int loginEnd(HashMap<String, Object> map) {
		int n = dao.loginEnd(map);
		return n;
	}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	// 로그인 성공한 사용자 정보 가져오기
	public HashMap<String, String> getLoginMember(String email) {
		HashMap<String, String> loginuser = dao.getLoginMember(email);
		return loginuser;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	public int memberEnter(HashMap<String, Object> map) {
		int n = dao.memberEnter(map);
		return n;
	}

	// 개인정보 수정
	
	public int editUser(HashMap<String, Object> map) {
		int n = dao.editUser(map);
		return n;
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 개인정보수정 비밀번호/연락처 변경
	public int memberEditEnd(HashMap<String, String> map) {
		int n = dao.memberEditEnd(map);
		return n;
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 회원탈퇴
	public int signOutEnd(HashMap<String, String> map) {
		int n = dao.signOutEnd(map);
		return n;
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////
	// DB에서 SEQ_GUEST_WITHDRAW_REASON / WITHDRAW_REASON 값 가져오기
	public List<HashMap<String, String>> signOut() {
		List<HashMap<String, String>> list = dao.signOut();
		return list;
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 회원탈퇴 사유 통계를 위한 value 값 insert 해주기
	public int reasonInsert(HashMap<String, String> map) {
		int n = dao.reasonInsert(map);
		return n;
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////
	// DB에서 SEQ_HOST_WITHDRAW_REASON / WITHDRAW_REASON 값 가져오기
	public List<HashMap<String, Object>> HostsignOut() {
		List<HashMap<String, Object>> list = dao.HostsignOut();
		return list;
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 회원가입
	public int memberRegister(HashMap<String, Object> map) {
		int n = dao.memberRegister(map);
		return n;
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////	
	// 사용가능한 언어
	public int language(HashMap<String, Object> langmap) {
		int n = dao.language(langmap);
		return n;
	}
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
	public List<HashMap<String, Object>> HnGcheck() {
		List<HashMap<String, Object>> withdrawlist = dao.HnGcheck();
		return withdrawlist;
	}
*/	
}