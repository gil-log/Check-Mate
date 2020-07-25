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
import com.checkmate.vo.GroupPointVO;
import com.checkmate.vo.GroupVO;
import com.checkmate.vo.HomeworkVO;
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
		List<CalendarVO> calendarList = new ArrayList<CalendarVO>();
		
		//뽑아온 출석 list를 하나 하나 Attend용 list 통에다가 다 넣어 주자
		for(int i =0; i < attendFlagZero.size(); i++) {

			CalendarVO calendarAttendVO = new CalendarVO();
			
			calendarAttendVO.setTitle("출석 진행 중");
			calendarAttendVO.setColor("#7460ee");
			calendarAttendVO.setUrl("attend");
			
			calendarAttendVO.setStart(attendFlagZero.get(i).getA_date());
			calendarList.add(calendarAttendVO);
		}
		
		for(int i =0; i < attendFlagOne.size(); i++) {

			CalendarVO calendarAttendVO = new CalendarVO();
			
			calendarAttendVO.setTitle("출석 완료");
			calendarAttendVO.setColor("#28b779");
			calendarAttendVO.setUrl("attend");
			
			calendarAttendVO.setStart(attendFlagOne.get(i).getA_date());
			calendarList.add(calendarAttendVO);
		}
		
		for(int i =0; i < attendFlagTwo.size(); i++) {

			CalendarVO calendarAttendVO = new CalendarVO();
			
			calendarAttendVO.setTitle("지각");
			calendarAttendVO.setColor("#ffb848");
			calendarAttendVO.setUrl("attend");
			
			calendarAttendVO.setStart(attendFlagTwo.get(i).getA_date());
			calendarList.add(calendarAttendVO);
		}
		
		for(int i =0; i < attendFlagThree.size(); i++) {

			CalendarVO calendarAttendVO = new CalendarVO();
			
			calendarAttendVO.setTitle("결석");
			calendarAttendVO.setColor("#da542e");
			calendarAttendVO.setUrl("attend");
			
			calendarAttendVO.setStart(attendFlagThree.get(i).getA_date());
			calendarList.add(calendarAttendVO);
		}
		
		// 진행 가능한 과제 리스트 뽑아오기
		List<HomeworkVO> homeworkPossibleIdList = homeworkService.homeworkPossibleIdList(groupVO);
		
		//h_no 뽑아온 애들의 정보를 가져오자
		
		List<HomeworkVO> homeworkPossibleList = new ArrayList<HomeworkVO>();

		for(int i=0; i<homeworkPossibleIdList.size(); i++) {
			homeworkPossibleList.add(homeworkService.hwFindVo(homeworkPossibleIdList.get(i)));
		}
		
		for(int i=0; i<homeworkPossibleList.size(); i++) {
			CalendarVO calendarHwVO = new CalendarVO();
			
			calendarHwVO.setTitle(homeworkPossibleList.get(i).getH_title());
			calendarHwVO.setColor("#6c757d");
			calendarHwVO.setUrl("homeworkshow?h_no="+homeworkPossibleList.get(i).getH_no());
			
			calendarHwVO.setStart(homeworkPossibleList.get(i).getH_date());
			calendarHwVO.setEnd(homeworkPossibleList.get(i).getH_deadline());
			
			calendarList.add(calendarHwVO);
		}

		//세션 g_no, id 가져오고 찾고 싶은 flag값으로 설정 해줌
		HomeworkVO homeworkVO = new HomeworkVO();
		homeworkVO.setG_no(groupVO.getG_no());
		homeworkVO.setU_id(groupVO.getU_id());
		homeworkVO.setH_flag(1);

		// 로그인한 사용자가 제출한 과제 리스트 뽑아오기
		List<HomeworkVO> hwFinishedList = homeworkService.hwFindList(homeworkVO);
		
		for(int i=0; i<hwFinishedList.size(); i++) {
			CalendarVO calendarHwVO = new CalendarVO();
			
			calendarHwVO.setTitle(hwFinishedList.get(i).getH_title() + " 제출완료!");
			calendarHwVO.setColor("#2255a4");
			calendarHwVO.setUrl("homeworkshow?h_no="+hwFinishedList.get(i).getH_no());
			
			calendarHwVO.setStart(hwFinishedList.get(i).getH_date());
			
			calendarList.add(calendarHwVO);
		}
		
		// 로그인한 사용자가 제출기간을 놓치고 미제출한 과제 리스트 뽑아오기
		List<HomeworkVO> hwImpossibleIdList = homeworkService.hwImpossibleIdList(groupVO);
		
		List<HomeworkVO> hwImpossibleList = new ArrayList<HomeworkVO>();
		
		for(int i=0; i<hwImpossibleIdList.size(); i++) {
			hwImpossibleList.add(homeworkService.hwFindVo(hwImpossibleIdList.get(i)));
		}
		
		for(int i=0; i<hwImpossibleList.size(); i++) {
			CalendarVO calendarHwVO = new CalendarVO();
			
			calendarHwVO.setTitle(hwImpossibleList.get(i).getH_title() + " 미제출...");
			calendarHwVO.setColor("#343a40");
			calendarHwVO.setUrl("homeworkshow?h_no="+hwImpossibleList.get(i).getH_no());
			
			//깔끔하게 보이기 위해서 그 제출 과제의 종료일에만 미제출로 표시되게 함
			calendarHwVO.setStart(hwImpossibleList.get(i).getH_deadline());
			
			calendarList.add(calendarHwVO);
		}
		
		JSONArray jsonArray = JSONArray.fromObject(calendarList);

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
		
		//Group 테이블에 유저 point 넣기
		
		// 출석 관련 점수 총합
		int userAttendPoint = (myAttendCountOne * 5) - (myAttendCountTwo * 3) - (myAttendCountThree * 5);
		
		// 숙제 관련 점수 부분
		
		// 내 그룹 관리자의 g_no u_id 받아오고 h_flag 0으로 해서 hwFindList를 통해서 관리자가 생성한 홈워크 찾기
		HomeworkVO masterHwVO = new HomeworkVO();
		masterHwVO.setG_no(masterGroup.getG_no());
		masterHwVO.setU_id(masterGroup.getU_id());
		masterHwVO.setH_flag(0);
		
		List<HomeworkVO> masterHwList = homeworkService.hwFindList(masterHwVO);
		
		int masterHwCount = masterHwList.size();
		
		System.out.println("관리자가 만든 숙제 수 : " + masterHwCount);
		
		// 로그인 세션의 g_no u_id 받아오고 h_flag 1로해서 hwFindList를 통해서 내가 제출한 홈워크 찾기
		HomeworkVO myHwVO = new HomeworkVO();
		myHwVO.setG_no(groupVO.getG_no());
		myHwVO.setU_id(groupVO.getU_id());
		myHwVO.setH_flag(1);
		
		List<HomeworkVO> myHwList = homeworkService.hwFindList(myHwVO);
		
		int myFinishedHwCount = myHwList.size();
		
		// 제출한 과제 점수 얻기
		int myFinishedHwPoint = 0;
		
		for(int i = 0; i<myFinishedHwCount; i++) {
			myFinishedHwPoint += myHwList.get(i).getH_score();
		}
		
		System.out.println("제출 과제로 얻은 점수 : " + myFinishedHwPoint);
		
		System.out.println("내가 제출한 과제 수 : " + myFinishedHwCount);
		
		int hwPercent = (int)(((float)myFinishedHwCount / (float)masterHwCount) * 100);
		
		System.out.println("홈워크 퍼센트 : " + hwPercent);
		
		
		// 내가 제출기한 놓쳐서 미제출한 과제들 개수 세주고 그거 만큼 점수에서 차감
		List<HomeworkVO> myHwImpossibleIdList = homeworkService.hwImpossibleIdList(groupVO);
		
		List<HomeworkVO> myHwImpossibleList = new ArrayList<HomeworkVO>();
		
		for(int i = 0; i < myHwImpossibleIdList.size(); i++) {
			HomeworkVO hwVO = homeworkService.hwFindVo(myHwImpossibleIdList.get(i));
			myHwImpossibleList.add(hwVO);	
		}
		
		int myHwImpossibleCount = myHwImpossibleList.size();
		
		// 미제출한 과제 점수 차감 하기
		int myUnFinishedHwPoint = 0;
		
		for(int i = 0; i<myHwImpossibleCount; i++) {
			myUnFinishedHwPoint -= myHwImpossibleList.get(i).getH_score();
		}
		
		System.out.println("미제출 과제로 잃은 점수 : " + myUnFinishedHwPoint);
		
		System.out.println("내가 미제출한 숙제 개수 :" + myHwImpossibleCount);
		
		
		
		// 숙제 관련 점수 총합
		int userHwPoint = myFinishedHwPoint + myUnFinishedHwPoint;
		
		int userTotalPoint = userAttendPoint + userHwPoint;
		
		GroupPointVO groupPointVO = new GroupPointVO();
		
		groupPointVO.setG_no(groupVO.getG_no());
		groupPointVO.setU_id(groupVO.getU_id());
		groupPointVO.setG_flag(groupVO.getG_flag());
		groupPointVO.setU_point(userTotalPoint);
		
		System.out.println("유저 포인트 총합 : " + userTotalPoint);
		groupService.userPoint(groupPointVO);
		
		
		// 수료를 위한 퍼센트는 분모에 출석, 홈워크 분모 항들이 더해지고 분자에 출석, 홈워크 분자 항들 계산 공식 그대로 사용
		// 출석에 대한 비중이 높아질 예정
		
		int totalPercent = (int)(
				(
						(float)(myFinishedHwCount + myAttendCountOne) + ((float)myAttendCountTwo/2) 
				)
				/ (float)(masterAttendCount+masterHwCount)*100) ;
				
		System.out.println("수료 퍼센트 : " + totalPercent);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 랭크 부분
		
		List<GroupPointVO> topRankList = groupService.findTopRankList(groupVO);
		
		int rankerCount = topRankList.size();
		
		GroupPointVO myRank = groupService.findMyRank(groupVO);
		
		int myRanking = myRank.getRank();
		System.out.println("내 아이디 : " + myRank.getU_id() + " 내 순위 : " + myRank.getRank() + " 내 점수 : " + myRank.getU_point());
		
		if (rankerCount == 1) {
			
			map.put("rankCount", 1);
			
			map.put("rankOne", myRank);
			map.put("myRank", myRank);

		} else if (rankerCount == 2) {

			map.put("rankCount", 2);

			if (myRanking == 1) {

				map.put("rankOne", myRank);
				topRankList.get(1).setRank(2);
				map.put("rankTwo", topRankList.get(1));
				map.put("myRank", myRank);
				
			} else{
				
				topRankList.get(0).setRank(1);
				map.put("rankOne", topRankList.get(0));
				topRankList.get(1).setRank(2);
				map.put("rankTwo", topRankList.get(1));
				map.put("myRank", myRank);
				
			}
		} else if (rankerCount == 3) {

			if (myRanking == 1) {

				map.put("rankCount", 3);
				
				map.put("rankOne", myRank);
				topRankList.get(1).setRank(2);
				map.put("rankTwo", topRankList.get(1));
				topRankList.get(2).setRank(3);
				map.put("rankThree", topRankList.get(2));
				map.put("myRank", myRank);
				
			} else if (myRanking == 2) {

				map.put("rankCount", 3);
				
				topRankList.get(0).setRank(1);
				map.put("rankOne", topRankList.get(0));
				map.put("rankTwo", myRank);
				topRankList.get(2).setRank(3);
				map.put("rankThree", topRankList.get(2));
				map.put("myRank", myRank);
				
			} else if (myRanking == 3){

				map.put("rankCount", 3);
				
				topRankList.get(0).setRank(1);
				map.put("rankOne", topRankList.get(0));
				topRankList.get(1).setRank(2);
				map.put("rankTwo", topRankList.get(1));
				topRankList.get(2).setRank(3);
				map.put("rankThree", topRankList.get(2));
				map.put("myRank", myRank);
				
			} else{

				map.put("rankCount", 4);
				
				topRankList.get(0).setRank(1);
				map.put("rankOne", topRankList.get(0));
				topRankList.get(1).setRank(2);
				map.put("rankTwo", topRankList.get(1));
				topRankList.get(2).setRank(3);
				map.put("rankThree", topRankList.get(2));
				map.put("myRank", myRank);
			}
		}
		
		// 출석 관련
		map.put("attendOne", myAttendCountOne);
		map.put("attendTwo", myAttendCountTwo);
		map.put("attendThree", myAttendCountThree);
		map.put("attendPercent", attendPercent);
		
		// 숙제 관련
		map.put("hwFinished", myFinishedHwPoint);
		map.put("hwUnFinished", myUnFinishedHwPoint);
		map.put("hwPercent", hwPercent);
		
		// 총합 점수
		map.put("myPoint", userTotalPoint);
		map.put("totalPercent", totalPercent);
		
		// 랭크 관련
		
		return map;
	}
}
