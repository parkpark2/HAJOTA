package com.typeof.hajota.rooms.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

public interface JH_InterRoomsDAO {
	
	// 모든 숙소 리스트 가져오는 메소드
	List<HashMap<String, Object>> getRoomsList(HashMap<String, Object> map);
	
	// (지역, 인원, 기간내) 이용 가능한 숙소 리스트 가져오는 메소드
	List<HashMap<String, Object>> getAvailableRoomsList(HashMap<String, Object> map);
	
	List<HashMap<String, Object>> getAvailableRoomsList(HashMap<String, Object> map, RowBounds rowBounds);

	// 기간 내 이용 가능하지 못하는 숙소 시퀀스 가져오는 메소드
	List<HashMap<String, Object>> getUnvailableSeqLodgeList(HashMap<String, Object> map);

	// 맵의 중심에서 가까운 숙소 리스트 구하기
	List<HashMap<String, Object>> getNearFromCenterRoomsList(HashMap<String, Object> map);

	// 이용 가능한 숙소 리스트 가져오는 메소드
	int getAvailableRoomsCount(HashMap<String, Object> map);

/*	// 숙소 입력 메소드
	int setRoom(HashMap<String, Object> map);

	// 숙소 수정 메소드
	int modifyRoom(HashMap<String, Object> map);*/
}
