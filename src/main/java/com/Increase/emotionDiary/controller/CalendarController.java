package com.Increase.emotionDiary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.Increase.emotionDiary.service.CalendarService;

@Controller
public class CalendarController {

	@Autowired
	private CalendarService calendarService;
}
