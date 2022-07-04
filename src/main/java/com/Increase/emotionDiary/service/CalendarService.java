package com.Increase.emotionDiary.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Increase.emotionDiary.VO.CalendarVO;
import com.Increase.emotionDiary.mapper.CalendarMapper;

@Service
public class CalendarService {

	@Autowired
	private  CalendarMapper calendarMapper;
	
	public List<Map<String,Object>> selectList(String memberName){
		return calendarMapper.selectList(memberName);
	}
	public CalendarVO selectOne(int calendarId) {
		return calendarMapper.selectOne(calendarId);
	}
	
	public int setCalendar(CalendarVO vo) {
//		int count = 0;
//		if(count <=2) {
//			return 0;
//		}
//		++count;
		return calendarMapper.insertEmotion(vo);
		
	}
	@Transactional(rollbackFor = Exception.class)
	public int deleteCalendar(int calendarId) {
		return calendarMapper.deleteCalendar(calendarId);
	}
	public Map<String,Object> selectstatistics(int memberId){
		return calendarMapper.selectstatistics(memberId);
	}
	
	public int updateCalendar(int calendarId, CalendarVO vo) {
		vo.setCalendarId(calendarId);
		return calendarMapper.updateCalendar(vo);
	}
	
	public List<Map<String, Object>> selectMonth(String memberName, int calendarMonthFirstDay, int calendarCode){
		return calendarMapper.selectMonth(memberName, calendarMonthFirstDay, calendarCode);
	}
}
