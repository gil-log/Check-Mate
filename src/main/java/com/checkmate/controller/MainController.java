package com.checkmate.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
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
