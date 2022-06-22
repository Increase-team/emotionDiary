package com.Increase.emotionDiary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.Increase.emotionDiary.service.CalendarService;

@RestController
public class CalendarRestController {

	@Autowired
	private CalendarService calendarService;


}
