package com.checkmate.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.checkmate.service.NoticeService;
import com.checkmate.vo.GroupVO;
import com.checkmate.vo.NoticeVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	@Inject
	NoticeService noticeService;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@RequestMapping(value = "/checkmate", method = RequestMethod.GET)
	public String checkmateget() {
		logger.info("checkmate_get");
		
		return "checkmate";
	}
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainget(HttpServletRequest request, Model model) throws Exception {
		logger.info("main_get");
		
		
		//로그인 처리 부분의 세션으로 대체 할 예정
		GroupVO groupVO = new GroupVO();
		groupVO.setG_no(1);
		groupVO.setG_name("테스트그룹1");
		groupVO.setU_id("test");
		groupVO.setG_flag(1);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("group", groupVO);
		//로그인 후의 세션 처리로 대체 예정
		
		int noticeListCount = noticeService.noticeListCount(groupVO);
		
		if(noticeListCount==0) {
			model.addAttribute("isNull", 1);
		} else {
			List<NoticeVO> noticeList = noticeService.noticeListMini(groupVO);
			model.addAttribute("isNull", 0);
			model.addAttribute("noticeList", noticeList);
			logger.info("isNull : 0");
		}
		
		return "main";
	}
}
