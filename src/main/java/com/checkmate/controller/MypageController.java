package com.checkmate.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.checkmate.service.AttendService;
import com.checkmate.service.GroupService;
import com.checkmate.service.HomeworkService;
import com.checkmate.vo.AttendVO;
import com.checkmate.vo.CalendarVO;
import com.checkmate.vo.GroupVO;
import com.checkmate.vo.NoticeVO;
import com.checkmate.vo.WrapperVO;

import net.sf.json.JSONArray;
import oracle.sql.DATE;

@Controller
public class MypageController {

	@Inject
	HomeworkService homeworkService;
	@Inject
	AttendService attendService;
	@Inject
	GroupService groupService;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypageget() {
		logger.info("mypage_get");
		
		return "mypage";
	}
	
	@RequestMapping(value = "/calendarinfo", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public Object calendarInfoget(HttpServletRequest request) throws Exception {
	        
		logger.info("/calendarInfo_get");


		AttendVO attendVO = new AttendVO();
		
		HttpSession session = request.getSession();
		
		GroupVO groupVO = (GroupVO) session.getAttribute("group");
		attendVO.setG_no(groupVO.getG_no());
		attendVO.setU_id(groupVO.getU_id());
		
		logger.info(Integer.toString(groupVO.getG_no()));
		logger.info(groupVO.getU_id());
		
		//flag 1개씩 바꿔가면서 출석 리스트 뽑아오기

		attendVO.setA_flag(0);
		List<AttendVO> attendFlagZero = attendService.attendListCalendar(attendVO);
		
		
		attendVO.setA_flag(1);
		List<AttendVO> attendFlagOne = attendService.attendListCalendar(attendVO);

		attendVO.setA_flag(2);
		List<AttendVO> attendFlagTwo = attendService.attendListCalendar(attendVO);
		
		attendVO.setA_flag(3);
		List<AttendVO> attendFlagThree = attendService.attendListCalendar(attendVO);
		
		//뽑아온 출석 list를 calendarVO로 치환 해주기
		List<CalendarVO> calendarAttendList = new ArrayList<CalendarVO>();
		
		//뽑아온 출석 list를 하나 하나 Attend용 list 통에다가 다 넣어 주자
		for(int i =0; i < attendFlagZero.size(); i++) {

			CalendarVO calendarAttendVO = new CalendarVO();
			
			calendarAttendVO.setTitle("출석 진행 중");
			calendarAttendVO.setColor("#7460ee");
			
			calendarAttendVO.setStart(attendFlagZero.get(i).getA_date());
			calendarAttendList.add(calendarAttendVO);
		}
		
		for(int i =0; i < attendFlagOne.size(); i++) {

			CalendarVO calendarAttendVO = new CalendarVO();
			
			calendarAttendVO.setTitle("출석 완료");
			calendarAttendVO.setColor("#28b779");
			
			calendarAttendVO.setStart(attendFlagOne.get(i).getA_date());
			calendarAttendList.add(calendarAttendVO);
		}
		
		for(int i =0; i < attendFlagTwo.size(); i++) {

			CalendarVO calendarAttendVO = new CalendarVO();
			
			calendarAttendVO.setTitle("지각");
			calendarAttendVO.setColor("#ffb848");
			
			calendarAttendVO.setStart(attendFlagTwo.get(i).getA_date());
			calendarAttendList.add(calendarAttendVO);
		}
		
		for(int i =0; i < attendFlagThree.size(); i++) {

			CalendarVO calendarAttendVO = new CalendarVO();
			
			calendarAttendVO.setTitle("결석");
			calendarAttendVO.setColor("#da542e");
			
			calendarAttendVO.setStart(attendFlagThree.get(i).getA_date());
			calendarAttendList.add(calendarAttendVO);
		}
		
		JSONArray jsonArray = JSONArray.fromObject(calendarAttendList);

		System.out.println(jsonArray);
		
		return jsonArray;
	}
	
	
	@RequestMapping(value = "/calendarpoint", method = RequestMethod.GET)
	@ResponseBody
	public Object calendarpointget(HttpServletRequest request) throws Exception {
	        
		logger.info("/calendarpoint_get");
		
		HttpSession session = request.getSession();
		
		GroupVO groupVO = (GroupVO) session.getAttribute("group");

		System.out.println("세션 ID : " + groupVO.getU_id() + "세션 그룹 NO : " + groupVO.getG_no());
		
		// 프로그레스바 분모 위해서 내가 로그인한 그룹의 해당 관리자 아이디 찾아와서 그 관리자 ID로 이 그룹에서 몇개의 Attend를 만들었는지 찾기
		GroupVO masterGroup = groupService.findMaster(groupVO);
		
		logger.info("마스터 id : " + masterGroup.getU_id() + "마스터 그룹 NO : " + masterGroup.getG_no());
		
		// 관리자는 그냥 u_id랑 g_no로 attend테이블에 몇개 만들었는지 세준다
		int masterAttendCount = attendService.attendMasterCount(masterGroup);
		
		System.out.println("관리자가 만든 attned 개수 : " + masterAttendCount);
		
		// 사용자는 attend테이블에 출석, 지각의 개수를 세준다.
		AttendVO myAttendVO = new AttendVO();
		
		myAttendVO.setG_no(groupVO.getG_no());
		myAttendVO.setU_id(groupVO.getU_id());
		myAttendVO.setA_flag(1);
		
		int myAttendCountOne = attendService.attendGnoUidCount(myAttendVO);
		
		System.out.println("사용자의 a_flag=1 개수" + myAttendCountOne);
		
		myAttendVO.setA_flag(2);
		int myAttendCountTwo = attendService.attendGnoUidCount(myAttendVO);
		
		System.out.println("사용자의 a_flag=2 개수" + myAttendCountTwo);
		
		myAttendVO.setA_flag(3);
		int myAttendCountThree = attendService.attendGnoUidCount(myAttendVO);
		
		System.out.println("사용자의 a_flag=3 개수" + myAttendCountThree);
		
		//System.out.println("분모는 " + masterAttendCount + "분자는 " + myAttendCount);
		
		int attendPercent = (int)((float)((float)((float)myAttendCountOne + (float)myAttendCountTwo/2) / (float)masterAttendCount)*100);
		
		System.out.println(attendPercent);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("attendOne", myAttendCountOne);
		map.put("attendTwo", myAttendCountTwo);
		map.put("attendThree", myAttendCountThree);
		map.put("attendPercent", attendPercent);
		
		return map;
	}
}
