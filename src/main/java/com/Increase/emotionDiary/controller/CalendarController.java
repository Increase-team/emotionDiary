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
	
	@GetMapping("/calendar/list")
	public String callCalendarList(ModelMap map, @RequestParam("membername") String memberName) {
		List<Map<String, Object>> list = calendarService.selectList(memberName);
		map.addAttribute("list", list);
		return "calendar";
	}
	@GetMapping("/calendar/diary")
	public String callDiaryList(ModelMap map, @RequestParam("memberName") String memberName, @RequestParam("pageNum") int pageNum,
			@RequestParam("pageSize") int pageSize) {
		List<Map<String, Object>> list = calendarService.pagingSelect(memberName, pageNum, pageSize);
		PageInfo<Map<String,Object>> pageInfo = new PageInfo<Map<String,Object>>(list);
		map.addAttribute("list", pageInfo);
		return "diary";
	}
	@GetMapping("/calendar/search")
	public String callDiarySearchList(ModelMap map, @RequestParam("memberName") String memberName, @RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize, @RequestParam("search") String search) {
		List<Map<String, Object>> list = calendarService.searchPaging(memberName, pageNum, pageSize, search);
		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String,Object>>(list);
		map.addAttribute("list",pageInfo);
		return "diary";
	}
}
