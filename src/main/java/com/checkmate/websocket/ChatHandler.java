package com.checkmate.websocket;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
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

import com.checkmate.vo.GroupVO;
 
@RequestMapping("/chat")
public class ChatHandler extends TextWebSocketHandler{
    //세션 리스트
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

    private static Logger logger = LoggerFactory.getLogger(ChatHandler.class);

    //클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessionList.add(session);
        
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
        for(WebSocketSession sess : sessionList){
            sess.sendMessage(new TextMessage(u_id + "|" + message.getPayload() + "|" + nT + "|" + g_flag));
        }
    }

    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessionList.remove(session);
        
        System.out.println(session.getId() + " 님 연결 끊김"); 
        logger.info("{} 연결 끊김.", session.getId());
    }
}
