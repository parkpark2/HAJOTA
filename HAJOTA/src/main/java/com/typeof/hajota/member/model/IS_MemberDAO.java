package com.typeof.hajota.member.model;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


//===== #28. DAO 선언 =====
@Repository
public class IS_MemberDAO  {

//	===== #29. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;

	// 로그인 여부 알아오기
	public int loginEnd(HashMap<String, String> map) {
		int n = sqlsession.selectOne("IS_member.loginEnd", map);
		return n;
	}

	// 로그인 성공한 사용자 정보 가져오기
	public HashMap<String, Object> getLoginMember(HashMap<String, String> map) {
		HashMap<String, Object> loginuser = sqlsession.selectOne("IS_member.getLoginMember", map);
		return loginuser;
	}

	// 회원가입
	public int memberEnter(HashMap<String, Object> map) {
		int n = sqlsession.insert("IS_member.setMember", map);
		return n;
	}

	// 개인정보 수정
	public int editUser(HashMap<String, Object> map) {
		int n = sqlsession.update("IS_member.editUser", map);
		return n;
	}

	// 비밀번호 변경
	public int editUserEnd(HashMap<String, String> map) {
		int n = sqlsession.update("IS_member.editUserEnd", map);
		return n;
	}

	// 회원탈퇴
	public int signOutEnd(HashMap<String, String> map) {
		int n = sqlsession.update("IS_member.signOutEnd", map);
		return n;
	}
	
	// DB에서 SEQ_GUEST_WITHDRAW_REASON / WITHDRAW_REASON 값 가져오기
	public List<HashMap<String, String>> signOut() {
		List<HashMap<String, String>> list = sqlsession.selectList("IS_member.getSignOut");
		return list;
	}

	// 회원탈퇴 사유 통계를 위한 value 값 insert 해주기
	public int reasonInsert(HashMap<String, String> map) {
		int n = sqlsession.insert("IS_member.reasonInsert", map);
		return n;
	}

}
