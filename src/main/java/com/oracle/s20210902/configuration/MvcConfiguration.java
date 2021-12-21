package com.oracle.s20210902.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.oracle.s20210902.interceptor.AuthorityInterceptor;
import com.oracle.s20210902.interceptor.LoginCheckInterceptor;

@Configuration
public class MvcConfiguration implements WebMvcConfigurer {
	
	
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		
		LoginCheckInterceptor LoginInterceptor = new LoginCheckInterceptor();
		AuthorityInterceptor Authority = new AuthorityInterceptor(); 
		
		registry.addInterceptor(LoginInterceptor)
				//적용될 Path
				.addPathPatterns(LoginInterceptor.loginEssential) 
				//제외할 Path
				.excludePathPatterns(LoginInterceptor.loginInessential);
				
		registry.addInterceptor(Authority)
				.addPathPatterns(Authority.authorityEssential)
				.excludePathPatterns(Authority.authorityInessential);
		
		WebMvcConfigurer.super.addInterceptors(registry);
	}

}
