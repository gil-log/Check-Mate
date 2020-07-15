package com.checkmate.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.checkmate.service.AttendService;
import com.checkmate.vo.AttendVO;

@Controller
public class AttendController {
	
	
	@Inject
	AttendService attendService;
	
	private static final Logger logger = LoggerFactory.getLogger(AttendController.class);
	
	@RequestMapping(value = "/attend", method = RequestMethod.GET)
	public String attendget(HttpServletRequest request, Model model, AttendVO attendVO) throws Exception {
		logger.info("attend_get");
		
		//세션으로 u_id, g_no 받아와서 사용
		attendVO.setG_no(1);
		attendVO.setU_id("test1");
		List<AttendVO> attendList = attendService.attendList(attendVO);

		
		model.addAttribute("attendList", attendList);
		return "attend";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public Object testpost(HttpServletRequest request) throws Exception {
           
		logger.info("/test_post");

		String test = request.getParameter("test");
		logger.info(test);

		String msg = "컨트롤러에서 뷰로";
		return msg;
   }
	
	@RequestMapping(value = "/attendInsert", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public Object attendInsertpost(HttpServletRequest request, AttendVO attendVO) throws Exception {
           
		logger.info("/test_post");

		String [] testArr = request.getParameter("test").split("=");
		String test = testArr[1];
		
		//세션으로 u_id, g_no 받아와서 사용
		attendVO.setG_no(1);
		attendVO.setU_id("test1");
		attendVO.setA_date(test);
		attendService.attendInsert(attendVO);
		
		
		logger.info(test);

		String msg = test;
		return "attend";
   }
}