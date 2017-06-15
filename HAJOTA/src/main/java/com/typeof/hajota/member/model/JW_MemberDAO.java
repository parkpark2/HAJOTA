package com.typeof.hajota.member.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


//===== #28. DAO 선언 =====
@Repository
public class JW_MemberDAO implements InterMemberDAO {

//	===== #29. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// 회원가입 완료
	public int joinEnd(HashMap<String, String> map) {
		int n = sqlsession.insert("member.joinEnd",map);
		return n;
	}

//	===== #42. 메인페이지용 이미지 파일이름을 가져오는 모델단 List<String> getImgfilenameList() 메소드 생성하기 ===== 	
	public List<String> getImgfilenameList() {
		List<String> list = sqlsession.selectList("member.getImgfilenameList");
		return list;
	}
	
	// ===== #47. 로그인 여부 알아오기 =====
	public int loginEnd(HashMap<String, String> map) {
		int n = sqlsession.selectOne("member.loginEnd", map);
		return n;
	}

	public HashMap<String, String> getLoginMember(String guest_email) {
		
		HashMap<String, String> map = sqlsession.selectOne("member.getLoginMember", guest_email);
		return map;
	}
	
	
	
	

	
	
}
