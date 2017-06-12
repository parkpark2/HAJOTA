package com.typeof.hajota.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.typeof.hajota.member.model.MemberDAO;

@Service
public class MemberService implements InterMemberService {

//	===== #31. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private MemberDAO dao;
}
