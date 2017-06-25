package com.typeof.hajota.rooms.model;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class HY_RoomsDAO implements InterRoomsDAO {

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
   
}