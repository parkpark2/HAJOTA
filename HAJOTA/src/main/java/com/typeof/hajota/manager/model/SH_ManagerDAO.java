package com.typeof.hajota.manager.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//===== #28. DAO 선언 =====
@Repository
public class SH_ManagerDAO implements SH_InterManagerDAO {

//	===== #29. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<HashMap<String, Object>> Shownotice(HashMap<String, String> map) {
		
		List<HashMap<String, Object>> noticeList = sqlsession.selectList("SH_manager.Shownotice", map);
		
		return noticeList;
	}
	
    // 총 게시물 건수 구하기 
	@Override
	public int getTotalCount(HashMap<String, String> map) {
		
		int count = sqlsession.selectOne("SH_manager.getTotalCount", map);
		
		return count;
	}
	
	// 공지사항 글쓰기
	@Override
	public int noticewrite(HashMap<String, Object> map) {
		
		 int n = sqlsession.insert("SH_manager.noticewrite", map);
		  
		 return n;		
	}

	public int delete(HashMap<String, String> map) {
		
		int n = sqlsession.update("SH_manager.noticedelete", map);
		
		return n;
	}
	
	
}