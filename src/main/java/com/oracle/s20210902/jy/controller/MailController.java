package com.oracle.s20210902.jy.controller;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.s20210902.jy.service.MemberService;
import com.oracle.s20210902.model.Member;

@Controller
public class MailController {
	@Autowired
	private MemberService ms;

	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "mail/Transport")
	@ResponseBody
	public void mailTransport(Model model, Member member) {
		System.out.println("mailSending...");
		String tomail = member.getMem_email();              // 받는 사람 이메일
		System.out.println(tomail);
		String setfrom = "pib20210902@gmail.com";             // 보내는 사람 
		String title = "PIB 쇼핑몰 임시 비밀번호 입니다.";            // 제목
		String tempPassword = String.valueOf((int)(Math.random() * 100000000));
		try {
			// 1. mailSender  --> Mime 전자우편 Internet 표준 Format
			MimeMessage message = mailSender.createMimeMessage();
			// 2.MimeMessage   -->     MimeMessageHelper      true 는 멀티파트 메세지를 사용
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom);    // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail);       // 받는사람 이메일
			messageHelper.setSubject(title);   // 메일제목은 생략이 가능하다
			messageHelper.setText("임시 비밀번호입니다 : " + tempPassword); // 메일 내용
			System.out.println("임시 비밀번호입니다 : " + tempPassword);
			/*
			 * DataSource dataSource = new FileDataSource("c:\\log\\jung1.jpg"); // B -->
			 * base64로 인코딩 messageHelper.addAttachment(MimeUtility.encodeText("airport.png",
			 * "UTF-8", "B"), dataSource);
			 */
			mailSender.send(message);
			model.addAttribute("check", 1);   // 정상 전달

		} catch (Exception e) {
			System.out.println(e);
			model.addAttribute("check", 2);  // 메일 전달 실패
		}
		try {
			member.setMem_passwd(tempPassword);
			System.out.println("여긴가");
			ms.tempPw(member)  ;// db에 비밀번호를 임시비밀번호로 업데이트
		} catch (Exception e) {
			System.out.println("----->> tempPw()");
			e.printStackTrace();
			model.addAttribute("check", 2);  // 메일 전달 실패
		}
		
	
	}
	
}
