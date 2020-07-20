package com.checkmate.websocket;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.inject.Inject;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.checkmate.service.GroupService;
import com.checkmate.vo.GroupVO;
 
@RequestMapping("/chat")
public class ChatHandler extends TextWebSocketHandler{	
	
	@Inject
	GroupService groupService;
	
    //세션 리스트
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

    private static Logger logger = LoggerFactory.getLogger(ChatHandler.class);

    //클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessionList.add(session);
        
		//소켓에 접속한 세션의 아이디 받아오기
		Map<String, Object> map;
		map = session.getAttributes();
		GroupVO groupVO = (GroupVO) map.get("group");
		
		groupVO.setG_socket(session.getId());
		
		//접속하면 그룹 테이블에 g_socket에 세션 id값 넣기
		groupService.socketConnection(groupVO);
		
		//내 그룹에 해당하는 현재 g_socket !='0'이어서 세션 id가 존재하는 현재 접속된 세션 애들 목록
	    //현재 내 그룹에 해당하는 세션 접속한 정보 list
	    List<GroupVO> socketConnectionList = groupService.socketConnectionList(groupVO);
		
		// 아래 for문을 통해서 그룹 내의 세션 list의 g_socket 값과 세션의 getId() 값이 같은 세션을 
		// socketGroupingList에 넣어주고 앞으로 이 List를 통해서 메시지를 전송해주어 세션을 그룹별로 특정 지어 준다
	    //현재 내 그룹에 해당하는 세션 정보 list를 가지고 추려낸 session 정보 list
	    List<WebSocketSession> sessionGroupingList = new ArrayList<WebSocketSession>();
		
		for(GroupVO groupSocket : socketConnectionList) {
			for(WebSocketSession findGroupSess : sessionList) {
				if(findGroupSess.getId().equals(groupSocket.getG_socket())) {
					sessionGroupingList.add(findGroupSess);
				}
			}
		}
		
		
        //모든 유저에게 메세지 출력// 내 그룹에 해당하는 session 애들한테만
        for(WebSocketSession sess : sessionGroupingList){
        	
        	// 처음에 0이라는 값을 보내서 뷰에서 채팅 인원 리스트 한번 비우게 하기
        	sess.sendMessage(new TextMessage("0"));
        	
        	for(int i = 0 ; i < socketConnectionList.size(); i++) {
        		sess.sendMessage(new TextMessage(socketConnectionList.get(i).getU_id() + "|" + socketConnectionList.get(i).getG_flag()));
        	}
            
        }
        
        System.out.println(session.getId() + " 연결됨!");
        logger.info("{} 연결됨", session.getId()); 
    }

    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());

		String u_id;
		Map<String, Object> map;
		map = session.getAttributes();

		//소켓에 접속한 세션의 아이디 받아오기
		GroupVO groupVO = (GroupVO) map.get("group");
		
		u_id = groupVO.getU_id();
		
		//관리자인지 보기 위해
		String g_flag = Integer.toString(groupVO.getG_flag());
	    Date now = new Date();
	        
	    // 채팅 시간
	    SimpleDateFormat nowTime = new SimpleDateFormat("hh:mm");
	    String nT = nowTime.format(now);
	    System.out.println("Time: "+ nT);

		
        System.out.println(session.getId() + " 가( "+u_id+") 이고" + message.getPayload() + " 를 보냈음");
        
        //모든 유저에게 메세지 출력
        
		//내 그룹에 해당하는 현재 g_socket !='0'이어서 세션 id가 존재하는 현재 접속된 세션 애들 목록
		List<GroupVO> socketConnectionList = groupService.socketConnectionList(groupVO);
		
		// 아래 for문을 통해서 그룹 내의 세션 list의 g_socket 값과 세션의 getId() 값이 같은 세션을 
		// socketGroupingList에 넣어주고 앞으로 이 List를 통해서 메시지를 전송해주어 세션을 그룹별로 특정 지어 준다
		List<WebSocketSession> sessionGroupingList = new ArrayList<WebSocketSession>();
		
		for(GroupVO groupSocket : socketConnectionList) {
			for(WebSocketSession findGroupSess : sessionList) {
				if(findGroupSess.getId().equals(groupSocket.getG_socket())) {
					sessionGroupingList.add(findGroupSess);
				}
			}
		}
		
        for(WebSocketSession sess : sessionGroupingList){
            sess.sendMessage(new TextMessage(u_id + "|" + message.getPayload() + "|" + nT + "|" + g_flag));
        }
    }

    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

    	sessionList.remove(session);

		Map<String, Object> map;
		map = session.getAttributes();
		GroupVO groupVO = (GroupVO) map.get("group");
        
		groupVO.setG_socket("0");
		
		// 세션 끊어지면 db에 g_socket = 0 으로 바꿔 주기
        groupService.socketConnection(groupVO);

        List<GroupVO> socketConnectionList = groupService.socketConnectionList(groupVO);
		
    	//현재 내 그룹에 해당하는 세션 정보 list를 가지고 추려낸 session 정보 list
        List<WebSocketSession> sessionGroupingList = new ArrayList<WebSocketSession>();
        
		for(GroupVO groupSocket : socketConnectionList) {
			for(WebSocketSession findGroupSess : sessionList) {
				if(findGroupSess.getId().equals(groupSocket.getG_socket())) {
					sessionGroupingList.add(findGroupSess);
				}
			}
		}
		
        //모든 유저에게 메세지 출력 // 그룹핑된 애들한테
        for(WebSocketSession sess : sessionGroupingList){
        	
        	// 처음에 0이라는 값을 보내서 뷰에서 채팅 인원 리스트 한번 비우게 하기
        	sess.sendMessage(new TextMessage("0"));
        	
        	for(int i = 0 ; i < socketConnectionList.size(); i++) {
        		sess.sendMessage(new TextMessage(socketConnectionList.get(i).getU_id() + "|" + socketConnectionList.get(i).getG_flag()));
        	}
            
        }
        
        System.out.println(session.getId() + " 님 연결 끊김"); 
        logger.info("{} 연결 끊김.", session.getId());
    }
}
