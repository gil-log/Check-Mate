package com.checkmate.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.checkmate.service.HomeworkService;
import com.checkmate.service.NoticeService;
import com.checkmate.vo.GroupVO;
import com.checkmate.vo.HomeworkVO;
import com.checkmate.vo.NoticeVO;

@Controller
public class MainController {
	
	@Inject
	NoticeService noticeService;
	@Inject
	HomeworkService homeworkService;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainget(HttpServletRequest request, Model model) throws Exception {
		logger.info("main_get");
		
		
		//로그인 처리 부분의 세션으로 대체 할 예정
		GroupVO groupVO = new GroupVO();
		groupVO.setG_no(1);
		groupVO.setG_name("테스트그룹1");
		groupVO.setU_id("ttest");
		groupVO.setG_flag(0);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("group", groupVO);
		//로그인 후의 세션 처리로 대체 예정
		
		int noticeListCount = noticeService.noticeListCount(groupVO);
		
		if(noticeListCount==0) {
			model.addAttribute("noticeIsNull", 1);
		} else {
			List<NoticeVO> noticeList = noticeService.noticeListMini(groupVO);
			model.addAttribute("noticeIsNull", 0);
			model.addAttribute("noticeList", noticeList);
			logger.info("noticeisNull : 0");
		}
		
		int homeworkListCount = homeworkService.homeworkListCount(groupVO);
		
		logger.info(Integer.toString(homeworkListCount));
		
		if(homeworkListCount==0) {
			model.addAttribute("homeworkIsNull", 1);
		} else {
			List<HomeworkVO> homeworkList = homeworkService.homeworkListMini(groupVO);
			model.addAttribute("homeworkIsNull", 0);
			model.addAttribute("homeworkList", homeworkList);
		}
		
		return "main";
	}
	
	@RequestMapping(value = "/main2", method = RequestMethod.GET)
	public String main2get(HttpServletRequest request, Model model) throws Exception {
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
			model.addAttribute("noticeIsNull", 1);
		} else {
			List<NoticeVO> noticeList = noticeService.noticeListMini(groupVO);
			model.addAttribute("noticeIsNull", 0);
			model.addAttribute("noticeList", noticeList);
			logger.info("noticeisNull : 0");
		}
		
		int homeworkListCount = homeworkService.homeworkListCount(groupVO);
		
		logger.info(Integer.toString(homeworkListCount));
		
		if(homeworkListCount==0) {
			model.addAttribute("homeworkIsNull", 1);
		} else {
			List<HomeworkVO> homeworkList = homeworkService.homeworkListMini(groupVO);
			model.addAttribute("homeworkIsNull", 0);
			model.addAttribute("homeworkList", homeworkList);
		}
		
		return "main";
	}
	
	@RequestMapping(value = "/main3", method = RequestMethod.GET)
	public String main3get(HttpServletRequest request, Model model) throws Exception {
		logger.info("main_get");
		
		
		//로그인 처리 부분의 세션으로 대체 할 예정
		GroupVO groupVO = new GroupVO();
		groupVO.setG_no(2);
		groupVO.setG_name("테스트그룹2");
		groupVO.setU_id("testrank1");
		groupVO.setG_flag(1);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("group", groupVO);
		//로그인 후의 세션 처리로 대체 예정
		
		int noticeListCount = noticeService.noticeListCount(groupVO);
		
		if(noticeListCount==0) {
			model.addAttribute("noticeIsNull", 1);
		} else {
			List<NoticeVO> noticeList = noticeService.noticeListMini(groupVO);
			model.addAttribute("noticeIsNull", 0);
			model.addAttribute("noticeList", noticeList);
			logger.info("noticeisNull : 0");
		}
		
		int homeworkListCount = homeworkService.homeworkListCount(groupVO);
		
		logger.info(Integer.toString(homeworkListCount));
		
		if(homeworkListCount==0) {
			model.addAttribute("homeworkIsNull", 1);
		} else {
			List<HomeworkVO> homeworkList = homeworkService.homeworkListMini(groupVO);
			model.addAttribute("homeworkIsNull", 0);
			model.addAttribute("homeworkList", homeworkList);
		}
		
		return "main";
	}
	
	@RequestMapping(value = "/main4", method = RequestMethod.GET)
	public String main4get(HttpServletRequest request, Model model) throws Exception {
		logger.info("main_get");
		
		
		//로그인 처리 부분의 세션으로 대체 할 예정
		GroupVO groupVO = new GroupVO();
		groupVO.setG_no(2);
		groupVO.setG_name("테스트그룹2");
		groupVO.setU_id("testrank2");
		groupVO.setG_flag(0);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("group", groupVO);
		//로그인 후의 세션 처리로 대체 예정
		
		int noticeListCount = noticeService.noticeListCount(groupVO);
		
		if(noticeListCount==0) {
			model.addAttribute("noticeIsNull", 1);
		} else {
			List<NoticeVO> noticeList = noticeService.noticeListMini(groupVO);
			model.addAttribute("noticeIsNull", 0);
			model.addAttribute("noticeList", noticeList);
			logger.info("noticeisNull : 0");
		}
		
		int homeworkListCount = homeworkService.homeworkListCount(groupVO);
		
		logger.info(Integer.toString(homeworkListCount));
		
		if(homeworkListCount==0) {
			model.addAttribute("homeworkIsNull", 1);
		} else {
			List<HomeworkVO> homeworkList = homeworkService.homeworkListMini(groupVO);
			model.addAttribute("homeworkIsNull", 0);
			model.addAttribute("homeworkList", homeworkList);
		}
		
		return "main";
	}
}
