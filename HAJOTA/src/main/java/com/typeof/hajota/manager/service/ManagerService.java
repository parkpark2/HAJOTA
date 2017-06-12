package com.typeof.hajota.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.typeof.hajota.manager.model.ManagerDAO;

@Service
public class ManagerService implements InterManagerService {

//	===== #31. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private ManagerDAO dao;
}
