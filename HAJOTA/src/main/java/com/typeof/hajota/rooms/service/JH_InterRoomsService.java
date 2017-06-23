package com.typeof.hajota.rooms.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

public interface JH_InterRoomsService {
	
	// 검색 조건에 맞는 모든 숙소 리스트 가져오는 메소드
	List<HashMap<String, Object>> getRoomsList(HashMap<String, Object> map);
	
	// (지역, 인원, 기간내) 이용 가능한 숙소 리스트 가져오는 메소드
	List<HashMap<String, Object>> getAvailableRoomsList(HashMap<String, Object> map);
	
	List<HashMap<String, Object>> getAvailableRoomsList(HashMap<String, Object> map, RowBounds rowBounds);

	// 기간 내 이용 가능하지 못하는 숙소 시퀀스 가져오는 메소드
	List<HashMap<String, Object>> getUnavailableSeqLodgeList(HashMap<String, Object> map);

	// 맵의 중심에서 가까운 숙소 리스트 구하는 메소드
	List<HashMap<String, Object>> getNearFromCenterRoomsList(HashMap<String, Object> map);

	// 이용 가능한 숙소 리스트 가져오는 메소드
	int getAvailableRoomsCount(HashMap<String, Object> map);

	// 위시리스트에 해당 숙소가 있는지 확인하는 메소드 
	int checkWishList(HashMap<String, Object> map);

	// 위시리스트에 해당 숙소를 추가해주는 메소드
	int insertWishList(HashMap<String, Object> map);

	// 위시리스트에 해당 숙소를 삭제(상태변경)해주는 메소드
	int updateWishList(HashMap<String, Object> map);

	// 위시리스트에 해당 숙소의 상태를 가져오는 메소드
	int getWishListStatus(HashMap<String, Object> map);
	
	// 현재 리스트에서 위시리스트 보여주는 메소드
	List<HashMap<String, Object>> getWishListInList(HashMap<String, Object> map, RowBounds rowBounds);

/*	// 숙소 입력 메소드
	int setRoom(HashMap<String, Object> map);

	// 숙소 수정 메소드
	int modifyRoom(HashMap<String, Object> map);*/
}
