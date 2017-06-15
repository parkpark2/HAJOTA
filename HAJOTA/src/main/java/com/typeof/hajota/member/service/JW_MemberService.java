package com.typeof.hajota.member.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.typeof.hajota.member.model.JW_MemberDAO;

@Service
public class JW_MemberService implements InterMemberService {

//	===== #31. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private JW_MemberDAO dao;
	
	// ===== 회원가입완료
	public int joinEnd(HashMap<String, String> map) {
		int n = dao.joinEnd(map);
		return n;
	}

	//	===== #41. 메인페이지용 이미지 파일이름을 가져오는 서비스단 List<String> getImgfilenameList() 메소드 생성하기 ===== 
	public List<String> getImgfilenameList() {
		List<String> list = dao.getImgfilenameList();
		return list;
	}
	
	// ===== #46. 로그인 여부 알아오기 =====
	public int loginEnd(HashMap<String, String> map) {
		int n = dao.loginEnd(map);
		return n;
	}
	// ===== 회원정보 가져오기 ====
	public HashMap<String, String> getLoginMember(String guest_email) {
		HashMap<String, String> map = dao.getLoginMember(guest_email);
		return map;
	}
	
}
