package com.checkmate.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	@RequestMapping(value = "/homeworklist", method = RequestMethod.POST)
	public String hwlistpost(HttpServletRequest request) throws Exception {
		logger.info("/homework-list_post");
		
		
		return "homeworklist";

	}
	//과제  목록
	@RequestMapping(value = "/homeworkadd", method = RequestMethod.GET)
	@ResponseBody
	public Object hwaddget(HttpServletRequest request, @ModelAttribute HomeworkVO homeworkVO) throws Exception {
		logger.info("/homeworkadd_get");
			
		int h_no = homeworkVO.getH_no();
		logger.info(""+h_no);
			
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
		homeworkVO.setH_deadline(homework[1]);
		homeworkVO.setH_score(Integer.parseInt(homework[2]));
		homeworkVO.setH_content(homework[3]);
		homeworkVO.setH_file(homework[4]);

		logger.info("제목 : " + homework[0] + ", 내용 : " + homework[3]);
		
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
	
	//과제 삭제(그룹장)
	@RequestMapping(value = "/homeworkadd", method = RequestMethod.DELETE, produces = "application/text; charset=utf8")
	@ResponseBody
	public Object hwadddelete(HttpServletRequest request, @ModelAttribute HomeworkVO homeworkVO) throws Exception {
		logger.info("/homeworkadd_delete");
		
		service.delete(homeworkVO);
		
		//관리자가 숙제를 삭제했을경우 그 숙제를 제출한 사용자 자료를 일괄 삭제한다(myPage연동이랑 가비지값 처리 위해)
		if(homeworkVO.getH_flag()==0) {
			homeworkVO.setH_flag(1);
			service.delete(homeworkVO);
		}
		
		String msg = "삭제 되었습니다.";
		return msg;
	}
	

	   //파일 업로드(그룹장)
	   @RequestMapping(value = "/fileadd", method = RequestMethod.POST, produces = "application/text; charset=utf8", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	   @ResponseBody
	   public Object fileaddpost(MultipartHttpServletRequest request) throws Exception {
	           
	      logger.info("/fileadd_post");
	      
	        //file upload
	       
	        MultipartFile file = request.getFile("h_file");
	       
	        String path = "C:\\Users\\USER\\Desktop\\upload\\"; 
	        String safeFile ="";
	        String originFileName = file.getOriginalFilename();

	      if(file!=null) {
	         logger.info("파라미터명 "+file.getName());
	         logger.info("파일크기 "+file.getSize());
	         logger.info("파일 존재유무 "+file.isEmpty());
	         logger.info("파일 이름 "+originFileName);
	         
	         
	         /* safeFile = path + System.currentTimeMillis()+originFileName; */
	         /*
	          * safeFile = UUID.randomUUID().toString().replaceAll("-", "")+originFileName;
	          */
	         
	         safeFile =originFileName;
	         
	         try {
	            file.transferTo(new File(path+safeFile));
	            logger.info("여길봐!! : "+(path+safeFile));
	         }catch(Exception e) {
	            e.printStackTrace();
	         }
	      }
	   
	      
	      return (path+safeFile);
	   }

	
	   @RequestMapping(value = "/subfileadd", method = RequestMethod.POST, produces = "application/text; charset=utf8", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	   @ResponseBody
	   public Object subfileaddpost(MultipartHttpServletRequest request) throws Exception {
	           
	      logger.info("/subfileadd_post");
	      
	        //file upload
	       
	        MultipartFile file = request.getFile("sub_file");
	       
	        String path = "C:\\Users\\USER\\Desktop\\upload\\"; 
	        String safeFile ="";
	        String originFileName = file.getOriginalFilename();

	      if(file!=null) {
	         logger.info("파라미터명 "+file.getName());
	         logger.info("파일크기 "+file.getSize());
	         logger.info("파일 존재유무 "+file.isEmpty());
	         logger.info("파일 이름 "+originFileName);
	         
	         
	         /* safeFile = path + System.currentTimeMillis()+originFileName; */
	         safeFile =originFileName;
	         
	         try {
	            file.transferTo(new File(path+safeFile));
	            logger.info("여길봐!! : "+(path+safeFile));
	         }catch(Exception e) {
	            e.printStackTrace();
	         }
	      }
	   
	      
	      return (path+safeFile);
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
		//파일이름 가져오기
		HomeworkVO hwFileVO = new HomeworkVO();
		hwFileVO.setH_no(h_no);
		hwFileVO.setG_no(groupVO.getG_no());
		
		String h_file = service.fileChoice(hwFileVO);
		 
		logger.info(""+h_file);
		
		String originalFilename = h_file.substring(h_file.lastIndexOf("\\")+1);
		 
		model.addAttribute("fileName", originalFilename);
		//과제 제출폼 관련 코드들은 여기부터
		
		String myId = groupVO.getU_id(); //로그인한 유저 아이디값
										//그래야 밑에 숙제 제출가능
										//위에 user(관리자가 올린 과제)랑 다름
		
		logger.info(myId);

		HomeworkVO myhwVO = new HomeworkVO();
		
		myhwVO.setG_no(groupVO.getG_no());
		myhwVO.setH_no(h_no);
		myhwVO.setU_id(myId);
		
		int myhwCount = service.hwCount(myhwVO);
		
		if (myhwCount == 0 ) {
			
			model.addAttribute("myHwCount", 0);
			
		} else {

			HomeworkVO readVO = service.read(myhwVO);
			readVO.setH_file(readVO.getH_file().substring(readVO.getH_file().lastIndexOf("\\")+1));
			
			model.addAttribute("myHwCount", 1);
			model.addAttribute("complete", readVO);
		}
		
		
		
		return "homeworkshow";
		
	}
	
	// 과제 작성(학생들)
	@RequestMapping(value = "/homeworkshow", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public Object homeworkpost(HttpServletRequest request) throws Exception{
		logger.info("/homeworkwrite_post");

		
		String[] homework = request.getParameterValues("homework");
		
		HomeworkVO homeworkVO = new HomeworkVO();
		
		homeworkVO.setH_title(homework[0]);
		homeworkVO.setH_content(homework[1]);
		homeworkVO.setH_file(homework[2]);
		homeworkVO.setH_no(Integer.parseInt(homework[3]));
		homeworkVO.setH_score(Integer.parseInt(homework[4]));
		
		HttpSession session = request.getSession();
		
		GroupVO groupVO = (GroupVO) session.getAttribute("group");
		homeworkVO.setU_id(groupVO.getU_id());
		homeworkVO.setG_no(groupVO.getG_no());
		
		service.homeworkwrite(homeworkVO);
		String msg = "";
		msg = "과제제출이 완료되었습니다.";
		return msg;
	}
	
	   //file down 
	   @RequestMapping(value = "/fileDown", method = RequestMethod.POST)
	   public String fileDown(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception {
	      String realPath = "C:\\Users\\USER\\Desktop\\upload\\";
	      //파일 이름이 넘어오지 않으면 돌려보내기
	      if(request.getParameter("fileName")==null || "".equals(request.getParameter("fileName"))) {
	         response.sendRedirect("homeworkshow");
	         
	      }else {
	         //파라미터로 받아온 파일 이름
	         String requestFileNameAndPath = request.getParameter("fileName");
	         //한글이름도 찾을 수 있게
	         String UTF8FileNameAndPath = new String(requestFileNameAndPath.getBytes("8859_1"), "UTF-8");
	         //파일 다운로드시 받을 때 저장될 파일명
	         String fileNameToSave = requestFileNameAndPath;
	         
	         //파일이 바로 실행되지 않고 다운로드가 되게 하기 위해서 컨텐트 타입을 8비트 바이너리로 설정
	         response.setContentType("application/octet-stream");
	         //저장될 파일명 지정
	         response.setHeader("Content-Disposition", "attachment; filename=\"" + fileNameToSave+"\";");
	         
	         
	         //파일 패스 및 파일명 지정
	           String filePathAndName = realPath + UTF8FileNameAndPath;
	           logger.info("여기확인"+filePathAndName);
	              File file = new File(filePathAndName);
	               
	              byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(file);
	              response.setContentLength(fileByte.length);
	              response.getOutputStream().write(fileByte);
	              response.getOutputStream().flush();
	              response.getOutputStream().close();
	             
	           
	              
	              
	              
	              // 버퍼 크기 설정
	            /* byte bytestream[] = new byte[2048000]; */
	              // response out에 파일 내용을 출력한다.
	            /*
	             * if (file.isFile() && file.length() > 0){
	             * 
	             * try { OutputStream bos = response.getOutputStream(); FileInputStream fis =
	             * new FileInputStream(filePathAndName);
	             * 
	             * int read = 0; response.setContentLength(fis.read(bytestream)); while ((read =
	             * fis.read(bytestream)) != -1){ bos.write(bytestream , 0, read); } fis.close();
	             * bos.close(); }catch(FileNotFoundException ex) {
	             * System.out.println("FileNotFoundException"); } }
	             */
	      }
	      return null;
	   }

	
	@RequestMapping(value = "/homeworkview", method = RequestMethod.GET)
	public String homeworkviewget(HttpServletRequest request, Model model, HomeworkVO homeworkVO) throws Exception {
		logger.info("homeworkview_get");
		
		List<HomeworkVO> hwCompleteList = service.hwCompleteList(homeworkVO);
		
		model.addAttribute("hwCompleteList", hwCompleteList);
		
		System.out.println(homeworkVO.getH_no());
		
		return "homeworkview";
	}
	
	// 과제 세부 항목 보기(학생들)
	@RequestMapping(value = "/homework", method = RequestMethod.GET)
	@ResponseBody
	public Object homeworkget(HttpServletRequest request, @ModelAttribute HomeworkVO homeworkVO) throws Exception{
		logger.info("/homework_get-ajax");

		HomeworkVO hwView = service.hwView(homeworkVO);
		
		hwView.setH_file(hwView.getH_file().substring(hwView.getH_file().lastIndexOf("\\")+1));
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("hwView", hwView);
		
		return map;
	}
}