package com.checkmate.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
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

	@Inject
	JavaMailSender mailSender; // 메일 서비스를 사용하기 위해 의존성을 주입함.
	
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
		
		System.out.println("세션 설정하는 그룹VO 정보 들" + " gno: "+group.getG_no() + " gname: "+group.getG_name() + " gflag: "+group.getG_flag() + " uid: "+group.getU_id());

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
		
		
		
		int gNo = Integer.parseInt(msgSplit[0][0]);
		String gName = msgSplit[0][1];

		  String tomail = "u_mail"; // 받는사람 이메일

		  String content =
		  
		  System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
		  
		  System.getProperty("line.separator")+
		  
		  "안녕하세요 Check&Mate입니다."+
		  
		  System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
		  
		  System.getProperty("line.separator")+
		  
		  "'" + gName + "'"+"그룹에서 그룹 초대 메일이 도착하였습니다."
		  
		  +System.getProperty("line.separator")+
		  
		  System.getProperty("line.separator")+
		  
		  "승인을 원하시면  아래 링크로 접속하여 주세요" +"dice"+ " 입니다. "
		  
		  +System.getProperty("line.separator")+
		  
		  System.getProperty("line.separator")+
		  
		  "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
		 
		  String setfrom = "checkmatekingbot@gamil.com"; 
		  
		  String title = "Check&Mate 그룹 초대 신청이 도착했습니다."; // 제목 
		
		Random r = new Random();
        int randomGFlag = 1; //이메일로 받는 인증코드 부분 (난수)
        
		
		
		for(int i = 0 ; i < userListVO.size(); i++) {
			service.userPlus(userListVO.get(i));
			
			
			
			  r = new Random(); randomGFlag = r.nextInt(4589362) + 2;
			  System.out.println(randomGFlag);
			 
		}

		return "group";
	}

}