package com.checkmate.controller;

import java.util.ArrayList;
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
		
		return "notice";
	}
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	@ResponseBody
	public Object noticeajaxget(HttpServletRequest request, @ModelAttribute NoticeVO noticeVO) throws Exception {
	        
		logger.info("/notice_get");
		
		int n_no = noticeVO.getN_no();

		if (n_no == 0) {
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
		} else {

			NoticeVO notice = noticeService.noticeRead(noticeVO);

			return notice;
		}

	}
	
	@RequestMapping(value = "/notice", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public Object noticeajaxpost(HttpServletRequest request) throws Exception {
	        
		logger.info("/notice_post");

		String[] notice = request.getParameterValues("notice");
		
		NoticeVO noticeVO = new NoticeVO();
		
		noticeVO.setN_title(notice[0]);
		noticeVO.setN_content(notice[1]);

		logger.info("제목 : " + notice[0] + ", 내용 : " + notice[1]);
		
		HttpSession session = request.getSession();
		
		GroupVO groupVO = (GroupVO) session.getAttribute("group");

		String msg = "";
		
		if(groupVO.getG_flag()!=1) {
			msg = "관리자만 공지사항을 작성 할 수 있습니다.";
		} else {
			noticeVO.setN_writer(groupVO.getU_id());
			noticeVO.setG_no(groupVO.getG_no());
			noticeVO.setU_id(groupVO.getU_id());
			noticeService.noticeWrite(noticeVO);
			msg = "공지사항이 생성 되었습니다!";
		}
		return msg;
	}
	
	@RequestMapping(value = "/notice", method = RequestMethod.DELETE, produces = "application/text; charset=utf8")
	@ResponseBody
	public Object noticeajaxdelete(HttpServletRequest request, @ModelAttribute NoticeVO noticeVO) throws Exception {
	        
		logger.info("/notice_delete");
		
		int n_no = noticeVO.getN_no();

		noticeService.noticeDelete(noticeVO);
		
		String msg = "삭제 되었습니다.";
		
		return msg;
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
}
