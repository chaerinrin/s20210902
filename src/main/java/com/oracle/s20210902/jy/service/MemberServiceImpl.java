package com.oracle.s20210902.jy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.s20210902.jy.dao.MemberDao;
import com.oracle.s20210902.model.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao md;
	
	public List<Member> selectMemberForLogin(Member member) {
		System.out.println("MemberServiceImpl.selectMemberForLogin Start...");
		return md.selectMemberForLogin(member);
	}

	@Override
	public List<Member> memberList(Member member) {
		System.out.println("MemberServiceImpl MemberList Start ");
		List<Member> memberList = md.memberList(member);
		
		return memberList;
	}

	@Override
	public Member userDetail(int mem_no) {
		System.out.println("MemberServiceImpl UserDetail Start");
		Member member = md.userDetail(mem_no);
		
		return member;
	}

	@Override
	public int update(Member member) {
		System.out.println("MemberServiceImpl update Start");
		int result = md.update(member);
		return result;
	}

	@Override
	public int delete(int mem_no) {
		System.out.println("MemberServiceImpl delete Start");
		 int result = md.delete(mem_no);
		 return result;
	}

	@Override
	public int register(Member member) {
		int result = md.register(member);
		return result;
	}

	@Override
	public int idCheck(String memId) {
		return md.idCheck(memId);
	}

	@Override
	public String findId(Member member) {
		return md.findId(member);
	}

	@Override
	public int managerDelete(Member member) {
		System.out.println("MemberService managerDelete");
		return md.managerDelete(member);
	}

	@Override
	public int managerRestore(Member member) {
		System.out.println("MemberService managerRestore");
		return md.managerRestore(member);
	}
	
	@Override
	public String checkEmail(Member member) {
		System.out.println("MemberService checkEmail");
		return md.checkEmail(member);
	}

	@Override
	public void tempPw(Member member) {
		System.out.println("memberService tempPw start");
		md.tempPw(member);
		
		
	}
}
