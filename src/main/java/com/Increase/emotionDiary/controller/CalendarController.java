package com.Increase.emotionDiary.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Increase.emotionDiary.service.CalendarService;

@Controller
public class CalendarController {

	@Autowired
	private CalendarService calendarService;
	
	
	@GetMapping("/calendar")
	public String callCalendar() {
		return "calendar";
	}
	@GetMapping("/calendar/list")
	public String callCalendarList(ModelMap map, @RequestParam("membername") String memberName) {
		List<Map<String, Object>> list = calendarService.selectList(memberName);
		map.addAttribute("list", list);
		return "calendar";
	}
	@GetMapping("/calendar/diary")
	public String callDiaryList(ModelMap map, @RequestParam("membername") String memberName, @RequestParam("pageNum") int pageNum,
			@RequestParam("pageSize") int pageSize) {
		List<Map<String, Object>> list = calendarService.pagingSelect(memberName, pageNum, pageSize);
		map.addAttribute("list", list);
		return "diary";
	}
}
