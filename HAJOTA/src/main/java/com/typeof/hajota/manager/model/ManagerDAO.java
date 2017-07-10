package com.typeof.hajota.manager.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//===== DAO 선언 =====
@Repository
public class ManagerDAO implements InterManagerDAO {

//	===== 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;

	  
		// 게스트목록을 보여주는 메소드
		@Override
		public List<HashMap<String, Object>> ShowguestList(HashMap<String, String> map) {		
			List<HashMap<String, Object>> guestList = sqlsession.selectList("manager.ShowguestList", map);		
			return guestList;
		}
		
		// 게스트 총 회원수 구하기
		@Override
		public int getGuestCount(HashMap<String, String> map) {			
			int count = sqlsession.selectOne("manager.getGuestCount", map);			
			return count;
		}
			
		// 게스트 탈퇴시키기
		@Override
		public int guestDelete(HashMap<String, String> map) {
			int n = sqlsession.update("manager.guestDelete", map);
			return n;
		}
		
		// 게스트 복구시키기
		@Override
		public int guestRecover(HashMap<String, String> map) {
			int n = sqlsession.update("manager.guestRecover", map);
			return n;
		}

		// 호스트목록을 보여주는 메소드
		@Override
		public List<HashMap<String, Object>> ShowhostList(HashMap<String, String> map) {
			List<HashMap<String, Object>> hostList = sqlsession.selectList("manager.ShowhostList", map);		
			return hostList;
		}
		
		// 호스트 총 회원수 구하기
		@Override
		public int gethostCount(HashMap<String, String> map) {
			int count = sqlsession.selectOne("manager.gethostCount", map);
			return count;
		}

		// 호스트 탈퇴시키기
		@Override
		public int hostDelete(HashMap<String, String> map) {
			int n = sqlsession.update("manager.hostDelete", map);
			return n;
		}

		// 호스트 복구시키기
		@Override
		public int hostRecover(HashMap<String, String> map) {
			int n = sqlsession.update("manager.hostRecover", map);
			return n;
		}

		// 이벤트현황 목록을 보여주는 메소드
		@Override
		public List<HashMap<String, Object>> ShoweventList(HashMap<String, String> map) {
			List<HashMap<String, Object>> eventList = sqlsession.selectList("manager.ShoweventList", map);	
			return eventList;
		}

		// 이벤트현황 총 횟수 구하기
		@Override
		public int getEventCount(HashMap<String, String> map) {
			int count = sqlsession.selectOne("manager.getEventCount", map);
			return count;
		}

		// 이벤트게임 현황을 보여주는 메소드
		@Override
		public List<HashMap<String, Object>> ShoweventGame(HashMap<String, String> map) {
			List<HashMap<String, Object>> eventGame = sqlsession.selectList("manager.ShoweventGame", map);
			return eventGame;
		}

		// 게임 정지시키기
		@Override
		public int eventDelete(HashMap<String, String> map) {
			int n = sqlsession.update("manager.eventDelete", map);
			return n;
		}

		// 게임 복구시키기
		@Override
		public int eventRecover(HashMap<String, String> map) {
			int n = sqlsession.update("manager.eventRecover", map);
			return n;
		}

		// 돌려돌려돌림판 사용가능현황 가져오기
		@Override
		public int ShowdolGame(HashMap<String, String> map) {
			int status = sqlsession.selectOne("manager.ShowdolGame", map);
			return status;
		}
		
		// 사다리게임 사용가능현황 가져오기
		@Override
		public int ShowsadaliGame(HashMap<String, String> map) {
			int status = sqlsession.selectOne("manager.ShowsadaliGame", map);
			return status;
		}

		// 오늘 생일인 회원리스트 뽑아오기
		@Override
		public List<HashMap<String, Object>> ShowbirthUserList(HashMap<String, String> map) {
			List<HashMap<String, Object>> birthUserList = sqlsession.selectList("manager.ShowbirthUserList", map);
			return birthUserList;
		}		

		// 생일인 유저가 있는지 확인하기
		@Override
		public int getbirthUsercount(HashMap<String, String> map) {
			int cnt = sqlsession.selectOne("manager.getbirthUsercount", map);
			return cnt;
		}

		// 돌림판게임에 참여했던 기록 남기기
		@Override
		public int InsertDolGame(HashMap<String, String> map) {
			int n = sqlsession.insert("manager.InsertDolGame", map);
			return n;
		}
		
		// 사다리게임에 참여했던 기록 남기기
		@Override
		public int InsertSadaliGame(HashMap<String, String> map) {
			int n = sqlsession.insert("manager.InsertSadaliGame", map);
			return n;
		}

		// 게임에서 얻은 쿠폰 저장하기
		@Override
		public int getCoupon(HashMap<String, String> map) {
			int n = sqlsession.insert("manager.getCoupon", map);
			return n;
		}

		// 돌려돌려돌림판 참여이력
		@Override
		public int dolWanrle(HashMap<String, String> map) {
			int cnt = sqlsession.selectOne("manager.dolWanrle", map);
			return cnt;
		}

		// 사다리게임 참여이력
		@Override
		public int sadaliWanrle(HashMap<String, String> map) {
			int cnt = sqlsession.selectOne("manager.sadaliWanrle", map);
			return cnt;
		}

		// 돌려돌려돌림판에 참여하면 실행횟수 증가시키기
		@Override
		public int plusDolGame(HashMap<String, String> map) {
			int n = sqlsession.update("manager.plusDolGame");
			return n;
		}

		// 사다리게임에 참여하면 실행횟수 증가시키기
		@Override
		public int plusSadaliGame(HashMap<String, String> map) {
			int n = sqlsession.update("manager.plusSadaliGame");
			return n;
		}

		// 오늘 시간대 별로 로그인한 회원수 구하기
		@Override
		public List<HashMap<String, Object>> loginTimeCount() {
			List<HashMap<String, Object>> loginTimeCount = sqlsession.selectList("manager.loginTimeCount");
			return loginTimeCount;
		}

		// 매달 가입한 게스트의 총수
		@Override
		public List<HashMap<String, Object>> joinGuestChart() {
			List<HashMap<String, Object>> joinGuestChart = sqlsession.selectList("manager.joinGuestChart");
			return joinGuestChart;
		}
		
		
		
	
	
}