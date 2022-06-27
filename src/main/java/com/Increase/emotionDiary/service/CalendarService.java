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
	
	public List<Map<String,Object>> selectList(int memberId){
		return calendarMapper.selectList(memberId);
	}
	public CalendarVO selectOne(int calendarId) {
		return calendarMapper.selectOne(calendarId);
	}
	
	public int setCalendar(CalendarVO vo) {
		return calendarMapper.insertEmotion(vo);
	}
	@Transactional(rollbackFor = Exception.class)
	public int deleteCalendar(int calendarId) {
		return calendarMapper.deleteCalendar(calendarId);
	}
	public Map<String,Object> selectstatistics(int memberId){
		return calendarMapper.selectstatistics(memberId);
	}

}
