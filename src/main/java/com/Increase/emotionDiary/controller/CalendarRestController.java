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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Increase.emotionDiary.VO.CalendarVO;
import com.Increase.emotionDiary.service.CalendarService;
import com.github.pagehelper.PageInfo;

@RestController
public class CalendarRestController {

	@Autowired
	private CalendarService calendarService;
	
	//일기장호출
	@CrossOrigin
	@GetMapping("/calendar/{memberName}")
	public List<Map<String,Object>> callCalendar(@PathVariable("memberName") String memberName){
		return calendarService.selectList(memberName);
	}
	//월별 정보호출
	@CrossOrigin
	@GetMapping("/calendar/{memberName}/{calendarMonthFirstDay}/{calendarCode}")
	public List<Map<String,Object>> callCalendarMonth(@PathVariable("memberName") String memberName, @PathVariable("calendarMonthFirstDay") int calendarMonthFirstDay, @PathVariable("calendarCode") int calendarCode){
		return calendarService.selectMonth(memberName, calendarMonthFirstDay, calendarCode);
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
	//달력 수정
	@CrossOrigin
	@PatchMapping("/calendar/update/{id}")
	public int callUpdateCalendar(@PathVariable("id") int calendarId, @RequestBody CalendarVO vo) {
		return calendarService.updateCalendar(calendarId, vo);
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
	//월별 통계
	@CrossOrigin
	@GetMapping("/calendar/month/statistics/{memberid}/{calendarMonthFirstDay}/{calendarCode}")
	public Map<String, Object> callstatistics(@PathVariable("memberid") int memberId, @PathVariable("calendarMonthFirstDay") int calendarMonthFirstDay, @PathVariable("calendarCode") int calendarCode){
		return calendarService.calendarStatistics(memberId, calendarMonthFirstDay, calendarCode);
	}
	@CrossOrigin
	@GetMapping("/calendar/paging")
	public PageInfo<Map<String,Object>> callPaging(@RequestParam("memberName") String memberName, @RequestParam("pageNum") int pageNum, @RequestParam("pageSize") int pageSize){
		List<Map<String, Object>> list = calendarService.pagingSelect(memberName, pageNum, pageSize);
		return new PageInfo<Map<String, Object>>(list);
	}
	
}
