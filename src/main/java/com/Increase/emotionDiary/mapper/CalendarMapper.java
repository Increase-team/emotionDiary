package com.Increase.emotionDiary.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.Increase.emotionDiary.VO.CalendarVO;

@Mapper
public interface CalendarMapper {

	public List<Map<String,Object>> selectList(String member);
	
	public CalendarVO selectOne(int calendarId);
	
	public int insertEmotion(CalendarVO vo);
	
	public int deleteCalendar(int calendarId);
	
	public Map<String, Object> selectstatistics(int memberId);
	
	public int updateCalendar(CalendarVO vo);
	
	public List<Map<String, Object>> selectMonth(@Param("memberName") String memberName, @Param("calendarMonthFirstDay") int calendarMonthFirstDay, @Param("calendarCode") int calendarCode);
	
}
