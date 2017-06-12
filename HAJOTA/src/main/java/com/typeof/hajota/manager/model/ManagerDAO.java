package com.typeof.hajota.manager.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//===== #28. DAO 선언 =====
@Repository
public class ManagerDAO implements InterManagerDAO {

//	===== #29. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private SqlSessionTemplate sqlsession;

	
	
}