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
		List<HashMap<String, Object>> roomsList = dao.getRoomsList(map);
		
		return roomsList;
	}

	@Override
	public List<HashMap<String, Object>> getAvailableRoomsList(HashMap<String, Object> map) {
		List<HashMap<String, Object>> roomsList = dao.getAvailableRoomsList(map);
		
		return roomsList;
	}
	
	@Override
	public List<HashMap<String, Object>> getAvailableRoomsList(HashMap<String, Object> map, RowBounds rowBounds) {
		List<HashMap<String, Object>> roomsList = dao.getAvailableRoomsList(map, rowBounds);
		
		return roomsList;
	}

	@Override
	public List<HashMap<String, Object>> getUnavailableSeqLodgeList(HashMap<String, Object> map) {
		List<HashMap<String, Object>> seq_lodgeList = dao.getUnavailableSeqLodgeList(map);
		
		return seq_lodgeList;
	}

	//@Override
	public List<HashMap<String, Object>> getNearFromCenterRoomsList(HashMap<String, Object> map) {
		List<HashMap<String, Object>> roomsList = dao.getNearFromCenterRoomsList(map);
		
		return roomsList;
	}

	@Override
	public int getAvailableRoomsCount(HashMap<String, Object> map) {
		int count = dao.getAvailableRoomsCount(map);
		
		return count;
	}
	
	@Override
	public int setRoom(HashMap<String, Object> map) {
		int count = dao.setRoom(map);
		
		return count;
	}

	@Override
	public int checkWishList(HashMap<String, Object> map) {
		int count = dao.checkWishList(map);
		
		return count;
	}

	@Override
	public int insertWishList(HashMap<String, Object> map) {
		int result = dao.insertWishList(map);
		
		return result;
	}

	@Override
	public int updateWishList(HashMap<String, Object> map) {
		int result = dao.updateWishList(map);
		
		return result;
	}

	@Override
	public int getWishListStatus(HashMap<String, Object> map) {
		int status = dao.getWishListStatus(map);
		
		return status;
	}

	@Override
	public List<HashMap<String, Object>> getWishListInList(HashMap<String, Object> map, RowBounds rowBounds) {
		List<HashMap<String, Object>> roomsWishListInList = dao.getWishListInList(map, rowBounds);
		
		return roomsWishListInList;
	}

	@Override
	public int addFile(HashMap<String, String> map) {
		int n = dao.addFile(map);

		return n;
	}

	@Override
	public HashMap<String, Object> getRoom(HashMap<String, Object> map) {
		HashMap<String, Object> roomInfo = dao.getRoom(map);
		
		return roomInfo;
	}
	
	public HashMap<String, Object> getRoomInfoBySeq(HashMap<String, Object> map) {
		HashMap<String, Object> roomInfo = dao.getRoomInfoBySeq(map);
		
		return roomInfo;
	}

	public HashMap<String, Object> getLatelySeqLodge() {
		HashMap<String, Object> roomSeq = dao.getLatelySeqLodge();
		
		return roomSeq;
	}

	public int getNearFromCenterRoomsCount(HashMap<String, Object> map) {
		int count = dao.getNearFromCenterRoomsCount(map);
		
		return count;
	}
	
	/*
	@Override
	public int modifyRoom(HashMap<String, Object> map) {
		int count = dao.modifyRoom(map);
		
		return count;
	}*/
}
