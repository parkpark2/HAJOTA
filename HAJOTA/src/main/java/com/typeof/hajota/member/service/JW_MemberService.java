package com.typeof.hajota.member.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.typeof.hajota.member.model.JW_MemberDAO;

@Service
public class JW_MemberService  {

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
	public HashMap<String, Object> getLoginMember(HashMap<String, String> map) {
		HashMap<String, Object> loginuser = dao.getLoginMember(map);
		return loginuser;
	}
	// ==== 회원정보 수정 여부 알아오기 ====
	public int edituserEnd(HashMap<String, String> map) {
		int n = dao.edituserEnd(map);
		return n;
	}
//  비밀번호 찾기시 인증번호를 메일로 발송하기 전
	// userid 와 email 을 입력받아서 사용자가 존재하는지 여부를 알려주는 메소드 생성하기 
	public int getUserExists(HashMap<String, String> map) {
		int n = dao.getUserExists(map);
		return n;
	}
	// 비밀번호 찾기에서 인증후 비번 변경하기
	public int updatePwdUser(HashMap<String, String> map) {
		int n = dao.updatePwdUser(map);
		return n;
	}

	public int idDuplicateCheck(HashMap<String, String> map) {
		int n = dao.idDuplicateCheck(map);
		return n;
	}
	
	// wish-list 보여주기
		public List<HashMap<String, Object>> wishList(String email) {
			List<HashMap<String, Object>> list = dao.wishList(email);
			return list;
		}
	
	// 결제 리스트 보여주기
	public List<HashMap<String, Object>> paymentList(String email) {
		List<HashMap<String, Object>> list = dao.paymentList(email);
		
		return list;
	}
	
	// 나의 이용후기 보여주기
	public List<HashMap<String, Object>> reviewList(String email) {
		List<HashMap<String, Object>> list = dao.reviewList(email);
		return list;
	}

	// 쿠폰 리스트 보여주기
	public List<HashMap<String, Object>> couponList(String email) {
		List<HashMap<String, Object>> list =  dao.couponList(email);
		return list;
	}
	
	// 질문 목록 보여주기(검색어, 페이징 포함)
	public List<HashMap<String, Object>> questionList(HashMap<String, String> map) {
		List<HashMap<String, Object>> list = dao.questionList(map);
		return list;
	}
	
	// 수정에 필요한 질문 정보 가져오기
	public HashMap<String, Object> editList(String seq) {
		HashMap<String, Object> edit = dao.editList(seq);
		return edit;
	}
	// 글쓰기 ,  답변 글쓰기
	public int add(HashMap<String, Object> queinfo) {
		
		int n = dao.add(queinfo);
		
		return n;
	}

	// 총 게시물 건수 구하기
	public int getTotalCount(HashMap<String, String> map) {
		int n = dao.getTotalCount(map);
		return n;
	}

	public List<HashMap<String, Object>> answerList(HashMap<String, String> map) {
		List<HashMap<String, Object>> list = dao.answerList(map);
		return list;
	}
	
	// 로그인되면 로그인 시간정보 넣어주기
	public int insertLoginTime(HashMap<String, String> map) {
	int n = dao.insertLoginTime(map);
	return n;
	}
	
	// 질문 정보 가져오기
	public HashMap<String, Object> questioninfo(String seq) {
		HashMap<String, Object> queinfo = dao.questioninfo(seq);
		return queinfo;
	}
	
	// 답변 정보 가져오기
	public HashMap<String, Object> answerinfo(String seq) {
		HashMap<String, Object> ansinfo = dao.answerinfo(seq);
		return ansinfo;
	}
	
	// 글 수정 완료하기
	public int editEnd(HashMap<String, Object> map) {
		int n = dao.editEnd(map);
		return n;
	}

	//	게스트 사유서 가져오기
	public List<HashMap<String, Object>> getSignOut() {
		List<HashMap<String, Object>> list = dao.getSignOut();
		return list;
	}
	//	호스트 사유서 가져오기
	public List<HashMap<String, Object>> gethostSignOut() {
		List<HashMap<String, Object>> list = dao.gethostSignOut();
		return list;
	}
	
	// 회원 탈퇴하기
	public int signOutEnd(HashMap<String, String> map) {
		int n = dao.signOutEnd(map);
		return n;
	}
	
	// 회원 탈퇴 사유 insert
	public int reasonInsert(HashMap<String, String> map) {
		int n = dao.reasonInsert(map);
		return n;
	}
	
	

	// 글 삭제
	public int qnaDel(String seq) {
		int del = dao.qnaDel(seq);
		return del;
	}


	
	
	
}
