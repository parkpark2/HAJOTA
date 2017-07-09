package com.typeof.hajota.manager.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

public interface SH_InterManagerDAO {

	List<HashMap<String, Object>> Shownotice(HashMap<String, String> map);	// 愿�由ъ옄媛� 怨듭��궗�빆�뿉 湲��벖 寃껋쓣 蹂댁뿬二쇰뒗 硫붿냼�뱶
	
	int getTotalCount(HashMap<String, String> map); // 珥� 寃뚯떆臾� 嫄댁닔 援ы븯湲� 
	
	int noticewrite(HashMap<String, Object> map);	// 怨듭��궗�빆 湲��벐湲�
	
	int delete(HashMap<String, String> map);	// 湲� �궘�젣�빐二쇰뒗 硫붿냼�뱶
	
	/////////////////////////////////////////////
	// 공지사항
	public HashMap<String, Object> detail(HashMap<String, String> map);	// notice detail
	
	int change(HashMap<String, String> map);	// noticechange
	
	/////////////////////////////////////////////
	// 전체 QNA
	List<HashMap<String, Object>> Showallqna(HashMap<String, String> map); // all qna
	
	int getTotalqnaCount(HashMap<String, String> map); // 珥� 寃뚯떆臾� 嫄댁닔 援ы븯湲�
	
	int guestqnadelete(HashMap<String, String> map);	// guest qna delete
	
	int hostqnadelete(HashMap<String, String> map);	// host qna delete
	
	HashMap<String, Object> qnadetail(HashMap<String, String> map);	// 전체 qna detail
	
	/////////////////////////////////////////////
	// 게스트 QNA
	List<HashMap<String, Object>> qnaguestshow(HashMap<String, String> map, RowBounds rowBounds); // guest qna list
	
	int getTotalguestqnaCount(HashMap<String, String> map);	// guest total count 
	
	HashMap<String, Object> qnaguestdetail(HashMap<String, String> map);	// guest qna detail
	
	/////////////////////////////////////////////
	// 호스트 QNA
	List<HashMap<String, Object>> qnahostshow(HashMap<String, String> map, RowBounds rowBounds); // host qna list

	int getTotalhostqnaCount(HashMap<String, String> map);	// host total count
	
	HashMap<String, Object> qnahostdetail(HashMap<String, String> map);	// host qna detail
		
	/////////////////////////////////////////////
	// 인덱스
	public List<HashMap<String, Object>> indexguestqnaShow(RowBounds rowBounds);  // 인덱스 화면에 게스트 QNA
	
	// 인덱스
	public List<HashMap<String, Object>> indexhostqnaShow(RowBounds rowBounds);	// 인덱스 화면에 호스트 QNA
	
	// 인덱스
	public List<HashMap<String, Object>> indexnoticeShow(RowBounds rowBounds);	// 인덱스 화면에 공지사항 
	
	public int Guestcount(); // 인덱스 화면에 게스트 count
	
	public int Hostcount(); // 인덱스 화면에 호스트 count
	
	////////////////////////////////////////////	
	void answerChecker(); // 답변하기
	
	void guestchangeReply();	// 답변 후 guestreplystatus 바꿔주기
	
	void hostchangeReply();	// 답변 후 hostreplystatus 바꿔주기
	
	int checkUser();	// 호스트 인지 게스트인지 구분하는 메소드
	
	String getEmail();	// QNA에서 관리자 이메일 가져오기
	
	int answerInput(HashMap<String, String> map);	// 답변 테이블에 insert
	
	int AllqnaReply(HashMap<String, String> map);	// 답변 했는지 안했는지 유무

	HashMap<String, Object> answerdetailShow(HashMap<String, String> map);	// 답변 테이블 보여주기
		
	// QNAList에 답변이 완료되었으면 카운트 0 or 카운트 1로 하기로하자 [0] or [1]
	//public int reply(HashMap<String, String> map);
	
	// 호스트 인지 게스트인지 체크
	//int check(HashMap<String, String> map);
}
