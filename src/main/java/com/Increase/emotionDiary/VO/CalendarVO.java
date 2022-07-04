package com.Increase.emotionDiary.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CalendarVO extends MemberVO{

	private int calendarId;
	private int calendarCode;
	private int calendarMonthFirstDay;
	private String calendarEmotion;
	private String content;
	private String createAt;
}
