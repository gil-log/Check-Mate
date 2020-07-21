package com.checkmate.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
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

import com.checkmate.service.GroupService;
import com.checkmate.vo.GroupVO;
import com.checkmate.vo.UserVO;
import com.checkmate.vo.WrapperVO;


@Controller
public class GroupController {

	@Inject
	GroupService service;

	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);

	// 그룹페이지 get
	@RequestMapping(value = "/group", method = RequestMethod.GET)
	public String getGroup() throws Exception {
		logger.info("get group");

		return "group";
	}

	// 그룹생성 POST
	@RequestMapping(value = "/group", method = RequestMethod.POST)
	public String postGroupCreate(GroupVO vo) throws Exception {
		logger.info("post groupcreater");

		service.GroupCreate(vo);

		return "group";
	}

	// 그룹 list
	@RequestMapping(value = "/grouplist", method = RequestMethod.GET)
	@ResponseBody
	public Object noticeajaxget(HttpServletRequest request, @ModelAttribute GroupVO groupVO) throws Exception {

		logger.info("/grouplist_get");

		int g_no = groupVO.getG_no();

		if (g_no == 0) {
			HttpSession session = request.getSession();

			UserVO userVO = (UserVO) session.getAttribute("user");

			logger.info(userVO.getU_id());

			int groupListCount = service.GroupListCount(userVO);
			List<GroupVO> groupList = service.GroupList(userVO);

			for (int i = 0; i < groupList.size(); i++) {
				System.out.println(i + "번째" + "G_no : " + groupList.get(i).getG_no());
				System.out.println(i + "번째" + "U_id : " + groupList.get(i).getU_id());
				System.out.println(i + "번째" + "G_name : " + groupList.get(i).getG_name());
				System.out.println(i + "번째" + "G_flag : " + groupList.get(i).getG_flag());
				System.out.println(i + "번째" + "U_point : " + groupList.get(i).getU_point());
			}

			WrapperVO rtnVO = new WrapperVO();
			rtnVO.setAaData(groupList);
			rtnVO.setiTotalDisplayRecords(groupListCount);
			rtnVO.setiTotalRecords(groupListCount);
			/* System.out.println(groupList); */

			return rtnVO;
		} else {

			GroupVO group = service.groupRead(groupVO);

			return group;
		}

	}

	// 그룹 조회
	@RequestMapping(value = "/groupRead", method = RequestMethod.GET)
	public String read(HttpServletRequest request, GroupVO groupVO, Model model, HttpServletResponse response) throws Exception {
		logger.info("read");
		
		HttpSession session = request.getSession();

		UserVO userVO = (UserVO) session.getAttribute("user");
		
		
		groupVO.setU_id(userVO.getU_id());
		System.out.println(groupVO.getU_id());
		System.out.println(groupVO.getG_no());
		GroupVO group = service.groupRead(groupVO);

		System.out.println(group);
		session.setAttribute("group", group);
		//세션설정하기
		//mai
		String url = "main";
//		response.sendRedirect("main");
		return url;
	}

	// 그룹 user 추가

	@RequestMapping(value = "/userPlus", method = RequestMethod.POST)
	@ResponseBody
	public String postuserPlus(HttpServletRequest request) throws Exception {
		logger.info("post userPlus");

		String[] ajaxMsg = request.getParameterValues("grouplist");
		int size = ajaxMsg.length;

		logger.info("size : " + Integer.toString(size));

		List<GroupVO> userListVO = new ArrayList<GroupVO>();

		String[][] msgSplit = new String[size][3];

		for (int i = 0; i < size; i++) {

			msgSplit[i] = ajaxMsg[i].split(",");

			logger.info("JSP에서 받은 MSG : " + msgSplit[i][0]);
			logger.info("JSP에서 받은 MSG : " + msgSplit[i][1]);
			logger.info("JSP에서 받은 MSG : " + msgSplit[i][2]);
			
			  GroupVO gVO = new GroupVO();
			  
			  gVO.setG_no(Integer.parseInt(msgSplit[i][0]));
			  gVO.setG_name(msgSplit[i][1]);
			  gVO.setU_id(msgSplit[i][2]);
			  gVO.setG_flag(0);
			  gVO.setU_point(0);
			  
			  userListVO.add(gVO);
			  
		}
		
		for(int i = 0 ; i < userListVO.size(); i++) {
			service.userPlus(userListVO.get(i));
		}

		return "group";
	}

}