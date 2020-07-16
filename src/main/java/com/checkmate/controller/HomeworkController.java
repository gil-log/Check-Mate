package com.checkmate.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.checkmate.service.HomeworkService;
import com.checkmate.vo.GroupVO;
import com.checkmate.vo.HomeworkVO;
import com.checkmate.vo.UserVO;



@Controller
@RequestMapping("/homework/*")
public class HomeworkController {

	private static final Logger logger = LoggerFactory.getLogger(HomeworkController.class);
	@Inject
	HomeworkService service;
	
	// 과제 작성 화면
	@RequestMapping(value = "/homework-show", method = RequestMethod.GET)
	public void homeworkShow() throws Exception{
		logger.info("homework-show");
		
	}
	
	// 과제 작성
	@RequestMapping(value = "/homework-write", method = RequestMethod.POST)
	public String write(HomeworkVO homeworkVO) throws Exception{
		logger.info("homework-write");
		
		service.write(homeworkVO);
		/*
		 * UserVO userVO= new UserVO(); userVO.setU_id("admin");
		 * 
		 * GroupVO groupVO= new GroupVO(); groupVO.setG_no(1);
		 * 
		 * homeworkVO.setH_file(null);
		 */
		return "redirect:/";
	}
}
