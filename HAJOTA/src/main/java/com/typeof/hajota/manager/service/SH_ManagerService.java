package com.typeof.hajota.manager.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.typeof.hajota.manager.model.SH_ManagerDAO;

@Service
public class SH_ManagerService implements SH_InterManagerService {

//	===== #31. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private SH_ManagerDAO dao;

	// 관리자가 공지사항에 글쓴 것을 보여주는 메소드
	@Override
	public List<HashMap<String, Object>> Shownotice(HashMap<String, String> map) {
		
		List<HashMap<String, Object>> noticeList = dao.Shownotice(map);
		
		return noticeList;
	}
	
	// 총 게시물 건수 구하기  
	@Override
	public int getTotalCount(HashMap<String, String> map) {
		int count = dao.getTotalCount(map);
		return count;
	}

	// 공지사항 글쓰기 
	@Override
	public int noticewrite(HashMap<String, Object> map) {
		
		int n = dao.noticewrite(map); 
				
		return n;
	}

	public int delete(HashMap<String, String> map) {
		
		int n = dao.delete(map);
		
		return n;
	}
}
