package com.typeof.hajota.rooms.model;

import java.util.HashMap;
import java.util.List;

public interface JH_InterRoomsDAO {
	
	// 모든 숙소 리스트 가져오는 메소드
	List<HashMap<String, Object>> getRoomsList();
	
	List<HashMap<String, Object>> getRoomsLocationInfoList(HashMap<String, String> map);
}