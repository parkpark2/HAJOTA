package com.typeof.hajota.member.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


//===== #28. DAO 선언 =====
@Repository
public class JW_MemberDAO {

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

	public HashMap<String, Object> getLoginMember(HashMap<String, String> map) {
		
		HashMap<String, Object> loginuser = sqlsession.selectOne("member.getLoginMember", map);
		
		return loginuser;
	}
	// ==== 회원정보 수정 여부 알아오기
	public int edituserEnd(HashMap<String, String> map) {
		int n = sqlsession.update("member.edituserEnd",map);
		return n;
	}
	
	// ==== 비밀번호 찾기
	public int getUserExists(HashMap<String, String> map) {
		int n = sqlsession.selectOne("member.getUserExists",map);
		return n;
	}
	
	// 비밀번호 찾기에서 인증 후 비밀번호 변경하기
	public int updatePwdUser(HashMap<String, String> map) {
		int n = sqlsession.update("member.updatePwdUser",map);
		return n;
	}

	public int idDuplicateCheck(HashMap<String, String> map) {
		int n = sqlsession.selectOne("member.idDuplicateCheck",map);
		
		return n;
	}
	
	// wish-list 보여주기
	public List<HashMap<String, Object>> wishList(String email) {
		List<HashMap<String, Object>> list = sqlsession.selectList("member.wishList", email);
		return list;
	}
	
	// 결제목록 보여주기
	public List<HashMap<String, Object>> paymentList(String email) {
		List<HashMap<String, Object>> list = sqlsession.selectList("member.paymentList", email);
		
		return list;	
	}

	// 나의 이용후기 보여주기
	public List<HashMap<String, Object>> reviewList(String email) {
		List<HashMap<String, Object>> list = sqlsession.selectList("member.reviewList", email);
		return list;
	}
	
	// 후기목록 보여주기
	public List<HashMap<String, Object>> couponList(String email) {
		List<HashMap<String, Object>> list = sqlsession.selectList("member.couponList", email);
		return list;
	}
	
	// 질문 리스트
	public List<HashMap<String, Object>> questionList(HashMap<String, String> map) {
		List<HashMap<String, Object>> list =  sqlsession.selectList("member.questionList",map);
		return list;
	}
	
	// 수정에 필요한 질문 정보 가져오기
	public HashMap<String, Object> editList(String seq) {
		HashMap<String, Object> edit = sqlsession.selectOne("member.editList",seq);
		return edit;
	}
	
	// 글 수정 완료하기
	public int editEnd(HashMap<String, Object> map) {
		int n  = sqlsession.update("member.editEnd",map);
		return n;
	}
	
	// 글쓰기 해주는 메소드
	public int add(HashMap<String, Object> queinfo) {
		int n = sqlsession.insert("member.add",queinfo);
		return n;
	}
	
	public int getTotalCount(HashMap<String, String> map) {
		int n = sqlsession.selectOne("member.getTotalCount",map);
		return n;
	}

	public List<HashMap<String, Object>> answerList(HashMap<String, String> map) {
		List<HashMap<String, Object>> list =  sqlsession.selectList("member.answerList",map);
		return list;
	}
	
	// 로그인되면 로그인 시간정보 넣어주기
	public int insertLoginTime(HashMap<String, String> map) {
	int n = sqlsession.insert("member.insertLoginTime",map);
	return n;      
	}
	
	// 질문 정보 가져오기
	public HashMap<String, Object> questioninfo(String seq) {
		HashMap<String, Object> queinfo = sqlsession.selectOne("member.questioninfo",seq);
		return queinfo;
	}
	
	// 답변 정보 가져오기
	public HashMap<String, Object> answerinfo(String seq) {
		HashMap<String, Object> ansinfo = sqlsession.selectOne("member.answerinfo",seq);
		return ansinfo;
	}
	
	//게스트 사유서 가져오기
	public List<HashMap<String, Object>> getSignOut() {
		List<HashMap<String, Object>> list = sqlsession.selectList("member.getSignOut");
		return list;
	}
	
	//호스트 사유서 가져오기
	public List<HashMap<String, Object>> gethostSignOut() {
		List<HashMap<String, Object>> list = sqlsession.selectList("member.gethostSignOut");
		return list;
		}

	public int signOutEnd(HashMap<String, String> map) {
		int n = sqlsession.update("member.signOutEnd",map);
		return n;
	}
	// 회원 탈퇴 사유 insert
	public int reasonInsert(HashMap<String, String> map) {
		int n = sqlsession.insert("member.reasonInsert",map);
		return n;
	}

	public int qnaDel(String seq) {
		
		int del = sqlsession.update("member.qnaDel",seq);
		
		return del;
	}
	




	

	
	
	//

	
	
	
	

	
	
}
