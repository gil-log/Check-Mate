package com.checkmate.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.checkmate.service.HomeworkService;
import com.checkmate.vo.CalendarVO;
import com.checkmate.vo.GroupVO;
import com.checkmate.vo.NoticeVO;
import com.checkmate.vo.WrapperVO;

import oracle.sql.DATE;

@Controller
public class MypageController {

	@Inject
	HomeworkService homeworkService;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypageget() {
		logger.info("mypage_get");
		
		return "mypage";
	}
	
	@RequestMapping(value = "/caltest", method = RequestMethod.GET)
	@ResponseBody
	public Object noticeajaxget(@ModelAttribute CalendarVO calendarVO) throws Exception {
	        
		logger.info("/caltest_get");
		
		System.out.println("start : "+calendarVO.getStart());
		System.out.println("end : "+calendarVO.getEnd());
		
		List<CalendarVO> calendarList = new ArrayList<>
		return 
	}
}
