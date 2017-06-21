package com.typeof.hajota.rooms.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.typeof.hajota.rooms.model.RoomsDAO;

@Service
public class RoomsService implements InterRoomsService {

//	===== #31. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private RoomsDAO dao;
	
	public HashMap<String, Object> getlistdetail(String seq) {

		HashMap<String, Object> listdetail = dao.getlistdetail(seq);
		
		return listdetail;
	}

	public int addFile(HashMap<String, String> map) {

		int n = dao.addFile(map);
		
		return n;
	}
	
}
