package com.oracle.s20210902.interceptor;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginCheckInterceptor implements HandlerInterceptor {
	
	private static final String mem_id = "mem_id";
	private static final String mem_admin = "mem_admin";

	
	public List loginEssential
			= Arrays.asList("/mng/**", "/user/**");
	
	public List loginInessential
			= Arrays.asList("/cm/**", "/home");
	
	@Autowired
	private static final Logger log = LoggerFactory.getLogger(LoginCheckInterceptor.class);
	
	@Override
	// controller에 매핑된 특정 URL을 호출했을때 controller에 접근하기 전에 실행되는 메서드
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		log.info("interceptor Start");
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		
		String context = request.getContextPath();
		if(null == mem_id || "".equals(mem_id)) {
			System.out.println("미인증 사용자입니다");
			response.sendRedirect(context+"home");
			return false;
		}
		
		return true;
	}

	@Override
	// view로 전달되기 전에 실행되는 메서드
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	
}
