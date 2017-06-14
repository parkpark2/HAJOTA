package com.typeof.hajota.rooms.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class JH_RoomsDAO implements JH_InterRoomsDAO {

	//	===== #29. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;

	// 모든 숙소 리스트 가져오는 메소드
	@Override
	public List<HashMap<String, Object>> getRoomsList() {
		List<HashMap<String, Object>> roomsList = sqlsession.selectList("JH_rooms.selectRoomsList");
		
		return roomsList;
	}

	@Override
	public List<HashMap<String, Object>> getRoomsLocationInfoList(HashMap<String, String> map) {
		List<HashMap<String, Object>> roomsLocationInfo = sqlsession.selectList("JH_rooms.selectRoomsLocationInfoList", map);
		
		return roomsLocationInfo;
	}
}

