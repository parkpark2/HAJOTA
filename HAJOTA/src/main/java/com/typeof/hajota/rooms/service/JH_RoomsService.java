package com.typeof.hajota.rooms.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.typeof.hajota.rooms.model.JH_RoomsDAO;

@Service
public class JH_RoomsService implements JH_InterRoomsService {

//	===== #31. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private JH_RoomsDAO dao;

	@Override
	public List<HashMap<String, Object>> getRoomsList(HashMap<String, Object> map) {
		List<HashMap<String, Object>> roomsList = null;//dao.getRoomsList(map);
		
		return roomsList;
	}

	@Override
	public List<HashMap<String, Object>> getAvailableRoomsList(HashMap<String, Object> map) {
		List<HashMap<String, Object>> roomsList = null;//dao.getAvailableRoomsList(map);
		
		return roomsList;
	}
	
	@Override
	public List<HashMap<String, Object>> getAvailableRoomsList(HashMap<String, Object> map, RowBounds rowBounds) {
		List<HashMap<String, Object>> roomsList = null;//dao.getAvailableRoomsList(map, rowBounds);
		
		return roomsList;
	}

	@Override
	public List<HashMap<String, Object>> getUnavailableSeqLodgeList(HashMap<String, Object> map) {
		List<HashMap<String, Object>> seq_lodgeList = null;//dao.getUnvailableSeqLodgeList(map);
		
		return seq_lodgeList;
	}

	@Override
	public List<HashMap<String, Object>> getNearFromCenterRoomsList(HashMap<String, Object> map) {
		List<HashMap<String, Object>> roomsList = null;//dao.getNearFromCenterRoomsList(map);
		
		return roomsList;
	}

	@Override
	public int getAvailableRoomsCount(HashMap<String, Object> map) {
		int count = 0;//dao.getAvailableRoomsCount(map);
		
		return count;
	}
	/*
	@Override
	public int setRoom(HashMap<String, Object> map) {
		int count = dao.setRoom(map);
		
		return count;
	}
	
	@Override
	public int modifyRoom(HashMap<String, Object> map) {
		int count = dao.modifyRoom(map);
		
		return count;
	}*/
}
