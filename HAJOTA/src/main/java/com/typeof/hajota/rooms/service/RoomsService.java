package com.typeof.hajota.rooms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.typeof.hajota.rooms.model.RoomsDAO;

@Service
public class RoomsService implements InterRoomsService {

//	===== #31. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private RoomsDAO dao;
}
