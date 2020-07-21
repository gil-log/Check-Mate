package com.checkmate.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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
import com.checkmate.vo.GroupVO;
import com.checkmate.vo.HomeworkVO;
import com.checkmate.vo.NoticeVO;
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
		logger.info("/homeworkadd_get");
			
		int h_no = homeworkVO.getH_no();
		
			
		if(h_no == 0) {
			HttpSession session = request.getSession();
			GroupVO groupVO = (GroupVO) session.getAttribute("group");
			logger.info(""+groupVO.getG_no());
				
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

			HomeworkVO homework = service.homeworkread(h_no);

			return homework;
		}

	}
	
	//과제 등록post (그룹장)
	@RequestMapping(value = "/homeworkadd", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public Object hwaddpost(HttpServletRequest request) throws Exception {
	        
		logger.info("/homeworkadd_post");

		String[] homework = request.getParameterValues("homework");
		
		HomeworkVO homeworkVO = new HomeworkVO();
		
		homeworkVO.setH_title(homework[0]);
		homeworkVO.setH_content(homework[1]);

		logger.info("제목 : " + homework[0] + ", 내용 : " + homework[1]);
		
		HttpSession session = request.getSession();
		
		GroupVO groupVO = (GroupVO) session.getAttribute("group");

		String msg = "";
		
		if(groupVO.getG_flag()!=1) {
			msg = "관리자만 과제를 등록 할 수 있습니다.";
		} else {
			homeworkVO.setU_id(groupVO.getU_id());
			homeworkVO.setG_no(groupVO.getG_no());
			
			service.write(homeworkVO);
			msg = "과제가 생성 되었습니다!";
		}
		return msg;
	}
	
	// 과제 작성 화면(학생들)
	@RequestMapping(value = "/homeworkshow", method = RequestMethod.GET)
	public String homeworkShow(HomeworkVO homeworkVO, Model model, HttpServletRequest request) throws Exception{
		logger.info("/homeworkshow_get");
		HttpSession session = request.getSession();
		GroupVO groupVO = (GroupVO) session.getAttribute("group");
		//과제상세내용 불러오기
		int h_no = homeworkVO.getH_no();
		logger.info(""+h_no);
		
		model.addAttribute("homework", service.homeworkread(h_no));
		//과제 제출 폼도 여기있음
		
		
		return "homeworkshow";
				
		
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