package com.typeof.hajota.manager.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SH_ManagerDAO implements SH_InterManagerDAO {

//	===== �쓽議닿컼泥� 二쇱엯�븯湲�(DI : Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<HashMap<String, Object>> Shownotice(HashMap<String, String> map) {
		
		List<HashMap<String, Object>> noticeList = sqlsession.selectList("SH_manager.Shownotice", map);
		
		return noticeList;
	}
	
    // 珥� 寃뚯떆臾� 嫄댁닔 援ы븯湲� 
	@Override
	public int getTotalCount(HashMap<String, String> map) {
		
		int count = sqlsession.selectOne("SH_manager.getTotalCount", map);
		
		return count;
	}
	
	// 怨듭��궗�빆 湲��벐湲�
	@Override
	public int noticewrite(HashMap<String, Object> map) {
		
		 int n = sqlsession.insert("SH_manager.noticewrite", map);
		  
		 return n;		
	}

	public int delete(HashMap<String, String> map) {
		
		int n = sqlsession.update("SH_manager.noticedelete", map);
		
		return n;
	}

	// notice detail
	public HashMap<String, Object> detail(HashMap<String, String> map) {
		
		HashMap<String, Object> noticedetail = sqlsession.selectOne("SH_manager.noticedetail", map);
		
		return noticedetail;
	}

	@Override
	public int change(HashMap<String, String> map) {

		int n = sqlsession.update("SH_manager.noticechange", map);
		
		return n;
	}
	
	@Override
	public List<HashMap<String, Object>> Showallqna(HashMap<String, String> map) {
		
		List<HashMap<String, Object>> allqnaList = sqlsession.selectList("SH_manager.Showallqna", map);
		
		return allqnaList;
	}
	
	 // total qna count
	@Override
	public int getTotalqnaCount(HashMap<String, String> map) {
		
		int count = sqlsession.selectOne("SH_manager.getTotalqnaCount", map);
		
		return count;
	}
		
	// qna delete
	@Override
	public int guestqnadelete(HashMap<String, String> map) {
		
		int n = sqlsession.update("SH_manager.guestqnadelete", map);
		
		return n;
	}
		
	// qna delete
	@Override
	public int hostqnadelete(HashMap<String, String> map) {
		
		int n = sqlsession.update("SH_manager.hostqnadelete", map);
		
		return n;
	}
		
	// 전체 qna detail
	public HashMap<String, Object> qnadetail(HashMap<String, String> map) {
		
		HashMap<String, Object> qnadetail = sqlsession.selectOne("SH_manager.qnadetail1", map);
		
		return qnadetail;
	}
	
	// guest qna list
	public List<HashMap<String, Object>> qnaguestshow(HashMap<String, String> map, RowBounds rowBounds) {
		
		List<HashMap<String, Object>> qnaguestlist = sqlsession.selectList("SH_manager.guestqnashow", map, rowBounds);
		
		return qnaguestlist;
	}
	
	// total guest qna count
	@Override
	public int getTotalguestqnaCount(HashMap<String, String> map) {
		
		int count = sqlsession.selectOne("SH_manager.guestqnashowCount", map);
		
		return count;
	}
	
	// guest qna detail
	public HashMap<String, Object> qnaguestdetail(HashMap<String, String> map) {
		
		HashMap<String, Object> qnaguestdetail = sqlsession.selectOne("SH_manager.qnaguestdetail2", map);
		
		return qnaguestdetail;
	}
	
	// host qna list
	public List<HashMap<String, Object>> qnahostshow(HashMap<String, String> map, RowBounds rowBounds) {
		
		List<HashMap<String, Object>> qnahostlist = sqlsession.selectList("SH_manager.hostqnashow", map, rowBounds);
		
		return qnahostlist;
	}
	
	// total host qna count
	@Override
	public int getTotalhostqnaCount(HashMap<String, String> map) {
		
		int count = sqlsession.selectOne("SH_manager.hostqnashowCount", map);
		
		return count;
	}
	
	// host qna detail
	public HashMap<String, Object> qnahostdetail(HashMap<String, String> map) {
		
		HashMap<String, Object> qnahostdetail = sqlsession.selectOne("SH_manager.qnahostdetail3", map);
		
		return qnahostdetail;
	}
	
	// index guest qna
	@Override
	public List<HashMap<String, Object>> indexguestqnaShow(RowBounds rowBounds) {
		
		List<HashMap<String, Object>> indexguestqnaList = sqlsession.selectList("SH_manager.Showguestqna", null, rowBounds);
		
		return indexguestqnaList;
	}
	
	// index host qna
	@Override
	public List<HashMap<String, Object>> indexhostqnaShow(RowBounds rowBounds) {
		
		List<HashMap<String, Object>> indexhostqnaList = sqlsession.selectList("SH_manager.Showhostqna", null, rowBounds);
		
		return indexhostqnaList;
	}
		
	// index host qna
	@Override
	public List<HashMap<String, Object>> indexnoticeShow(RowBounds rowBounds) {
		
		List<HashMap<String, Object>> indexnoticeList = sqlsession.selectList("SH_manager.Shownoticeindex", null, rowBounds);
		
		return indexnoticeList;
	}
	
	// index guest count
	@Override
	public int Guestcount() {
		
		int n = sqlsession.selectOne("SH_manager.Guestcount");
		
		return n;
	}
	
	// index guest count
	@Override
	public int Hostcount() {
		
		int t = sqlsession.selectOne("SH_manager.Hostcount");
		
		return t;
	}

	// 오늘 접속자 수 구하기
	@Override
	public int jintianCount() {
		int n = sqlsession.selectOne("SH_manager.jintianCount");
		return n;
	}
	
	////////////////////////////////////////////
	// 답변하기
	@Override
	public void answerChecker() {
		
		sqlsession.insert("SH_manager.answerChecker");
	}
	
	// 답변후 guestreplystatus 바꿔주기
	@Override
	public void guestchangeReply() {
		
		sqlsession.update("SH_manager.guestchangeReply");
	}
	
	// 답변후 hostreplystatus 바꿔주기
	@Override
	public void hostchangeReply() {
		
		sqlsession.update("SH_manager.hostchangeReply");
	}
	
	// 호스트인지 게스트인지 구분하는 메소드
	@Override
	public int checkUser() {
		
		int n = sqlsession.selectOne("SH_manager.checkUser");
		
		return n;
	}
	
	// QNA에서 관리자 이메일 가져오기
	@Override
	public String getEmail() {
		
		String email = sqlsession.selectOne("SH_manager.getEmail");
		
		return email;
	}
	
	// 답변테이블에 insert
	@Override
	public int answerInput(HashMap<String, String> map) {
		
		int n = sqlsession.insert("SH_manager.answerInput", map);
		
		return n;
	}
	
	
	// 답변을 했는지 안했는지 알아오는 메소드
	@Override
	public int AllqnaReply(HashMap<String, String> map) {

		int n = sqlsession.update("SH_manager.AllqnaReply", map);
		
		return n;
	}

	// 답변 테이블 보여주기 
	@Override
	public HashMap<String, Object> answerdetailShow(HashMap<String, String> map) {
		HashMap<String, Object> answerdetailShow = sqlsession.selectOne("SH_manager.answerdetailShow", map);
		
		return answerdetailShow;
	}		
	
	// 수입 통계
	@Override
	public List<HashMap<String, Object>> sumlist(HashMap<String, String> map) {
		List<HashMap<String, Object>> sumlist = sqlsession.selectList("SH_manager.getSum", map);
		
		return sumlist;
	}	
	
	// 인덱스 화면에 통계 보여주기
	@Override
	public int totalincome(HashMap<String, String> map) {
		int totalincome = sqlsession.selectOne("SH_manager.totalincome", map);
		
		return totalincome;
	}	
	
	// qna 보여주기
	@Override
	public List<HashMap<String, Object>> qnalistsum(HashMap<String, String> map) {
		List<HashMap<String, Object>> qnalistsum = sqlsession.selectList("SH_manager.qnalistsum", map);
		
		return qnalistsum;
	}

	// 지구본에 들어갈 Q&A 가져오기
	@Override
	public List<HashMap<String, Object>> ShowqnaList() {
		List<HashMap<String, Object>> ShowqnaList = sqlsession.selectList("SH_manager.ShowqnaList");
		
		return ShowqnaList;
	}

	// 알림을 누르면 Status변경
	@Override
	public int changeStatus(HashMap<String, String> map) {
		int changeStatus = sqlsession.update("SH_manager.changeStatus", map);
		
		return changeStatus;
	}

	// 신고 목록
	   @Override
	   public List<HashMap<String, Object>> allreportList() {
	      List<HashMap<String, Object>> allreportList = sqlsession.selectList("SH_manager.allreportList");
	      
	      return allreportList;
	   }

	   public int delreport(String reportno) {
	      
	      int n = sqlsession.update("SH_manager.delreport", reportno);
	      
	      return n;
	   }   

	// 알람 누르지 않은 갯수 구하기
	@Override
	public int LingCount() {
		int LingCount = sqlsession.selectOne("SH_manager.LingCount");
		
		return LingCount;
	}	

}