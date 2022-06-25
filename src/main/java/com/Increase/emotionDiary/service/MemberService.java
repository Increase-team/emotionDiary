package com.Increase.emotionDiary.service;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Increase.emotionDiary.VO.MemberVO;
import com.Increase.emotionDiary.mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public int setMembers(MemberVO vo) {
		String password = vo.getMemberPassword();
		password = passwordEncoder.encode(password);
		vo.setMemberPassword(password);
		return memberMapper.insertMember(vo);
	}
	public boolean isMember(MemberVO vo, HttpSession httpSession) {
		MemberVO member = memberMapper.selectLoginMember(vo);
		if(member == null) {
			return false;
		}
		String htmlPassword = vo.getMemberPassword();
		String password = member.getMemberPassword();
		if(!passwordEncoder.matches(htmlPassword, password)) {
			return false;
		}
		httpSession.setAttribute("MemberId", member.getMemberId());
		httpSession.setAttribute("MemberPassword", member.getMemberPassword());
		return true;
	}
	@Transactional(rollbackFor = Exception.class)
	public int deleteMember(int memberId) {
		return memberMapper.deleteMember(memberId);
	}
}
