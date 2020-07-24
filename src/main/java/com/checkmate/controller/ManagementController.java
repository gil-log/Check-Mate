package com.checkmate.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.checkmate.service.HomeworkService;
import com.checkmate.service.NoticeService;
import com.checkmate.vo.GroupVO;
import com.checkmate.vo.HomeworkVO;
import com.checkmate.vo.NoticeVO;
import com.checkmate.vo.WrapperVO;

@Controller
public class ManagementController {

	@Inject
	NoticeService noticeService;
	@Inject
	HomeworkService homeworkService;

	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);

	@RequestMapping(value = "/management", method = RequestMethod.GET)
	public String managementget(HttpServletRequest request, Model model) throws Exception {
		logger.info("management_get");

		return "management";
	}
	
	@RequestMapping(value = "/groupresult", method = RequestMethod.GET)
	@ResponseBody
	public Object groupresultget(HttpServletRequest request, @ModelAttribute NoticeVO noticeVO) throws Exception {
	        
		logger.info("/groupresult_get");
		
		HttpSession session = request.getSession();

		GroupVO groupVO = (GroupVO) session.getAttribute("group");

		logger.info(groupVO.getU_id());

		int noticeListCount = noticeService.noticeListCount(groupVO);
		List<NoticeVO> noticeList = noticeService.noticeList(groupVO);

		for (int i = 0; i < noticeList.size(); i++) {
			System.out.println(i + "번째" + "N_no : " + noticeList.get(i).getN_no());
			System.out.println(i + "번째" + "N_title : " + noticeList.get(i).getN_title());
			System.out.println(i + "번째" + "N_date : " + noticeList.get(i).getN_date());
			System.out.println(i + "번째" + "U_id : " + noticeList.get(i).getU_id());
		}

		WrapperVO rtnVO = new WrapperVO();
		rtnVO.setAaData(noticeList);
		rtnVO.setiTotalDisplayRecords(noticeListCount);
		rtnVO.setiTotalRecords(noticeListCount);

		return rtnVO;

	}

}
