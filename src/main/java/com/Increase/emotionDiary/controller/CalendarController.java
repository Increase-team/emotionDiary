package com.Increase.emotionDiary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.Increase.emotionDiary.service.CalendarService;

@Controller
public class CalendarController {

	@Autowired
	private CalendarService calendarService;
	
	@GetMapping("/calendar")
	public String callCalendar() {
		return "cal";
	}
}
