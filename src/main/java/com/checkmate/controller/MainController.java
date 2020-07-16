package com.checkmate.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	
	@RequestMapping(value = "/checkmate", method = RequestMethod.GET)
	public String checkmateget() {
		logger.info("checkmate_get");
		
		return "checkmate";
	}
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mainget() {
		logger.info("main_get");
		
		return "main";
	}
}
