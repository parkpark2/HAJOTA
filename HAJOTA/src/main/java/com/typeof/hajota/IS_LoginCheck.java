package com.typeof.hajota;

import java.io.IOException; 
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component

public class IS_LoginCheck {

	@Pointcut("execution(public * com.typeof.*.*Controller.requireLogin_*(..))")
	public void requireLogin() { 
		
	}

    @Before("requireLogin()") 
    public void before(JoinPoint joinPoint) {
    	
    	HttpServletRequest request = (HttpServletRequest)joinPoint.getArgs()[0];
    	HttpSession session = request.getSession();
    	
    	@SuppressWarnings("unchecked")
		HashMap<String, Object> loginuser = (HashMap<String, Object>)session.getAttribute("loginuser");
    	
    	HttpServletResponse response = (HttpServletResponse)joinPoint.getArgs()[1];
    	
    //	System.out.println(">>> 확인용 로그인유저 ID : " + loginuser.getUserid() );
    	
    	if(loginuser == null) {
    		try{
	    		String msg = "먼저 로그인 하세요";
	    		String loc = "IS/login/loginform.go";
	    		
	    		request.setAttribute("msg", msg);
	    		request.setAttribute("loc", loc);
	    		
	    		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/viewsnotiles/msg.jsp");
	    		dispatcher.forward(request, response); 
    		} catch(ServletException e) {
    			e.printStackTrace();
    		} catch(IOException e) {
    			e.printStackTrace();
    		}
    		
    	}
    }
}
