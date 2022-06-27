package com.Increase.emotionDiary.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {

	private int memberId;
	private String memberName;
	private String memberPassword;
	private String createAt;
	private boolean isMember;
}
