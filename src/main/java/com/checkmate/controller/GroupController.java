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

import com.checkmate.service.GroupService;
import com.checkmate.vo.GroupVO;
import com.checkmate.vo.NoticeVO;
import com.checkmate.vo.WrapperVO;


@Controller
public class GroupController {
	
	@Inject
	GroupService service;
	
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);

	//그룹생성 POST
		@RequestMapping(value = "/groupcreate", method = RequestMethod.POST)
		public String postGroupCreate(GroupVO vo) throws Exception {
			logger.info("post groupcreater");
					
			service.GroupCreate(vo);
			
			return "group";
		}
		
	//그룹 list
		
}