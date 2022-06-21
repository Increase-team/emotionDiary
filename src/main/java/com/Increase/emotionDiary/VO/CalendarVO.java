package com.Increase.emotionDiary.VO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CalendarVO {

	private int CalendarId;
	private int MemberId;
	private String emotion;
	private String CreateAt;
}
