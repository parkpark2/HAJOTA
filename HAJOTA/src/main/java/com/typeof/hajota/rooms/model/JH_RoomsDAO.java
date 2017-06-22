package com.typeof.hajota.rooms.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	public List<HashMap<String, Object>> getUnvailableSeqLodgeList(HashMap<String, Object> map) {
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
	/*
	// 숙소 예약
	@Override
	public int setRoom(HashMap<String, Object> map) {
		// autoCommit 취소
		sqlsession.getSqlSessionFactory().openSession(false);
		
		int count = sqlsession.insert("JH_rooms.insertLodge", map);
		
		if(count == 1) {
			count = sqlsession.insert("JH_rooms.insertLodgeIntro", map);
			
			if(count == 1) {
				count = sqlsession.insert("JH_rooms.insertLodgeDetail", map);
				
				if(count == 1) {
					count = sqlsession.insert("JH_rooms.insertLodgeDetail2", map);
					
					if(count == 1) {
						sqlsession.commit(true);
					}
				}
			}			
		}
		
		return count;
	}
	
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
}
