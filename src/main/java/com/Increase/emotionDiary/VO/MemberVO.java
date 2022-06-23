package com.Increase.emotionDiary.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {

	private int MemberId;
	private String MemberName;
	private String MemberPassword;
	private String CreateAt;
	private boolean isMember;
	private int test;
}
