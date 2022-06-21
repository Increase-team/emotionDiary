package com.Increase.emotionDiary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.Increase.emotionDiary.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
}
