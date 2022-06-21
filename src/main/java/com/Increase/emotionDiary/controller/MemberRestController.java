package com.Increase.emotionDiary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.Increase.emotionDiary.service.MemberService;

@RestController
public class MemberRestController {

	@Autowired
	private MemberService memberService;
}
