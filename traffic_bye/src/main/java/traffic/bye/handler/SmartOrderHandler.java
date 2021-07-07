package traffic.bye.handler;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

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
public class SmartOrderHandler extends TextWebSocketHandler {

	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	

	private Map<Long, WebSocketSession> managers = new ConcurrentHashMap<Long, WebSocketSession>();
	//키 값이 스토어아디이면 

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		LoginInfo loginInfo = getLoginInfo(session);
		Long storeId = loginInfo.getStoreId();
		if(storeId == null) {
			users.put(loginInfo.getLoginId(), session);
			System.out.println(users.toString());
			System.out.println(managers.toString());
			
			return;
		}
		managers.put(storeId, session);
		System.out.println(users.toString());
		System.out.println(managers.toString());
		// id -> 상점으로 바꿔야할듯
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		LoginInfo loginInfo = getLoginInfo(session);
		if(loginInfo.getStoreId() == null) {
			users.remove(loginInfo.getLoginId());
			return;
		}
		managers.remove(loginInfo.getStoreId());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		JSONObject myJson = getJsonDataFormMsg(msg);
		String customer = (String)myJson.get("customer");
		String auth = (String)myJson.get("auth");
		if(auth != "") {
			WebSocketSession receiver = users.get(customer);
			System.out.println("소비자 : "+receiver);
			if(receiver == null) return;
			receiver.sendMessage(new TextMessage("수락되었습니다."));
		}else {
			JSONObject json = getJsonDataFormMsg(msg);
			ArrayList<String> stores = (ArrayList<String>)json.get("storeList");
			//상점 목록 받기
			System.out.println("storeId LWist"+stores.toString());
			for(String storeId : stores) {
				WebSocketSession receiver = managers.get(Long.parseLong(storeId));
				JSONObject sendData = new JSONObject();
				sendData.put("customer", customer);
				sendData.put("type", "order");
				sendData.put("auth", auth);
				receiver.sendMessage(new TextMessage(sendData.toJSONString()));
				System.out.println(storeId+ "님 주문이 들어왔습니다.");
			}
		}
		
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId() + "익셉션 발생:" + exception.getMessage());
	}

	public String getUser(String msg) {
		String[] parseData = msg.split(":");
		return parseData[1];
	}
	public String accept(String msg) {
		String[] parseData = msg.split(":");
		return parseData[0];
	}
	
	private JSONObject getJsonDataFormMsg(String msg) throws Exception{
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(msg);
		return (JSONObject)obj;
	}
	
	private LoginInfo getLoginInfo(WebSocketSession session) {
		Map<String, Object> sessionVal = session.getAttributes();
		LoginInfo loginInfo = (LoginInfo) sessionVal.get("loginInfo");
		return loginInfo;
	}

}