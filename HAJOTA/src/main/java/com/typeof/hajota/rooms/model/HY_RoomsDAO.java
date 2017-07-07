package com.typeof.hajota.rooms.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class HY_RoomsDAO  {

//   ===== #29. 의존객체 주입하기(DI : Dependency Injection) =====
   @Autowired
   private SqlSessionTemplate sqlsession;

   public HashMap<String, Object> getlistdetail(String seq) {

      HashMap<String, Object> listdetail = sqlsession.selectOne("HY_rooms.getlistdetail", seq);
      
      return listdetail;
   }

   public int addFile(HashMap<String, String> map) {
      
      int n = sqlsession.insert("HY_rooms.addFile", map);
      
      return n;
   }

public List<HashMap<String, String>> getcuponlist(HashMap<String, String> map) {


	List<HashMap<String, String>> getcuponlist = sqlsession.selectList("HY_rooms.getcuponlist", map);
	
	return getcuponlist;
}

/*public List<HashMap<String, String>> getreviewlist(String seq_lodge , RowBounds rowbounds) {

	List<HashMap<String, String>> reviewlist = sqlsession.selectList("HY_rooms.getreviewlist",seq_lodge,rowbounds);
	
	return reviewlist;
}*/
public List<HashMap<String, String>> getreviewlist(RowBounds rowbounds) {

	List<HashMap<String, String>> reviewlist = sqlsession.selectList("HY_rooms.getreviewlist",null,rowbounds);
	
	return reviewlist;
}

public int getreviewcount() {

	int totalcount = sqlsession.selectOne("HY_rooms.getreviewcount");
	
	return totalcount;
}

public int insertreport(HashMap<String, String> map) {


	int n = sqlsession.insert("HY_rooms.insertreport", map);
	
	return n;
}


   
}