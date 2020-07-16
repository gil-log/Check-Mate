package com.checkmate.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.checkmate.service.UserService;
import com.checkmate.vo.UserVO;

@Controller
public class UserController {
	
private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
@Inject
UserService service;

	//첫화면(로그인)
	@RequestMapping(value = "/checkmate", method = RequestMethod.GET)
	public String checkmateget() {
		logger.info("checkmate_get");
		
		return "checkmate";
	}	
	
	//로그인 성공,실패시 갈곳
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		logger.info("post login");
		
		
		HttpSession session = req.getSession();
		UserVO loginchk = service.login(vo);
		UserVO login = new UserVO();
				
		if(loginchk == null) {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("msg", false);
			return "checkmate";
		}else {
			login = service.userinfo(loginchk.getU_id());
			session.setAttribute("user", login);
			logger.info(login.getU_id());
			return "group";
		}
		
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "checkmate";
	}
	
	//회원가입 POST
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(UserVO vo) throws Exception {
		logger.info("post register");
		
		service.register(vo);
		
		return "checkmate";
	}
	
	/*
	 * //아이디 체크
	 * 
	 * @RequestMapping(value = "/checkSignup", method = RequestMethod.POST)
	 * public @ResponseBody String AjaxView(
	 * 
	 * @RequestParam("u_id") String u_id){ String str = ""; UserVO idcheck =
	 * service.login(vo); if(idcheck==1){ //이미 존재하는 계정 str = "NO"; }else{ //사용 가능한
	 * 계정 str = "YES"; } return str; }
	 */

}
