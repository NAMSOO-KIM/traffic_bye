package traffic.bye.handler;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;


import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SmartOrderHandler extends TextWebSocketHandler {
	
	Set<WebSocketSession> sessions = new HashSet<WebSocketSession>();
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getId() + "연결됨");
		sessions.add(session);
		users.put(session.getId(), session);
		System.out.println(users);
		//id -> 상점으로 바꿔야할듯
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session.getId());
		sessions.remove(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session , TextMessage message) throws Exception{
		String msg = message.getPayload();
		String receiverId = getNickName(msg);
		String content = getMsg(msg);
		WebSocketSession receiver =users.get(receiverId);
		System.out.println(msg);
		System.out.println(receiverId);
		System.out.println(content);
		if(receiver == null) return;
		receiver.sendMessage(new TextMessage(content));
//		
}
		
	@Override
	public void handleTransportError(WebSocketSession session , Throwable exception) throws Exception {
		System.out.println(session.getId()+"익셉션 발생:"+exception.getMessage());
	}
	
//	public String getId(WebSocketSession session) {
//		Map<String, Object> httpSession = session.getAttributes();
//		UserDTO loginUser = (UserDTO)httpSession.get("userInfo");
//		
//		if(loginUser == null) {
//			return session.getId();
//		}else {
//			return loginUser.getUsr_id();
//		}
//	}
	
	
	public String getNickName(String msg) {
		String[] parseData = msg.split(":");
		return parseData[0];
	}
	
	public String getMsg(String msg) {
		String[] parseData = msg.split(":");
		return parseData[1];
	}

}
