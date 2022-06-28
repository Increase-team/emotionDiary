package com.Increase.emotionDiary.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
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
	//달력호출
	@CrossOrigin
	@GetMapping("/calendar/{memberName}")
	public List<Map<String,Object>> callCalendar(@PathVariable("memberName") String memberName){
		return calendarService.selectList(memberName);
	}
	//개인 달력 기록 확인
	@CrossOrigin
	@GetMapping("/calendar/id/{calendarid}")
	public CalendarVO callOneCalendar(@PathVariable("calendarid") int calendarId) {
		return calendarService.selectOne(calendarId);
	}
	//달력 저장
	@CrossOrigin
	@PostMapping("/calendar/save")
	public int callInsertCalendar(@RequestBody CalendarVO vo) {
		return calendarService.setCalendar(vo);
	}
	//달력 삭제
	@CrossOrigin
	@DeleteMapping("/calendar/delete/{calendarid}")
	public int callDeleteCalendar(@PathVariable("calendarid")int calendarId) {
		return calendarService.deleteCalendar(calendarId);
	}
	//통계
	@CrossOrigin
	@GetMapping("/calendar/statistics/{memberid}")
	public Map<String, Object> callstatistics(@PathVariable("memberid") int memberId){
		return calendarService.selectstatistics(memberId);
	}
	
}
