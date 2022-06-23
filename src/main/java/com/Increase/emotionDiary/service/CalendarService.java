package com.Increase.emotionDiary.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Increase.emotionDiary.VO.CalendarVO;
import com.Increase.emotionDiary.mapper.CalendarMapper;

@Service
public class CalendarService {

	@Autowired
	private  CalendarMapper calendarMapper;
	
	public List<Map<String,Object>> selectList(){
		return calendarMapper.selectList();
	}
	public CalendarVO selectOne(int calendarId) {
		return calendarMapper.selectOne(calendarId);
	}
	public int setCalendar(CalendarVO vo) {
		return calendarMapper.insertEmotion(vo);
	}
	public int updateCalendar(int calendarId, CalendarVO vo) {
		vo.setCalendarId(calendarId);
		return calendarMapper.updateCalendar(vo);
	}
}
