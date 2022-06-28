package com.Increase.emotionDiary.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Increase.emotionDiary.service.CalendarService;
import com.github.pagehelper.PageInfo;

@Controller
public class CalendarController {

	@Autowired
	private CalendarService calendarService;
	
	@GetMapping("/calendar")
	public String callCalendar() {
		return "calendar2";
	}
	@GetMapping("/calendar/list")
	public String callSearchBoard(ModelMap map, @RequestParam("memberid") String memberId) {
		List<Map<String, Object>> list = calendarService.selectList(memberId);
		map.addAttribute("list", list);
		return "calendar2";
	}
}
