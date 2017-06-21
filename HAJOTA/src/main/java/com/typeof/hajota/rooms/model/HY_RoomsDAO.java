package com.typeof.hajota.rooms.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class HY_RoomsDAO implements InterRoomsDAO {

//	===== #29. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;

	
	
}

