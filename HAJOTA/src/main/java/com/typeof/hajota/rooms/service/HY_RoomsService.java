package com.typeof.hajota.rooms.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.typeof.hajota.rooms.model.HY_RoomsDAO;


@Service
public class HY_RoomsService  {

//   ===== #31. 의존객체 주입하기(DI : Dependency Injection) =====
   @Autowired
   private HY_RoomsDAO dao;
   
   public HashMap<String, Object> getlistdetail(String seq) {

      HashMap<String, Object> listdetail = dao.getlistdetail(seq);
      
      return listdetail;
   }

   public int addFile(HashMap<String, String> map) {

      int n = dao.addFile(map);
      
      return n;
   }

public List<HashMap<String, String>> getcuponlist(HashMap<String, String> map) {

	List<HashMap<String, String>> getcuponlist = dao.getcuponlist(map);
	
	
	return getcuponlist;
}


public List<HashMap<String, String>> getreviewlist(String seq_lodge ,RowBounds rowbounds) {

	List<HashMap<String, String>> reviewlist = dao.getreviewlist(seq_lodge ,rowbounds);
	
	return reviewlist;
}

public int getreviewcount(String seq) {

	int totalcount = dao.getreviewcount(seq);
	
	return totalcount;
}

public int insertreport(HashMap<String, String> map) {

	int n = dao.insertreport(map);
	
	return n;
}

public int addtrip(HashMap<String, String> map) {
	int n = dao.addtrip(map);
	return n;
}

public int usecoupon(String cupon) {
	
	int m = dao.usecoupon(cupon);
	
	return m;
}


   
}