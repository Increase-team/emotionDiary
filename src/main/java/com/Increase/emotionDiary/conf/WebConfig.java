//package com.Increase.emotionDiary.conf;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//
//import com.Increase.emotionDiary.interceptor.Interceptor;
//
//@Configuration
//public class WebConfig implements WebMvcConfigurer {
//
//	@Autowired
//	private Interceptor interceptor;
//
//	@Override
//	public void addInterceptors(InterceptorRegistry registry) {
//		registry.addInterceptor(interceptor).excludePathPatterns("/login", "/join", "/main",
//				"/resources/static/css/*",
//				"/resources/static/js/*",
//				"/resources/static/images/*",
//				"/resources/static/video/*",
//				"/members", "/member/id/*",
//				"/calendar/id/*","/calendar/statistics/*", "/calendar/save","/calendar/*", "/calendar/delete/*", "/calendar/*");
//	}
//
//}
