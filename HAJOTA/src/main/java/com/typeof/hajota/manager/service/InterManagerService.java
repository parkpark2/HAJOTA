package com.typeof.hajota.manager.service;

import java.util.HashMap;
import java.util.List;

public interface InterManagerService {
	
	List<HashMap<String, Object>> ShowguestList(HashMap<String, String> map); // 게스트목록을 보여주는 메소드
	
	int getGuestCount(HashMap<String, String> map); // 게스트 총 회원수 구하기
	
	int guestDelete(HashMap<String, String> map); // 게스트 탈퇴시키기
	
	int guestRecover(HashMap<String, String> map); // 게스트 복구시키기
	
	List<HashMap<String, Object>> ShowhostList(HashMap<String, String> map); // 호스트목록을 보여주는 메소드
	
	int gethostCount(HashMap<String, String> map); // 호스트 총 회원수 구하기
	
	int hostDelete(HashMap<String, String> map); // 호스트 탈퇴시키기
	
	int hostRecover(HashMap<String, String> map); // 호스트 복구시키기
	
	List<HashMap<String, Object>> ShoweventList(HashMap<String, String> map); // 이벤트현황 목록을 보여주는 메소드
	
	int getEventCount(HashMap<String, String> map); // 이벤트현황 총 횟수 구하기
	
	List<HashMap<String, Object>> ShoweventGame(HashMap<String, String> map); // 이벤트게임 현황을 보여주는 메소드
	
	int eventDelete(HashMap<String, String> map); // 게임 정지시키기
	
	int eventRecover(HashMap<String, String> map); // 게임 복구시키기
	
	int ShowdolGame(HashMap<String, String> map); // 돌려돌려돌림판 사용가능현황 가져오기
	int ShowsadaliGame(HashMap<String, String> map); // 사다리게임 사용가능현황 가져오기
	
	List<HashMap<String, Object>> ShowbirthUserList(HashMap<String, String> map); //오늘 생일인 회원리스트 뽑아오기
	
	int getbirthUsercount(HashMap<String, String> map); // 생일인 유저가 있는지 확인하기
	
	int InsertDolGame(HashMap<String, String> map); // 돌림판게임에 참여했던 기록 남기기
	
	int getCoupon(HashMap<String, String> map); // 게임에서 얻은 쿠폰 저장하기
	
	int dolWanrle(HashMap<String, String> map); // 돌려돌려돌림판 참여이력
	
	int sadaliWanrle(HashMap<String, String> map); // 사다리게임 참여이력
	
	int plusDolGame(HashMap<String, String> map); // 돌려돌려돌림판에 참여하면 실행횟수 증가 시키기
	int plusSadaliGame(HashMap<String, String> map); // 사다리게임에 참여하면 실행횟수 증가 시키기

	}
