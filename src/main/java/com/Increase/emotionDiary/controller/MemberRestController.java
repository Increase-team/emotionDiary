package com.Increase.emotionDiary.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.Increase.emotionDiary.VO.MemberVO;
import com.Increase.emotionDiary.service.MemberService;

@RestController
public class MemberRestController {

	@Autowired
	private MemberService memberService;

	// 회원가입
	@CrossOrigin
	@PostMapping("/members")
	public int callSaveMembers(@RequestBody MemberVO vo) {
		return memberService.setMembers(vo);
	}

	// 로그인
	@CrossOrigin
	@PostMapping("/login")
	public boolean callLogin(@RequestBody MemberVO vo, HttpSession httpSession) {
		boolean isLogin = memberService.isMember(vo, httpSession);
		return isLogin;
	}

	// 회원탈퇴
	@CrossOrigin
	@DeleteMapping("/member/id/{id}")
	public int callremoveMember(@PathVariable("id") int memberId) {
		return memberService.deleteMember(memberId);
	}
}
