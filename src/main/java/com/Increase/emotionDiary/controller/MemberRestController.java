package com.Increase.emotionDiary.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.Increase.emotionDiary.VO.MemberVO;
import com.Increase.emotionDiary.service.MemberService;

@RestController
public class MemberRestController {

	@Autowired
	private MemberService memberService;
	
	@CrossOrigin
	@PostMapping("/members")
	public int callSaveMembers(@RequestBody MemberVO vo) {
		return memberService.setMembers(vo);
	}
	@CrossOrigin
	@PostMapping("/login")
	public boolean  callLogin(@RequestBody MemberVO vo, HttpSession httpSession) {
		boolean isLogin = memberService.isMember(vo, httpSession);
		return isLogin;
	}
}
