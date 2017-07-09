package com.typeof.hajota.manager.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.typeof.hajota.manager.model.ManagerDAO;

@Service
public class ManagerService implements InterManagerService {

//	===== 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private ManagerDAO dao;

	// 게스트목록을 보여주는 메소드
	@Override
	public List<HashMap<String, Object>> ShowguestList(HashMap<String, String> map) {
		
		List<HashMap<String, Object>> guestList = dao.ShowguestList(map);
		
		return guestList;
	}
	
	// 게스트 총 회원수 구하기
	@Override
	public int getGuestCount(HashMap<String, String> map) {
		int count = dao.getGuestCount(map);
		return count;
	}

	// 게스트 탈퇴시키기
	@Override
	public int guestDelete(HashMap<String, String> map) {
		int delete = dao.guestDelete(map);
		return delete;
	}

	// 게스트 복구시키기
	@Override
	public int guestRecover(HashMap<String, String> map) {
		int recover = dao.guestRecover(map);
		return recover;
	}
	
	// 호스트목록을 보여주는 메소드
	@Override
	public List<HashMap<String, Object>> ShowhostList(HashMap<String, String> map) {
		List<HashMap<String, Object>> houstList = dao.ShowhostList(map);
		
		return houstList;		
	}

	// 호스트 총 회원수 구하기
	@Override
	public int gethostCount(HashMap<String, String> map) {
		int count = dao.gethostCount(map);
		return count;
	}

	// 호스트 탈퇴시키기
	@Override
	public int hostDelete(HashMap<String, String> map) {
		int delete = dao.hostDelete(map);
		return delete;
	}

	// 호스트 복구시키기
	@Override
	public int hostRecover(HashMap<String, String> map) {
		int recover = dao.hostRecover(map);
		return recover;
	}

	// 이벤트현황 목록을 보여주는 메소드
	@Override
	public List<HashMap<String, Object>> ShoweventList(HashMap<String, String> map) {
		List<HashMap<String, Object>> eventList = dao.ShoweventList(map);		
		return eventList;
	}

	// 이벤트현황 총 횟수 구하기
	@Override
	public int getEventCount(HashMap<String, String> map) {
		int count = dao.getEventCount(map);
		return count;
	}

	// 이벤트게임 현황을 보여주는 메소드
	@Override
	public List<HashMap<String, Object>> ShoweventGame(HashMap<String, String> map) {
		List<HashMap<String, Object>> eventGame = dao.ShoweventGame(map);
		return eventGame;
	}

	// 게임 정지시키기
	@Override
	public int eventDelete(HashMap<String, String> map) {
		int delete = dao.eventDelete(map);
		return delete;
	}

	// 게임 복구시키기
	@Override
	public int eventRecover(HashMap<String, String> map) {
		int recover = dao.eventRecover(map);
		return recover;
	}

	// 돌려돌려돌림판 사용가능현황 가져오기
	@Override
	public int ShowdolGame(HashMap<String, String> map) {
		int status = dao.ShowdolGame(map);
		return status;
	}

	// 사다리게임 사용가능현황 가져오기
	@Override
	public int ShowsadaliGame(HashMap<String, String> map) {
		int status = dao.ShowsadaliGame(map);
		return status;
	}

	// 오늘 생일인 회원리스트 뽑아오기
	@Override
	public List<HashMap<String, Object>> ShowbirthUserList(HashMap<String, String> map) {
		List<HashMap<String, Object>> birthUserList = dao.ShowbirthUserList(map);
		return birthUserList;
	}	
	

	// 생일인 유저가 있는지 확인하기
	@Override
	public int getbirthUsercount(HashMap<String, String> map) {
		int cnt = dao.getbirthUsercount(map);
		return cnt;
	}

	// 돌림판게임에 참여했던 기록 남기기
	@Override
	public int InsertDolGame(HashMap<String, String> map) {
		int n = dao.InsertDolGame(map);
		return n;
	}

	// 게임에서 얻은 쿠폰 저장하기
	@Override
	public int getCoupon(HashMap<String, String> map) {
		int n = dao.getCoupon(map);
		return n;
	}

	// 돌려돌려돌림판 참여이력
	@Override
	public int dolWanrle(HashMap<String, String> map) {
		int n = dao.dolWanrle(map);
		return n;
	}

	// 사다리게임 참여이력
	@Override
	public int sadaliWanrle(HashMap<String, String> map) {
		int n = dao.sadaliWanrle(map);
		return n;
	}
	
	// 돌려돌려돌림판에 참여하면 실행횟수 증가시키기
	@Override
	public int plusDolGame(HashMap<String, String> map) {
		int plus = dao.plusDolGame(map);
		return plus;
	}

	// 사다리게임에 참여하면 실행횟수 증가시키기
	@Override
	public int plusSadaliGame(HashMap<String, String> map) {
		int plus = dao.plusSadaliGame(map);
		return plus;
	}

	
}
