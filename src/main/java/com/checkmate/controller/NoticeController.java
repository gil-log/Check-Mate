package com.checkmate.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.checkmate.service.NoticeService;
import com.checkmate.vo.GroupVO;
import com.checkmate.vo.NoticeVO;
import com.checkmate.vo.WrapperVO;

@Controller
public class NoticeController {
	
	@Inject
	NoticeService noticeService;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@RequestMapping(value = "/information", method = RequestMethod.GET)
	public String noticeget(HttpServletRequest request) throws Exception {
		logger.info("information_get");
		
		//로그인 처리 부분의 세션으로 대체 할 예정
		GroupVO groupVO = new GroupVO();
		groupVO.setG_no(1);
		groupVO.setG_name("테스트그룹");
		groupVO.setU_id("test");
		groupVO.setG_flag(1);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("group", groupVO);
		//로그인 후의 세션 처리로 대체 예정
		
		return "notice";
	}
	
	@RequestMapping(value = "/notice", method = RequestMethod.POST)
	@ResponseBody
	public Object noticeajaxget(HttpServletRequest request) throws Exception {
	        
		logger.info("/notice_post");

		HttpSession session = request.getSession();
		
		GroupVO groupVO = (GroupVO) session.getAttribute("group");

		logger.info(groupVO.getU_id());

		
		int noticeListCount = noticeService.noticeListCount(groupVO);
		List<NoticeVO> noticeList = noticeService.noticeList(groupVO);
		
		/*
		for(int i = 0 ; i<noticeList.size(); i++) {
			System.out.println(i+"번째"+"N_no : " +noticeList.get(i).getN_no());
			System.out.println(i+"번째"+"N_no : " +noticeList.get(i).getN_title());
			System.out.println(i+"번째"+"N_no : " +noticeList.get(i).getN_date());
			System.out.println(i+"번째"+"N_no : " +noticeList.get(i).getU_id());
		}
		*/
		
		WrapperVO rtnVO = new WrapperVO();
		rtnVO.setAaData(noticeList);
		rtnVO.setiTotalDisplayRecords(noticeListCount);
		rtnVO.setiTotalRecords(noticeListCount);
		
		return rtnVO;
	}
}
