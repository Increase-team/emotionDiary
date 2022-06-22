package com.Increase.emotionDiary.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.Increase.emotionDiary.VO.MemberVO;
import com.Increase.emotionDiary.mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public int insertMember(MemberVO vo ) {
//		String password = vo.getMemberPassword();
//		password = passwordEncoder.encode(password);
//		vo.setMemberPassword(password);
		return memberMapper.insertMember(vo);
	}
	
	public boolean isMember(MemberVO vo, HttpSession httpSession) {
		MemberVO member = memberMapper.selectLoginMember(vo);
		if(member == null) {
			return false;
		}
		String inputPassword = vo.getMemberPassword();
		String password = member.getMemberPassword();
			
		if(!passwordEncoder.matches(inputPassword, password)) {
			return false;
		}
		httpSession.setAttribute("memberId", member.getMemberId());
		httpSession.setAttribute("memberPassword", member.getMemberPassword());
		return true;
	}
}
