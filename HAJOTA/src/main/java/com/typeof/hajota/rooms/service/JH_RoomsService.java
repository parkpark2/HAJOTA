package com.typeof.hajota.rooms.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.typeof.hajota.rooms.model.JH_RoomsDAO;

@Service
public class JH_RoomsService implements JH_InterRoomsService {

//	===== #31. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private JH_RoomsDAO dao;

	// 모든 숙소 리스트 가져오는 메소드
	@Override
	public List<HashMap<String, Object>> getRoomsList() {
		List<HashMap<String, Object>> roomsList = dao.getRoomsList();
		
		return roomsList;
	}

	@Override
	public List<HashMap<String, Object>> getRoomsLocationInfoList(HashMap<String, String> map) {
		List<HashMap<String, Object>> roomsLocationInfo = dao.getRoomsLocationInfoList(map);
		
		return roomsLocationInfo;
	}
}
