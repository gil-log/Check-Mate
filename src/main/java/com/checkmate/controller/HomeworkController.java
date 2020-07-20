package com.checkmate.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.checkmate.service.HomeworkService;
import com.checkmate.vo.GroupVO;
import com.checkmate.vo.HomeworkVO;
import com.checkmate.vo.WrapperVO;

@Controller
public class HomeworkController {

	private static final Logger logger = LoggerFactory.getLogger(HomeworkController.class);
	@Inject
	HomeworkService service;
	//과제 목록 화면
	@RequestMapping(value = "/homeworklist", method = RequestMethod.GET)
	public String hwlistget(HttpServletRequest request) throws Exception {
		logger.info("/homework-list");
		return "homeworklist";

	}
	
	//과제  목록
	@RequestMapping(value = "/homeworkadd", method = RequestMethod.GET)
	@ResponseBody
	public Object hwaddget(HttpServletRequest request, @ModelAttribute HomeworkVO homeworkVO) throws Exception {
		logger.info("/homeworkadd");
			
		int h_no = homeworkVO.getH_no();
		logger.info(""+h_no);
			
		if(h_no == 0) {
			HttpSession session = request.getSession();
			GroupVO groupVO = (GroupVO) session.getAttribute("group");
			logger.info(groupVO.getU_id());
				
			int homeworkListAllCount = service.homeworkListAllCount(groupVO);
			List<HomeworkVO> homeworkList = service.homeworkList(groupVO);
				
			for (int i = 0; i < homeworkList.size(); i++) {
				System.out.println(i + "번째" + "H_no : " + homeworkList.get(i).getH_no());
				System.out.println(i + "번째" + "H_title : " + homeworkList.get(i).getH_title());
				System.out.println(i + "번째" + "H_deadline : " + homeworkList.get(i).getH_deadline());
				System.out.println(i + "번째" + "U_id : " + homeworkList.get(i).getU_id());
			}

			WrapperVO rtnVO = new WrapperVO();
			rtnVO.setAaData(homeworkList);
			rtnVO.setiTotalDisplayRecords(homeworkListAllCount);
			rtnVO.setiTotalRecords(homeworkListAllCount);

			return rtnVO;
		}else {

			HomeworkVO homework = service.homeworkread(homeworkVO);

			return homework;
		}

	}
	
	// 과제 작성 화면(학생들)
	@RequestMapping(value = "/homeworkshow", method = RequestMethod.GET)
	public void homeworkShow(HttpServletRequest request) throws Exception{
		logger.info("homeworkshow");
		HttpSession session = request.getSession();
		//과제상세내용 불러오기
		
		//과제제출완료
		HomeworkVO homeworkVO = (HomeworkVO) session.getAttribute("homework");
				
		int h_no = homeworkVO.getH_no();
				
		logger.info(""+h_no);
	}
	
	// 과제 작성(학생들)
	@RequestMapping(value = "/homeworkwrite", method = RequestMethod.POST)
	public String homeworkpost(HttpServletRequest request, HomeworkVO homeworkVO) throws Exception{
		logger.info("homeworkwrite");
		
		service.homeworkwrite(homeworkVO);
		
		String msg = "";
		msg = "과제제출이 완료되었습니다.";
		return msg;
	}
}