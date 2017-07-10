package com.typeof.hajota.manager.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

public interface SH_InterManagerService {

   List<HashMap<String, Object>> Shownotice(HashMap<String, String> map);   // 愿�由ъ옄媛� 怨듭��궗�빆�뿉 湲��벖 寃껋쓣 蹂댁뿬二쇰뒗 硫붿냼�뱶
   
   int getTotalCount(HashMap<String, String> map); // 珥� 寃뚯떆臾� 嫄댁닔 援ы븯湲� 
   
   int noticewrite(HashMap<String, Object> map); // 怨듭��궗�빆 湲��벐湲� 
   
   int delete(HashMap<String, String> map);   // 湲��쓣 �궘�젣�빐二쇰뒗 硫붿냼�뱶
   
   /////////////////////////////////////////////
   // 공지사항
   HashMap<String, Object> detailShow(HashMap<String, String> map);   // notice detail
   
   int noticeChange(HashMap<String, String> map);   // noticeChange
   
   /////////////////////////////////////////////
   // 전체 QNA
   List<HashMap<String, Object>> Showallqna(HashMap<String, String> map);   // all qna
   
   int getTotalqnaCount(HashMap<String, String> map); // qna total count
   
   int guestqnadelete(HashMap<String, String> map);   // qna delete
   
   int hostqnadelete(HashMap<String, String> map);   // qna delete
   
   HashMap<String, Object> qnadetailShow(HashMap<String, String> map);   // qna detail
   
   /////////////////////////////////////////////
   // 게스트 QNA
   List<HashMap<String, Object>> Showguestqna(HashMap<String, String> map, RowBounds rowBounds);   // guest qna list
   
   int getTotalguestqnaCount(HashMap<String, String> map);   // total guest qna count
   
   HashMap<String, Object> qnaguestdetailShow(HashMap<String, String> map);   // qna guest detail
   
   /////////////////////////////////////////////
   // 호스트 QNA
   List<HashMap<String, Object>> Showhostqna(HashMap<String, String> map, RowBounds rowBounds);   // host qna list
   
   int getTotalhostqnaCount(HashMap<String, String> map);   // total guest qna count
   
   HashMap<String, Object> qnahostdetailShow(HashMap<String, String> map);   // qna host detail
      
   /////////////////////////////////////////////
   // 인덱스 화면에 게스트 QNA
   List<HashMap<String, Object>> Showindexguestqna(RowBounds rowBounds);   // index guest qna
   
   // 인덱스 화면에 호스트 QNA
   List<HashMap<String, Object>> Showindexhostqna(RowBounds rowBounds);   // index host qna
   
   // 인덱스 화면에 호스트 QNA
   List<HashMap<String, Object>> Showindexnotice(RowBounds rowBounds);   // index notice
   
   // 인덱스 화면에 게스트 수 COUNT
   int guestcount();
   
   // 인덱스 화면에 호스트 수 COUNT
   int hostcount();

   // 오늘 접속자 수 구하기
   int jintianCount(); 
   
   // 지구본에 들어갈 Q&A 가져오기
   List<HashMap<String, Object>> ShowqnaList(); 
   
   // 알림을 누르면 Status변경
   int changeStatus(HashMap<String, String> map); 
   
   // 알람 누르지 않은 갯수 구하기
   int LingCount();
   
   ////////////////////////////////////////////
   // 답변하기
   void answerChecker();
   
   // 답변후 guestreplystatus 바꾸기
   void guestchangeReply();
      
   // 답변후 hostreplystatus 바꾸기
   void hostchangeReply();

   // 호스트인지 게스트인지 구분하는 메소드
   int checkUser();
   
   // QNA에서 관리자 이메일 뽑아오기
   String getEmail();
   
   // 답변에 insert 하기
   int answerInput(HashMap<String, String> map);
   
   // 답변내용을 했는지 안했는지 알아올 메소드
   int AllqnaReply(HashMap<String, String> map);

   // 답변 테이블 보여주기
   HashMap<String, Object> answerdetailShow(HashMap<String, String> map);
   
   // 수입 통계
   List<HashMap<String, Object>> getSum(HashMap<String, String> map);
   
   // 인덱스 화면에 총 수입 
   int totalincome(HashMap<String, String> map);
   
   // qna 통계
   List<HashMap<String, Object>> getSumqna(HashMap<String, String> map);
   
   // 신고 목록 
   List<HashMap<String, Object>> allreportList();
}   