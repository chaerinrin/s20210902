package com.oracle.s20210902.jy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.s20210902.jy.service.MemberService;
import com.oracle.s20210902.model.Member;

@Controller
public class MemberUserController {
	
	@Autowired
	private MemberService ms;
	
	@RequestMapping(value ="user/detail")
	public String UserDetail (Model model, HttpServletRequest request) {
		System.out.println("MemberController UserDetail Start");
		int mem_no = (int) request.getSession().getAttribute("mem_no");
		Member member = ms.userDetail(mem_no);
		model.addAttribute("member", member);
		
		return "jy/user/detail";
	}
	

	@RequestMapping(value = "user/updateForm")
	public String updateForm(int mem_no, Model model) {
		System.out.println("MemberController updateForm Start");
		Member member = ms.userDetail(mem_no);
		model.addAttribute("member", member);
		
		return "jy/user/updateForm";
		
	}
	
	@PostMapping(value = "user/update")
	public String update(Member member, Model model) {
		System.out.println("MemberUserController update Start");
		int result = ms.update(member);
		model.addAttribute("member", member);
		
		return "redirect:/user/detail";
	}
	
	@RequestMapping(value = "user/delete")
	public String delete(Member member, Model model, HttpSession session) {
		System.out.println("MemberUserController delete Start");
		int result = ms.managerDelete(member);
		
		session.invalidate();
		return "redirect:/home";
	}
	
	
}

