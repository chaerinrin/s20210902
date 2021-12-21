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

public class AuthorityInterceptor implements HandlerInterceptor {
	
	private static final String mem_admin = "mem_admin";
	
	public List authorityEssential
			= Arrays.asList("/mng/**");
	
	public List authorityInessential
			= Arrays.asList("/cm/**", "/home", "/user/**");

	@Autowired
	private static final Logger log = LoggerFactory.getLogger(AuthorityInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		log.info("AuthorityInterceptor Start");
		HttpSession session = request.getSession();
		String mem_admin = String.valueOf(session.getAttribute("mem_admin"));
		
		if("1" == mem_admin ||"1".equals(mem_admin)) {
			//
			System.out.println("관리자입니다");
			return true;
		}
		String context = request.getContextPath();
		System.out.println("일반 회원입니다");
		response.sendRedirect(context+"home");
		return false;
	}

	

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	
	
}
