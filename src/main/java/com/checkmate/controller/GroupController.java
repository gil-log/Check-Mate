package com.checkmate.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.checkmate.service.GroupService;
import com.checkmate.service.UserService;
import com.checkmate.vo.GroupVO;
import com.checkmate.vo.UserVO;
import com.checkmate.vo.WrapperVO;


@Controller
public class GroupController {

	@Inject
	GroupService service;
	@Inject
	UserService userService;

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
	
	
	
	
	//초대현황
		@RequestMapping(value = "/groupCheck", method = RequestMethod.GET)
		@ResponseBody
		public Object groupCheckajaxget(HttpServletRequest request, @ModelAttribute GroupVO groupVO) throws Exception {

			logger.info("/groupCheck_get");

			int g_no = groupVO.getG_no();

			if (g_no == 0) {
				HttpSession session = request.getSession();

				UserVO userVO = (UserVO) session.getAttribute("user");

				logger.info(userVO.getU_id());

				int groupListCount = service.GroupListCount(userVO);
				List<GroupVO> groupCheck = service.groupCheck(userVO);

				for (int i = 0; i < groupCheck.size(); i++) {
					System.out.println(i + "번째" + "G_name : " + groupCheck.get(i).getG_name());
					System.out.println(i + "번째" + "G_flag : " + groupCheck.get(i).getG_flag());
					
				}

				WrapperVO rtnVO = new WrapperVO();
				rtnVO.setAaData(groupCheck);
				rtnVO.setiTotalDisplayRecords(groupListCount);
				rtnVO.setiTotalRecords(groupListCount);
				/* System.out.println(groupList); */

				return rtnVO;
			} else {

				GroupVO group = service.groupRead(groupVO);

				return group;
			}

		}
		
		// 초대 yes
		@RequestMapping(value = "/groupYes", method = RequestMethod.GET, produces = "application/text; charset=utf8")
		@ResponseBody
		public Object groupYesajaxdelete(HttpServletRequest request, @ModelAttribute GroupVO groupVO) throws Exception {

			logger.info("/groupYes_update");

			HttpSession session = request.getSession();

			UserVO userVO = (UserVO) session.getAttribute("user");

			groupVO.setU_id(userVO.getU_id());
			System.out.println(groupVO.getU_id());
			System.out.println(groupVO.getG_no());
			service.groupYes(groupVO);

			String url = "group";
			return url;
		}

		// 초대 no
		@RequestMapping(value = "/groupNo", method = RequestMethod.GET, produces = "application/text; charset=utf8")
		@ResponseBody
		public Object groupNoajaxdelete(HttpServletRequest request, @ModelAttribute GroupVO groupVO) throws Exception {

			logger.info("/groupNo_delete");

			HttpSession session = request.getSession();
			UserVO userVO = (UserVO) session.getAttribute("user");

			groupVO.setU_id(userVO.getU_id());
			service.groupNo(groupVO);

			String msg = "삭제 되었습니다.";
			return msg;
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

	@RequestMapping(value = "/userPlus", method = RequestMethod.POST, produces = "application/text; charset=utf8")
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
		String link = "http://checknmate.ml/mailAuth?code=";
	 
		String setfrom = "checkmatekingbot@gamil.com"; 
		  
		String title = "Check&Mate 그룹 초대 신청이 도착했습니다."; // 제목 
		
		String tomail = ""; // 받는사람 이메일
		
		String content = "";
		
		Random r = new Random();
        int randomGFlag = 1; //이메일로 받는 인증코드 부분 (난수)
        
        HttpSession session = request.getSession();
        
        
        String msg = "";
        int msgFlag = 0;
        
		for(int i = 0 ; i < userListVO.size(); i++) {
			
			r = new Random(); 
			randomGFlag = r.nextInt(99990) + 5;
			System.out.println(randomGFlag);
			 
			tomail = userService.userMail(userListVO.get(i).getU_id());
			content = 
					  System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
					  System.getProperty("line.separator")+
					  "안녕하세요 Check&Mate입니다."+
					  System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
					  System.getProperty("line.separator")+
					  "'" + gName + "'"+"그룹에서 그룹 초대 메일이 도착하였습니다."
					  +System.getProperty("line.separator")+
					  System.getProperty("line.separator")+
					  "승인을 원하시면  아래 링크로 접속하여 주세요"
					  +System.getProperty("line.separator")+
					  System.getProperty("line.separator")+
					  link + randomGFlag; // 내용
			  
	        try {
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

	            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
	            messageHelper.setTo(tomail); // 받는사람 이메일
	            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	            messageHelper.setText(content); // 메일 내용
	            
	            mailSender.send(message);
	            
				userListVO.get(i).setG_flag(randomGFlag);
				service.userPlus(userListVO.get(i));
	            
	            session.setAttribute(Integer.toString(randomGFlag), userListVO.get(i));
	            
	        } catch (Exception e) {
	            System.out.println(e);
	            msgFlag = 1;
	            
	            msg += userListVO.get(i).getU_id()+" ";
	        }
			
			System.out.println("메일 받는 아이디 : " + tomail + "링크 : "+ link + randomGFlag);
		}

		if(msgFlag == 0) {
			return "그룹 초대에 성공 하였습니다.";
		}
		else {
			msg += "님의 초대에 실패하였습니다.";
			return msg;
		}
	}
	
	// 그룹 폐쇄
	@RequestMapping(value = "/grouplock", method = RequestMethod.GET)
	public String grouplock(HttpServletRequest request) throws Exception {
		logger.info("grouplock");
		
		HttpSession session = request.getSession();

		GroupVO groupVO = (GroupVO) session.getAttribute("group");
		
		groupVO.setG_flag(0);
		service.groupLock(groupVO);
		
		groupVO.setG_flag(1);
		service.groupLock(groupVO);
		
		return "redirect:group";
	}

}