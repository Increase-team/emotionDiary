package com.Increase.emotionDiary.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.Increase.emotionDiary.VO.CalendarVO;
import com.Increase.emotionDiary.service.CalendarService;

@RestController
public class CalendarRestController {

	@Autowired
	private CalendarService calendarService;

	@CrossOrigin
	@GetMapping("/calendar/list")
	public List<Map<String,Object>> callCalendar(){
		return calendarService.selectList();
	}
	@CrossOrigin
	@GetMapping("calendar/id/{calendarid}")
	public CalendarVO callOneCalendar(@PathVariable("calendarid") int calendarId) {
		return calendarService.selectOne(calendarId);
	}
	@CrossOrigin
	@PostMapping("/calender/save")
	public int callInsertCalendar(@RequestBody CalendarVO vo) {
		return calendarService.setCalendar(vo);
	}
	@CrossOrigin
	@PatchMapping("/calender/update/{id}")
	public int callUpdateCalendar(@PathVariable("calendarid") int calendarId, CalendarVO vo) {
		return calendarService.updateCalendar(calendarId, vo);
	}
	
}
