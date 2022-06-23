package com.Increase.emotionDiary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.Increase.emotionDiary.VO.CalendarVO;

@Mapper
public interface CalendarMapper {

	public List<Map<String,Object>> selectList();
	
	public CalendarVO selectOne(int calendarId);
	
	public int insertEmotion(CalendarVO vo);
	
	public int updateCalendar(CalendarVO vo);
}
