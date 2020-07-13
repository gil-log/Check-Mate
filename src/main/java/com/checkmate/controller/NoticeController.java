package com.checkmate.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.franchaining.vo.StockVO;
import com.franchaining.vo.WrapperVO;

@Controller
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@RequestMapping(value = "/information", method = RequestMethod.GET)
	public String noticeget() {
		logger.info("notice_get");
		
		return "notice";
	}
	
	@RequestMapping(value = "/notice", method = RequestMethod.POST)
	@ResponseBody
	public String noticeajaxget(HttpServletRequest request) throws Exception {
	        
		logger.info("/stock_list");
		
		List<StockVO> stockList = stockService.stockList();
		
		WrapperVO rtnVO = new WrapperVO();
		rtnVO.setAaData(stockList);
		rtnVO.setiTotalDisplayRecords(stockService.listCount());
		rtnVO.setiTotalRecords(stockService.listCount());
		
		return rtnVO;
	}
}
