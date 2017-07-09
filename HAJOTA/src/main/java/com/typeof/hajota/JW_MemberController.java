package com.typeof.hajota;

import java.awt.RenderingHints.Key;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.SessionScope;

import com.typeof.hajota.member.service.JW_MemberService;

//===== #32. 컨트롤러 선언 =====
@Controller
@Component
public class JW_MemberController {


//	===== #33. 의존객체 주입하기(DI : Dependency Injection) ===== 
	@Autowired
	private JW_MemberService service;
	
	@RequestMapping(value="/index.go")
	public String test(){
		return "main/index.tiles";
	}

	@RequestMapping(value="/indexChinese.go")
	public String test1(){
		return "main/indexChinese.tilesC";
	}

    // ===== #45. 로그인 완료 요청 =====
    @RequestMapping(value="/loginEnd.go", method={RequestMethod.POST})
    public String loginEnd(HttpServletRequest req,  HttpSession session) {
    	
    	String email = req.getParameter("email");
    	String pwd = req.getParameter("pwd");
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("email", email);
    	map.put("pwd", pwd);
    	
 
    	 int n =service.loginEnd(map);
    	 req.setAttribute("n", n);
    	 
    	 if(n==1) { // 로그인이 되었을때
    		 
    		 HashMap<String, Object> loginuser = service.getLoginMember(map);
    		 session.setAttribute("loginuser", loginuser);
    		 
    		 service.insertLoginTime(map);
    		 
    		 String url = (String)session.getAttribute("url");
    		 req.setAttribute("url", url);
    	 }

    	 return "login/loginEnd.notiles";
    	// /hajota/src/main/webapp/WEB-INF/views2/login/loginEnd.jsp 파일을 생성한다
    }
	
    // ===== #53. 로그아웃 완료 요청 =====
    @RequestMapping(value="/logout.go", method={RequestMethod.GET})
    public String logout(HttpServletRequest req, HttpSession session) { 
    	
    	session.invalidate();
    	
    	return "login/logout.notiles";
    	// /Board/src/main/webapp/WEB-INF/notiles/logout.jsp 파일을 생성한다.
    }
    
 // ===== #45. 회원가입 완료 요청 =====
    @RequestMapping(value="/joinEnd.go", method={RequestMethod.GET})
    public String joinEnd(HttpServletRequest req) {
    	
    	String email = req.getParameter("join_email");
    	String pwd = req.getParameter("join_pwd");
    	String last_name = req.getParameter("join_last_name");
    	String first_name = req.getParameter("join_first_name");
    	String birthday = req.getParameter("join_birthday");
    	String tel = req.getParameter("join_tel");
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("email", email);
    	map.put("pwd", pwd);
    	map.put("last_name", last_name);
    	map.put("first_name", first_name);
    	map.put("birthday", birthday);
    	map.put("tel", tel);
    	
    	int n = 0;
    	n = service.joinEnd(map);
    	
    	   String msg = "";
		   String loc = "";
		   String type = "";	
		   String title = "";
		   
		   if(n==1) {
			   msg = "로그인페이지로 이동하시겠습니까?";
			   loc = "javascript:history.back();";
			   type = "success";
			   title = "가입을 축하드립니다~~";
		   }
		   
		   req.setAttribute("msg", msg);
		   req.setAttribute("loc", loc);
		   req.setAttribute("type", type);
		   req.setAttribute("title", title);
    	 
		   return "msg.notiles";
    	
    	// /HAJOTA/src/main/webapp/WEB-INF/notiles/msg.jsp 파일을 생성한다
    }
    
 // ===== 회원정보수정 폼 페이지 요청 =====
    @RequestMapping(value="/editUser.go", method={RequestMethod.GET})
    public String editUser(HttpServletRequest req) {
    	
    	return "mypage/editUser.tiles2";
    	// /hajota/src/main/webapp/WEB-INF/views2/user/editUser.jsp 파일을 생성한다.
    }
    
    // ===== 회원정보수정 완료 요청 =====
    @RequestMapping(value="/edituserEnd.go", method={RequestMethod.GET})
    public String edituserEnd(HttpServletRequest req, HttpSession session) {
    	
    	String email = req.getParameter("email");
    	String pwd = req.getParameter("pwd");
    	String first_name = req.getParameter("first_name");
    	String last_name = req.getParameter("last_name");
    	String tel = req.getParameter("tel");
    		
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("email", email);
    	map.put("pwd", pwd);
    	map.put("first_name", first_name);
    	map.put("last_name", last_name);
    	map.put("tel", tel);
    	
    	 int n = service.edituserEnd(map);
		 req.setAttribute("n", n);

    	return "mypage/edituserEnd.tiles2";
    	// /hajota/src/main/webapp/WEB-INF/views2/user/edituserEnd.jsp 파일을 생성한다.
    }
    
    // 비밀번호 찾기
    @RequestMapping(value="/pwdFind.go", method={RequestMethod.GET, RequestMethod.POST})
   	public String pwdFind(HttpServletRequest req) {
    	
    	String method = req.getMethod();
    	
    	if("POST".equalsIgnoreCase(method)) { // 찾기 버튼을 눌렀을때만 실행!!

    		String email = req.getParameter("email");

    		HashMap<String, String> map = new HashMap<String, String>();
    		map.put("email", email);

    		int n = service.getUserExists(map); // 사용자가 존재하는지 확인하는
    		
    		if (n == 1) { // 이메일이 존재하면

    			// ***** 인증메일 발송 ******
    			GoogleMail mail = new GoogleMail();

    			// 인증키를 생성한다.
    			Random rnd = new Random();

    			try {
    				char randchar = ' ';
    				int randnum = 0;
    				String certificationCode = "";

    				for (int i = 0; i < 5; i++) {
    					// min 부터 max 사이의 값으로 랜덤한 정수를 얻으려면
    					// int rndnum = rnd.nextInt(max - min + 1) + min;

    					randchar = (char) (rnd.nextInt('z' - 'a' + 1) + 'a');
    					certificationCode += randchar;
    				}

    				for (int i = 0; i < 7; i++) {
    					randnum = rnd.nextInt(9 - 0 + 1) + 0;
    					certificationCode += randnum;
    				}

    				mail.sendmail(email, certificationCode);
    				req.setAttribute("certificationCode", certificationCode);
    	    		req.setAttribute("email", email);
    			} catch (Exception e) {
    				e.printStackTrace();

    				n = -1;
    				req.setAttribute("n", n);
    				req.setAttribute("sendFailmsg", "메일발송이 실패했습니다.");

    			} // end of try ~ catch---------------------

    		} else { // 이메일이 존재하지 않으면
    			n = 0;
    		}
    		req.setAttribute("n", n);
    		
    	}
		
    	return "pwdFind.notiles";
    }

	// ===== 비밀번호인증하고 비번변경하기  =====
    @RequestMapping(value="/pwdConfirm.go", method={RequestMethod.GET,RequestMethod.POST})
    public String pwdConfirm(HttpServletRequest req) {
    	
    	String method = req.getMethod();
		req.setAttribute("method", method);
		
		String email = req.getParameter("email");
		req.setAttribute("email", email);
		
		if("POST".equalsIgnoreCase(method)) {  // 비밀번호 변경하기를 클릭했으면
			String pwd = req.getParameter("pwd");
			String pwd2 = req.getParameter("pwd2");
			
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("email", email);
			map.put("pwd", pwd);
			
			int n = 0;
			n = service.updatePwdUser(map);
			
			System.out.println(n);
			System.out.println(email);
			System.out.println(pwd);
			
			req.setAttribute("n", n);
			req.setAttribute("pwd", pwd);
			req.setAttribute("pwd2", pwd2);
			req.setAttribute("email", email);
		}
    	
    	return "pwdConfirm.notiles";
    	// /hajota/src/main/webapp/WEB-INF/notiles/pwdConfirm.jsp 파일을 생성한다.
    }
    
    // 이메일 중복검사하기
    @RequestMapping(value="/idDuplicateCheck.go")
    public String idDuplicateCheck(HttpServletRequest req, HttpSession session) { 
    	
    	String method = req.getMethod();
		String email = req.getParameter("email");
		
		req.setAttribute("method", method);
		
		if(email != null) {
			req.setAttribute("email", email);
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("email", email);
			
			int isUseuserid = service.idDuplicateCheck(map);
			
			req.setAttribute("isUseuserid", isUseuserid);
		}
    	
    	return "idDuplicateCheck.notiles";
    	// /Board/src/main/webapp/WEB-INF/notiles/idDuplicateCheck.jsp 파일을 생성한다.
    }
    
    // wish-list 보여주기
    @RequestMapping(value="/wishList.go", method={RequestMethod.GET})
    public String wish(HttpServletRequest req, HttpSession session) {
    	
    	HashMap<String, Object> loginuser = (HashMap<String, Object>)session.getAttribute("loginuser");
    	String email = (String)loginuser.get("EMAIL");
    
    	List<HashMap<String, Object>> wishList = service.wishList(email);
    	req.setAttribute("wishList", wishList);
    	
    	return "mypage/wishList.tiles2";
    	// /hajota/src/main/webapp/WEB-INF/views2/mypage/paymentList.jsp 파일을 생성한다.
    }
    
    // 결제 리스트 보여주기
    @RequestMapping(value="/paymentList.go", method={RequestMethod.GET})
    public String payment(HttpServletRequest req ,HttpSession session) {
    	
    	HashMap<String, Object> loginuser = (HashMap<String, Object>)session.getAttribute("loginuser");
 		String email = (String)loginuser.get("EMAIL");
    	
    	List<HashMap<String, Object>> paymentList = service.paymentList(email);
    	req.setAttribute("paymentList", paymentList);
    
    	return "mypage/paymentList.tiles2";
    	// /hajota/src/main/webapp/WEB-INF/views2/mypage/paymentList.jsp 파일을 생성한다.
    }
    
    // 나의 이용후기 보여주기
    @RequestMapping(value="/reviewList.go", method={RequestMethod.GET})
    public String review(HttpServletRequest req ,HttpSession session) {
    	
    	HashMap<String, Object> loginuser = (HashMap<String, Object>)session.getAttribute("loginuser");
 		String email = (String)loginuser.get("EMAIL");
  
    	List<HashMap<String, Object>> reviewList = service.reviewList(email);
    	
    	req.setAttribute("reviewList", reviewList);
    	
    	return "mypage/reviewList.tiles2";
    	// /hajota/src/main/webapp/WEB-INF/views2/mypage/paymentList.jsp 파일을 생성한다.
    }
    
    // 쿠폰 리스트 보여주기
 	@RequestMapping(value="/couponList.go", method={RequestMethod.GET})
     public String coupon(HttpServletRequest req, HttpSession session) {

 		HashMap<String, Object> loginuser = (HashMap<String, Object>)session.getAttribute("loginuser");
 		String email = (String)loginuser.get("EMAIL");
 		
 		/*HashMap<String, String> map = new HashMap<String, String>();
 		map.put("email", (String)loginuser.get("EMAIL"));*/
 		
 		List<HashMap<String, Object>> couponList =  service.couponList(email);
     	req.setAttribute("couponList", couponList);
     	
     	return "mypage/couponList.tiles2";
     	// /hajota/src/main/webapp/WEB-INF/views2/mypage/couponList.jsp 파일을 생성한다.
     }
 	
 	// 질문 목록 보여주기
  	@RequestMapping(value="/questionList.go", method={RequestMethod.GET})
      public String qna(HttpServletRequest req, HttpSession session) {
  		
  		String pageNo = req.getParameter("pageNo");
        
        int totalCount = 0;        // 총게시물 건수
        int sizePerPage = 5;      // 한 페이지당 보여줄 게시물 갯수 (예: 3, 5, 10) 
        int currentShowPageNo = 1; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
        int totalPage = 0;         // 총페이지수(웹브라우저상에 보여줄 총 페이지 갯수)
        
        int start = 0;             // 시작 행 번호
        int end = 0;               // 끝 행 번호
        int startPageNo = 0;       // 페이지바에서 시작될 페이지 번호 
        
        int loop = 0;       // startPageNo 값이 증가할때 마다 1씩 증가하는 용도.
        int blocksize = 5;  // "페이지바" 에 보여줄 페이지의 갯수 
        
        if(pageNo == null) {
      	  
      	  currentShowPageNo = 1;
      	 
        }
        else {
      	  currentShowPageNo = Integer.parseInt(pageNo);
      	  
        }
        
        start = ((currentShowPageNo - 1) * sizePerPage) + 1;  
        end = start + sizePerPage - 1;
        
        String colname = req.getParameter("colname");
    	String search = req.getParameter("search");
    	
    	System.out.println(search);
    	
    	HashMap<String, String> map = new HashMap<String, String>();
    	map.put("colname", colname);
    	map.put("search", search);
    	
    	// ===== #109. 페이징 처리를 위해 start, end 를 map 에 추가하여 DB에서 select 되어지도록 한다. ===== 
    	map.put("start", String.valueOf(start) ); // 키값 start, 밸류값은 해쉬맵이 String 타입인데 start 는 int 타입이어서 String 타입으로 변경함. 
    	map.put("end", String.valueOf(end) );     // 키값 end,   밸류값은 해쉬맵이 String 타입인데 end 는 int 타입이어서 String 타입으로 변경함. 
    	
    	
    	/*List<BoardVO> boardList = service.boardList(map);*/
    	List<HashMap<String, Object>> questionList = service.questionList(map); // 질문 목록 보여주기(검색어, 페이징 포함)
    	
    	/*List<HashMap<String, Object>> answerList = service.answerList(map);*/
    	
    	totalCount = service.getTotalCount(map);
    	
    	totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
    	
    	String pagebar = "";
    	pagebar += "<ul>";
    	
    	loop = 1;
    	
    	startPageNo = ((currentShowPageNo - 1)/blocksize)*blocksize + 1;
    	
    	// **** 이전5페이지 만들기 ****
    	if(startPageNo == 1) {
        	// 첫 페이지바에 도달한 경우
        	pagebar += String.format("&nbsp;&nbsp;[이전%d페이지]", blocksize);
        }
        else {
        	// 첫 페이지바가 아닌 두번째 이상 페이지바에 온 경우
        	
        	if(colname == null || search == null) {
        		// 검색어가 없는 경우
        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/questionList.go?pageNo=%d'>[이전%d페이지]</a>&nbsp;&nbsp;", startPageNo-1, blocksize); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
        	}
        	else{
        		// 검색어가 있는 경우
        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/questionList.go?pageNo=%d&colname=%s&search=%s'>[이전%d페이지]</a>&nbsp;&nbsp;", startPageNo-1, colname, search, blocksize); // 검색어 있는 경우        		
        	}	
        }
    	
    	// **** 이전5페이지 와 다음5페이지 사이에 들어가는 것을 만드는 것
        while( !(loop > blocksize ||
        		 startPageNo > totalPage) ) {
        	
        	if(startPageNo == currentShowPageNo) {
        		pagebar += String.format("&nbsp;&nbsp;<span style='color:red; font-weight:bold; text-decoration:underline;'>%d</span>&nbsp;&nbsp;", startPageNo);	
        	}
        	else {
	        	if(colname == null || search == null) {
	        		// 검색어가 없는 경우
	        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/questionList.go?pageNo=%d'>%d</a>&nbsp;&nbsp;", startPageNo, startPageNo); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
	        	}
	        	else{
	        		// 검색어가 있는 경우
	        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/questionList.go?pageNo=%d&colname=%s&search=%s'>%d</a>&nbsp;&nbsp;", startPageNo, colname, search, startPageNo); // 검색어 있는 경우        		
	        	}
        	}
        	
        	loop++;
        	startPageNo++;
        	
        }// end of while--------------------
        
     // **** 다음5페이지 만들기 ****
        if(startPageNo > totalPage) {
        	// 마지막 페이지바에 도달한 경우
        	pagebar += String.format("&nbsp;&nbsp;[다음%d페이지]", blocksize);
        }
        else {
        	// 마지막 페이지바가 아닌 경우
        	
        	if(colname == null || search == null) {
        		// 검색어가 없는 경우
        		pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/questionList.go?pageNo=%d'>[다음%d페이지]</a>&nbsp;&nbsp;", startPageNo, blocksize); // 처음 %d 에는 startPageNo값 , 두번째 %d 에는 페이지바에 나타낼 startPageNo값 이다.		
        	}
        	else{
        		// 검색어가 있는 경우
        	    pagebar += String.format("&nbsp;&nbsp;<a href='/hajota/questionList.go?pageNo=%d&colname=%s&search=%s'>[다음%d페이지]</a>&nbsp;&nbsp;", startPageNo, colname, search, blocksize); // 검색어 있는 경우        		
        	}	
        }
        
        pagebar += "</ul>";
    	
        req.setAttribute("pagebar", pagebar);
        req.setAttribute("colname", colname);
        req.setAttribute("search", search);
    	
    	
    	req.setAttribute("questionList", questionList);
    	
    	
      	return "qna/questionList.tilesCU";
      	// /hajota/src/main/webapp/WEB-INF/views2/mypage/couponList.jsp 파일을 생성한다.
      }

  	// Qna 디테일 보여주기
  	@RequestMapping(value="/qnaDetail.go", method={RequestMethod.GET})
    public String view(HttpServletRequest req, HttpSession session) {
		
		/*List<HashMap<String, Object>> questionList = service.questionList();
		req.setAttribute("questionList", questionList);*/
  		
  		HashMap<String, Object> loginuser = (HashMap<String, Object>)session.getAttribute("loginuser");
  		req.setAttribute("loginuser", loginuser);
  		
  		String seq = req.getParameter("seq");
    	
    	HashMap<String, Object> queinfo = service.questioninfo(seq);
    	req.setAttribute("queinfo", queinfo);
    	
    	HashMap<String, Object> ansinfo = service.answerinfo(seq);
    	req.setAttribute("ansinfo", ansinfo);
    	
    	return "qna/qnaDetail.tilesCU";
    	
    }
  	
  	// 질문 수정 페이지 보여주기
  	@RequestMapping(value="/edit.go", method={RequestMethod.GET})
    public String edit(HttpServletRequest req) {
		
		/*List<HashMap<String, Object>> questionList = service.questionList();
		req.setAttribute("questionList", questionList);*/
  		
  		String seq = req.getParameter("seq");
    	
    	HashMap<String, Object> edit = service.editList(seq);
    	
    	req.setAttribute("edit", edit);
    	
    	return "qna/edit.tilesCU";
    }
  	
  	// 글 수정 완료하기
  	@RequestMapping(value="/editEnd.go", method={RequestMethod.GET})
    public String editEnd(HttpServletRequest req) {
  		
  		String subject = req.getParameter("subject");
  		String content = req.getParameter("content");
  		String seq = req.getParameter("seq");
  		
  		HashMap<String, Object> map = new HashMap<String, Object>();
  		map.put("subject", subject);
  		map.put("content", content);
  		map.put("seq", seq);
  		
  		int n = service.editEnd(map);
  		req.setAttribute("n", n);
  		
  		return "qna/editEnd.tilesCU";
  	}
  	
  	
  	
  	// 글쓰기
  	@RequestMapping(value="/add.go", method={RequestMethod.GET})
    public String add(HttpServletRequest req, HttpSession session) {
  		
  		HashMap<String, Object> loginuser = (HashMap<String, Object>)session.getAttribute("loginuser");
  		req.setAttribute("loginuser", loginuser);
  		
  		
  		return "qna/add.tilesCU";
  	}
  	
  	// 글쓰기 완료 
  	 @RequestMapping(value="/addEnd.go", method={RequestMethod.POST})
  	public String addEnd(HashMap<String, Object> queinfo, HttpServletRequest req) {
		
  		 String email = req.getParameter("email");
  		 String subject = req.getParameter("subject");
  		 String content = req.getParameter("content");
  		 
  		 queinfo.put("email", email);
  		 queinfo.put("subject", subject);
  		 queinfo.put("content", content);
  		
  		int n = service.add(queinfo);
  		req.setAttribute("n", n);
  		
  		return "qna/addEnd.tilesCU";

  	 }
  	 // 게스트 회원 탈퇴
  	 @RequestMapping(value="/signOut.go", method={RequestMethod.GET})
   	public String getSignOut(HttpServletRequest req) {
  		 
  		 List<HashMap<String, Object>> list = service.getSignOut();
  		 req.setAttribute("list", list);
  		 
  		 return "mypage/signOut.tiles2";
  	 }
  	 
  	 // 탈퇴하기 및 탈퇴사유 넣기
     @RequestMapping(value="/signOutEnd.go", method={RequestMethod.POST})
     public String signOutEnd(HttpServletRequest req, HttpSession session){
        
        String value = req.getParameter("reason_value");
        
        /*@SuppressWarnings("unchecked")*/
        HashMap<String, String> loginuser = (HashMap<String, String>)session.getAttribute("loginuser");
        req.setAttribute("loginuser", loginuser);
        String email = loginuser.get("EMAIL");
        
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("email", email);
        map.put("value", value);
        
        int n = service.signOutEnd(map);
        
        req.setAttribute("n", n);
        
        if(n == 1) {
           // tbl_guest_withdraw
           n = service.reasonInsert(map); // 회원 탈퇴 사유 insert
           
           req.setAttribute("n", n);         
        }
        
        return "mypage/signOutEnd.tiles2";
     }
  	 
     
  	 // 호스트 회원 탈퇴
  	 @RequestMapping(value="/hostSignOut.go", method={RequestMethod.GET})
   	public String gethostSignOut(HttpServletRequest req) {
  		 List<HashMap<String, Object>> list = service.gethostSignOut();
  		 req.setAttribute("list", list);
  		 
  		 return "mypage/hostSignOut.tiles2";
  	 }
  	 

  	 
  	 
  	 
  	 // 글 삭제
  	 @RequestMapping(value="/qnaDel.go", method={RequestMethod.GET})
   	 public String del(HttpServletRequest req) {
  		 
  		 String seq = req.getParameter("seq_question");
  		 
  		 int del = service.qnaDel(seq);
  		 req.setAttribute("del", del);
  		 
  		 return "mypage/qnaDel.tiles2";
  	 }
  	 
  	 
  	 // 콜센터
  	@RequestMapping(value="/callview.go", method={RequestMethod.GET})
  	 public String callview(HttpServletRequest req) {
 		
 		 return "callview.tilesCU";
 	 }
  	 
  	// FAQ 보여주기
  	@RequestMapping(value="/FAQ.go", method={RequestMethod.GET})
 	 public String FAQ(HttpServletRequest req) {
		 return "FAQ/FAQ.tilesCU";
	 }
  	 
  	// FAQdetail 보여주기
  	@RequestMapping(value="/FAQdetail.go", method={RequestMethod.GET})
 	 public String FAQdetail(HttpServletRequest req) {
		 return "FAQ/FAQdetail.tilesCU";
	 }
  	
  	
  	
}
  	
  	
	
	
	


