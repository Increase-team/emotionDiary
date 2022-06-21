package com.Increase.emotionDiary.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Increase.emotionDiary.mapper.CalendarMapper;

@Service
public class CalendarService {

	@Autowired
	private  CalendarMapper calendarMapper;
}
