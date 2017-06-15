package com.typeof.hajota.manager.model;

import java.util.HashMap;
import java.util.List;

public interface SH_InterManagerDAO {

	List<HashMap<String, Object>> Shownotice(HashMap<String, String> map);	// 관리자가 공지사항에 글쓴 것을 보여주는 메소드
	
	int getTotalCount(HashMap<String, String> map); // 총 게시물 건수 구하기 
	
	int noticewrite(HashMap<String, Object> map);	// 공지사항 글쓰기
	
	int delete(HashMap<String, String> map);	// 글 삭제해주는 메소드
}
