package com.typeof.hajota.rooms.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class JH_RoomsDAO implements JH_InterRoomsDAO {

	//	===== #29. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	// 모든 숙소 리스트 가져오는 메소드
	@Override
	public List<HashMap<String, Object>> getRoomsList(HashMap<String, Object> map) {
		List<HashMap<String, Object>> roomsList = sqlsession.selectList("JH_rooms.selectRoomsList", map);
		
		return roomsList;
	}

	@Override
	public List<HashMap<String, Object>> getAvailableRoomsList(HashMap<String, Object> map) {
		List<HashMap<String, Object>> roomsList = sqlsession.selectList("JH_rooms.selectAvailableRoomsList", map);
		
		return roomsList;
	}
	
	@Override
	public List<HashMap<String, Object>> getAvailableRoomsList(HashMap<String, Object> map, RowBounds rowBounds) {
		List<HashMap<String, Object>> roomsList = sqlsession.selectList("JH_rooms.selectAvailableRoomsList", map, rowBounds);
		
		return roomsList;
	}

	@Override
	public List<HashMap<String, Object>> getUnavailableSeqLodgeList(HashMap<String, Object> map) {
		List<HashMap<String, Object>> seq_lodgeList = sqlsession.selectList("JH_rooms.selectUnavailableSeqLodgeList", map);
		
		return seq_lodgeList;
	}

	@Override
	public List<HashMap<String, Object>> getNearFromCenterRoomsList(HashMap<String, Object> map) {
		List<HashMap<String, Object>> roomsList = sqlsession.selectList("JH_rooms.selectNearFromCenterRoomsList", map);
		
		return roomsList;
	}

	@Override
	public int getAvailableRoomsCount(HashMap<String, Object> map) {
		int count = sqlsession.selectOne("JH_rooms.selectAvailableRoomsCount", map);
		
		return count;
	}
	
	// 숙소 예약
	@Override
	public int setRoom(HashMap<String, Object> map) {
		// autoCommit 취소 아님
		int count = sqlsession.insert("JH_rooms.insertLodge", map);
		
		if(count == 1) {
			count = sqlsession.insert("JH_rooms.insertLodgeIntro", map);
			
			if(count == 1) {
				count = sqlsession.insert("JH_rooms.insertLodgeDetail", map);
				
				if(count == 1) {
					count = sqlsession.insert("JH_rooms.insertLodgeDetail2", map);
				}
			}			
		}
		
		return count;
	}
	/*
	// 숙소 예약
	@Override
	public int modifyRoom(HashMap<String, Object> map) {
		// autoCommit 취소
		sqlsession.getSqlSessionFactory().openSession(false);
		
		int count = sqlsession.insert("JH_rooms.updateLodge", map);

		if (count == 1) {
			count = sqlsession.insert("JH_rooms.updateLodgeIntro", map);

			if (count == 1) {
				count = sqlsession.insert("JH_rooms.updateLodgeDetail", map);

				if (count == 1) {
					count = sqlsession.insert("JH_rooms.updateLodgeDetail2", map);

					if (count == 1) {
						sqlsession.commit(true);
					}
				}
			}
		}

		return count;
	}
	*/

	@Override
	public int checkWishList(HashMap<String, Object> map) {
		int count = sqlsession.selectOne("JH_rooms.selectCheckWishList", map);
		
		return count;
	}

	@Override
	public int insertWishList(HashMap<String, Object> map) {
		int result = sqlsession.insert("JH_rooms.insertWishList", map);
		
		return result;
	}

	@Override
	public int updateWishList(HashMap<String, Object> map) {
		int result = sqlsession.update("JH_rooms.updateWishList", map);
		
		return result;
	}
	
	@Override
	public int getWishListStatus(HashMap<String, Object> map) {
		int status = sqlsession.selectOne("JH_rooms.selectWishListStatus", map);
		
		return status;
	}
	
	@Override
	public List<HashMap<String, Object>> getWishListInList(HashMap<String, Object> map, RowBounds rowBounds) {
		List<HashMap<String, Object>> roomsWishListInList = sqlsession.selectList("JH_rooms.selectRoomsWishListInList", map, rowBounds);
		
		return roomsWishListInList;
	}

	@Override
	public int addFile(HashMap<String, String> map) {
		int n = sqlsession.insert("JH_rooms.insertLodgeImage", map);

		return n;
	}

	@Override
	public HashMap<String, Object> getRoom(HashMap<String, Object> map) {
		HashMap<String, Object> roomInfo = sqlsession.selectOne("JH_rooms.getlistdetail", map);
		
		return roomInfo;
	}
}
