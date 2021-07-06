package traffic.bye.handler;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.vo.LoginInfo;

@Slf4j
@Controller
public class SmartOrderHandler extends TextWebSocketHandler {

	Set<Long> sessions = new HashSet<Long>();
	HttpSession httpSession;

	private Map<Long, WebSocketSession> users = new ConcurrentHashMap<Long, WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> sessionVal = session.getAttributes();
		LoginInfo loginInfo = (LoginInfo) sessionVal.get("loginInfo");
		Long storeId = loginInfo.getStoreId();
		System.out.println(storeId);
		sessions.add(storeId);
		if (users.get(storeId) != null) {
			users.replace(storeId, session);
		} else {
			users.put(storeId, session);
		}

		System.out.println(users.toString());
		// id -> 상점으로 바꿔야할듯
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	
		
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		List<String> storeList = getStoreId(msg);
		//상점 목록 받기
		System.out.println("storeId List"+ storeList);
		
		for(int i=0;i<storeList.size();i++) {
			WebSocketSession receiver = users.get(Long.parseLong(storeList.get(i)));
			if(receiver !=null) {
				receiver.sendMessage(new TextMessage(storeList.get(i)+"님 주문이 들어왔습니다."));
			}else {
				continue;
			}
		}
		
		
		//		String receiverId = getUserId(msg);
//		String content = getMsg(msg);
//		WebSocketSession receiver = users.get(receiverId);
//		System.out.println(msg);
//		System.out.println(receiverId);
//		System.out.println(content);
//		if (receiver == null)
//			return;
//		receiver.sendMessage(new TextMessage(content));

	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId() + "익셉션 발생:" + exception.getMessage());
	}

	public List<String> getStoreId(String msg) {
		List<String> arr = new ArrayList<>();
		String[] parseData = msg.split(",");
		for(int i=0;i<parseData.length;i++) {
			arr.add(parseData[i]);
		}
		return arr;
	}

	public String getMsg(String msg) {
		String[] parseData = msg.split(":");
		return parseData[1];
	}
	
	private JSONObject getJsonDataFormMsg(String msg) throws Exception{
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(msg);
		return (JSONObject)obj;
	}
	

}