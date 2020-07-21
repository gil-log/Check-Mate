package com.checkmate.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.checkmate.api.KakaoAPI;
import com.checkmate.api.NaverLoginBO;
import com.checkmate.service.UserService;
import com.checkmate.vo.GroupVO;
import com.checkmate.vo.NoticeVO;
import com.checkmate.vo.UserVO;
import com.checkmate.vo.WrapperVO;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.web.bind.annotation.RequestParam;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class UserController {
	
private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
@Inject
UserService service;
@Inject
JavaMailSender mailSender; // 메일 서비스를 사용하기 위해 의존성을 주입함.

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	 
    @Autowired
    private KakaoAPI kakao;
    
	//첫화면(로그인)
	@RequestMapping(value = "/checkmate", method = RequestMethod.GET)
	public String checkmateget(Model model, HttpSession session) {
		logger.info("checkmate_get");
		
		//네아로 시작
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		System.out.println("네이버:" + naverAuthUrl);
		//네이버
		model.addAttribute("url", naverAuthUrl);

		//네아로 끝
		
		return "checkmate";
	}
	
	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public void callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletResponse response)
			throws Exception {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response의 nickname값 파싱
		String id = (String) response_obj.get("id");
		System.out.println(id);
		// 4.파싱 닉네임 세션으로 저장

		String email = (String) response_obj.get("email");

		System.out.println(email);
		
		String name = (String) response_obj.get("name");

		System.out.println(name);
		UserVO naverGroupVO = new UserVO();
		
		naverGroupVO.setU_id(name);
		naverGroupVO.setU_email(email);
		naverGroupVO.setU_name(name);
		naverGroupVO.setU_pwd(id);
		naverGroupVO.setU_flag(2);
		
		int naverAlreadyChk = service.socialAlreadyChk(naverGroupVO);
		
		if(naverAlreadyChk == 0) {
			service.socialReg(naverGroupVO);
		}

		session.setAttribute("user", naverGroupVO); 
		
		response.sendRedirect("group");
	
	}

	//카카오 callback
	
	@RequestMapping(value = "/kcallback", method = { RequestMethod.GET})
	public void callback(@RequestParam String code, HttpSession session, HttpServletResponse response)
			throws Exception {
		System.out.println("카카오 callback");
		
		System.out.println("code : " + code);

        String access_Token = kakao.getAccessToken(code);

        HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
        
        System.out.println(userInfo);
        
        UserVO kakaoUserVO = new UserVO();
        kakaoUserVO.setU_email((String)userInfo.get("email"));
        kakaoUserVO.setU_name((String)userInfo.get("nickname"));
        kakaoUserVO.setU_pwd((String)userInfo.get("id"));
        kakaoUserVO.setU_id((String)userInfo.get("nickname"));
        kakaoUserVO.setU_flag(3);
        
        System.out.println("카카오 로그인 // VO에 담은 정보 :" + kakaoUserVO.getU_email() + kakaoUserVO.getU_name() + kakaoUserVO.getU_id());
        
        int kakaoAlreadyChk = service.socialAlreadyChk(kakaoUserVO);
        
        if(kakaoAlreadyChk == 0 ) {
        	service.socialReg(kakaoUserVO);
        }
        
		session.setAttribute("user", kakaoUserVO); 
		
		response.sendRedirect("group");
        
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:checkmate";
	}
	
	//회원가입 POST
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(UserVO vo) throws Exception {
		logger.info("post register");
		
		service.register(vo);
		
		return "checkmate";
	}
	
	//메일인증
	@RequestMapping(value = "/mailAuth", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public Object mailAuthPost(HttpServletRequest request) throws Exception {
	        
		logger.info("/mailAuthPost");

		String[] data = request.getParameterValues("data");
		
		String u_mail = data[0];
		int ran = Integer.parseInt(data[1]);
		int authFlag = Integer.parseInt(data[2]);

		String msg = "";
		
		if(authFlag==0) {
			
	        Random r = new Random();
	        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
	        
	        HttpSession session = request.getSession();
	        
	        String setfrom = "checkmatekingbot@gamil.com";
	        String tomail = u_mail; // 받는 사람 이메일
	        String title = "Check&Mate 회원가입 인증 이메일 입니다."; // 제목
	        String content =
	        
	        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
	        
	        System.getProperty("line.separator")+
	                
	        "안녕하세요 회원님 Check&Mate를 찾아주셔서 감사합니다"
	        
	        +System.getProperty("line.separator")+
	        
	        System.getProperty("line.separator")+

	        " 인증번호는 " +dice+ " 입니다. "
	        
	        +System.getProperty("line.separator")+
	        
	        System.getProperty("line.separator")+
	        
	        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
			

			logger.info("메일: " + u_mail + "인증 난수 : " + ran);

	        try {
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

	            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
	            messageHelper.setTo(tomail); // 받는사람 이메일
	            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	            messageHelper.setText(content); // 메일 내용
	            
	            mailSender.send(message);
	            
	            session.setAttribute("dice", dice);
	            
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	        
		} else if(authFlag==1) {
			
			HttpSession session = request.getSession();
			int code = (int) session.getAttribute("dice");
			
			if(ran==code) {
				//인증성공
				msg ="0";
				return msg;
			} else {
				//인증실패
				msg="1";
				return msg;
			}
		}
		
		return msg;
	}
	
	//로그인 성공,실패시 갈곳
	@RequestMapping(value = "/loginok", method = RequestMethod.POST)
	public void login(UserVO vo, HttpServletRequest req, RedirectAttributes rttr, HttpServletResponse response) throws Exception{
		logger.info("post login");
		
		
		HttpSession session = req.getSession();
		UserVO loginchk = service.login(vo);
		UserVO login = new UserVO();
		
		
		
		String url = "";
				
		if(loginchk == null) {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("msg", false);
			
			url = "checkmate";
			
			response.sendRedirect(url);

		}else {
			login = service.userinfo(loginchk.getU_id());
			session.setAttribute("user", login);
			logger.info(login.getU_id());
			
			url = "group";
			response.sendRedirect(url);
			
		}
	}
	
	@RequestMapping(value = "/user" , method = RequestMethod.GET)
	@ResponseBody
	public Object userajaxget(HttpServletRequest request, @ModelAttribute GroupVO groupVO) throws Exception {

		logger.info("/user_get");
		
			
			List<UserVO> userList = service.userList(groupVO);
			int userListCount = service.userListCount(groupVO);
			
			WrapperVO rtnVO = new WrapperVO();
			rtnVO.setAaData(userList);
			rtnVO.setiTotalDisplayRecords(userListCount);
			rtnVO.setiTotalRecords(userListCount);
			
			return rtnVO;
					
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