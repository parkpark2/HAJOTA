package com.typeof.hajota.manager.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.typeof.hajota.manager.model.SH_ManagerDAO;

@Service
public class SH_ManagerService implements SH_InterManagerService {

//   ===== #31. �쓽議닿컼泥� 二쇱엯�븯湲�(DI : Dependency Injection) =====
   @Autowired
   private SH_ManagerDAO dao;

   // 愿�由ъ옄媛� 怨듭��궗�빆�뿉 湲��벖 寃껋쓣 蹂댁뿬二쇰뒗 硫붿냼�뱶
   @Override
   public List<HashMap<String, Object>> Shownotice(HashMap<String, String> map) {
      
      List<HashMap<String, Object>> noticeList = dao.Shownotice(map);
      
      return noticeList;
   }
   
   // 珥� 寃뚯떆臾� 嫄댁닔 援ы븯湲�  
   @Override
   public int getTotalCount(HashMap<String, String> map) {
      int count = dao.getTotalCount(map);
      return count;
   }

   // 怨듭��궗�빆 湲��벐湲� 
   @Override
   public int noticewrite(HashMap<String, Object> map) {
      
      int n = dao.noticewrite(map); 
            
      return n;
   }

   public int delete(HashMap<String, String> map) {
      
      int n = dao.delete(map);
      
      return n;
   }

   // notice detail
   public HashMap<String, Object> detailShow(HashMap<String, String> map) {
      
      HashMap<String, Object> noticedetail = dao.detail(map);
      
      return noticedetail;
   }
   
   // notice change
   @Override
   public int noticeChange(HashMap<String, String> map) {

      int n = dao.change(map);
      
      return n;
   }
   
   // all qna
   @Override
   public List<HashMap<String, Object>> Showallqna(HashMap<String, String> map) {
      
      List<HashMap<String, Object>> allqnaList = dao.Showallqna(map);
      
      return allqnaList;
   }
   
   // total qna count
   @Override
   public int getTotalqnaCount(HashMap<String, String> map) {
      int count = dao.getTotalqnaCount(map);
      return count;
   }
   
   // guest status delete
   @Override
   public int guestqnadelete(HashMap<String, String> map) {
      
      int n = dao.guestqnadelete(map);
      
      return n;
   }
   
   // host status delete
   @Override
   public int hostqnadelete(HashMap<String, String> map) {
      
      int n = dao.hostqnadelete(map);
      
      return n;
   }
   
   // 전체 qna detail
   @Override
   public HashMap<String, Object> qnadetailShow(HashMap<String, String> map) {
      
      HashMap<String, Object> qnadetail = dao.qnadetail(map);
      
      return qnadetail;
   }
   
   // guest qna list
   @Override
   public List<HashMap<String, Object>> Showguestqna(HashMap<String, String> map, RowBounds rowBounds) {
      
      List<HashMap<String, Object>> qnaguestlist = dao.qnaguestshow(map, rowBounds);
      
      return qnaguestlist;
   }
   
   // total guest qna count
   @Override
   public int getTotalguestqnaCount(HashMap<String, String> map) {
      int count = dao.getTotalguestqnaCount(map);
      return count;
   }
   
   // guest qna detail
   @Override
   public HashMap<String, Object> qnaguestdetailShow(HashMap<String, String> map) {
      
      HashMap<String, Object> qnaguestdetail = dao.qnaguestdetail(map);
      
      return qnaguestdetail;
   }
      
   // host qna list
   @Override
   public List<HashMap<String, Object>> Showhostqna(HashMap<String, String> map, RowBounds rowBounds) {
      
      List<HashMap<String, Object>> qnahostlist = dao.qnahostshow(map, rowBounds);
      
      return qnahostlist;
   }
   
   // total guest qna count
   @Override
   public int getTotalhostqnaCount(HashMap<String, String> map) {
      int count = dao.getTotalhostqnaCount(map);
      return count;
   }
   
   
   // host qna detail
   @Override
   public HashMap<String, Object> qnahostdetailShow(HashMap<String, String> map) {
      
      HashMap<String, Object> qnahostdetail = dao.qnahostdetail(map);
      
      return qnahostdetail;
   }
   
   // index guest qna
   @Override
   public List<HashMap<String, Object>> Showindexguestqna(RowBounds rowBounds) {
      
      List<HashMap<String, Object>> indexguestqnaList = dao.indexguestqnaShow(rowBounds);
      
      return indexguestqnaList;
   }
   
   // index host qna
   @Override
   public List<HashMap<String, Object>> Showindexhostqna(RowBounds rowBounds) {
      
      List<HashMap<String, Object>> indexhostqnaList = dao.indexhostqnaShow(rowBounds);
      
      return indexhostqnaList;
   }
   
   // index host qna
   @Override
   public List<HashMap<String, Object>> Showindexnotice(RowBounds rowBounds) {
      
      List<HashMap<String, Object>> indexnoticeList = dao.indexnoticeShow(rowBounds);
      
      return indexnoticeList;
   }
   
   // index guest count
   @Override
   public int guestcount() {
      
      int n = dao.Guestcount();
      
      return n;
   }
   
   // index host count
   @Override
   public int hostcount() {
      
      int t = dao.Hostcount();
      
      return t;
   }
   
   // 오늘 접속자 수 구하기
   @Override
   public int jintianCount() {
      int n = dao.jintianCount();
      return n;
   }

   ////////////////////////////////////////////
   // 답변하기
   @Override
   public void answerChecker() {
      
      dao.answerChecker();

   }
   
   // 답변후 guestreplystatus 바꾸기
   @Override
   public void guestchangeReply() {
      
      dao.guestchangeReply();
   }
   
   // 답변후 hostreplystatus 바꾸기
      @Override
      public void hostchangeReply() {
         
         dao.hostchangeReply();
      }
   
   // 호스트인지 게스트인지 구분하는 메소드
   @Override 
   public int checkUser() {
      
      int n = dao.checkUser();
      
      return n;
   }
   
   // QNA에서 관리자 email 뽑아오기
   @Override
   public String getEmail() {
      
      String email = dao.getEmail();
      
      return email;
   }

   // 답변테이블에 insert
   @Override
   public int answerInput(HashMap<String, String> map) {
      
      int n = dao.answerInput(map);
      
      return n;
   }
   
   // 답변을 했는지 안했는지 알아오는 메소드
   @Override
   public int AllqnaReply(HashMap<String, String> map) {
      
      int n = dao.AllqnaReply(map);
      
      return n;
   }

   // 답변 테이블 보여주기
   @Override
   public HashMap<String, Object> answerdetailShow(HashMap<String, String> map) {
      
      HashMap<String, Object> answerdetailShow = dao.answerdetailShow(map);
      
      return answerdetailShow;
   }
   
   // 수입 통계
   @Override
   public List<HashMap<String, Object>> getSum(HashMap<String, String> map) {
      
      List<HashMap<String, Object>> sumlist = dao.sumlist(map);
      
      return sumlist;
   }
   
   // 인덱스 화면에 총 수입 보여주기
   public int totalincome(HashMap<String, String> map) {
      
      int totalincome = dao.totalincome(map);
      
      return totalincome;
   }
   
   // qna 통계
   @Override
   public List<HashMap<String, Object>> getSumqna(HashMap<String, String> map) {
      
      List<HashMap<String, Object>> qnalist = dao.qnalistsum(map);
      
      return qnalist;
   }

   // 지구본에 들어갈 Q&A 가져오기
   @Override
   public List<HashMap<String, Object>> ShowqnaList() {
      List<HashMap<String, Object>> ShowqnaList = dao.ShowqnaList();
      return ShowqnaList;
   }

   // 알림을 누르면 Status변경
   @Override
   public int changeStatus(HashMap<String, String> map) {
      int changeStatus = dao.changeStatus(map);
      
      return changeStatus;
   }
   
   // 신고 목록
    @Override
    public List<HashMap<String, Object>> allreportList() {
       
       List<HashMap<String, Object>> allreportList = dao.allreportList();
       
       return allreportList;
    }

    public int delreport(String reportno) {

       int n = dao.delreport(reportno);
       
       return n;
    }

    // 알람 누르지 않은 갯수 구하기
   @Override
   public int LingCount() {
      int LingCount = dao.LingCount();
      
      return LingCount;
   }
   
   

   
}