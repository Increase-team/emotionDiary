package com.Increase.emotionDiary.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.Increase.emotionDiary.VO.MemberVO;

@Mapper
public interface MemberMapper {

	public int insertMember(MemberVO vo);
	
	public MemberVO selectLoginMember(MemberVO vo);
}
