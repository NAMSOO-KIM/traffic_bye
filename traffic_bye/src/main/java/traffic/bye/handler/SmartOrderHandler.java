package traffic.bye.handler;

import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
		String type = (String)myJson.get("type");
		System.out.println("type: "+type);
		if(auth != "" &&  type.equals("accept")) {
			WebSocketSession receiver = users.get(customer);
			System.out.println("소비자 : "+receiver);
			if(receiver == null) return;
			receiver.sendMessage(new TextMessage("주문이 수락되었습니다."));
		}else if(auth !="" && type.equals("ready")) {
			WebSocketSession receiver = users.get(customer);
			System.out.println("소비자 : "+receiver);
			if(receiver == null) return;
			receiver.sendMessage(new TextMessage("상품이 준비되었습니다."));
		}else if(auth !="" && type.equals("receipt")) {
			WebSocketSession receiver = users.get(customer);
			System.out.println("소비자 : "+receiver);
			if(receiver == null) return;
			receiver.sendMessage(new TextMessage("이용해주셔서 감사합니다! 즐거운 시간 되셨나요?"));
		}else {
			JSONObject json = getJsonDataFormMsg(msg);
			ArrayList<String> stores = (ArrayList<String>)json.get("storeList");
			//상점 목록 받기
			for(String storeId : stores) {
				WebSocketSession receiver = managers.get(Long.parseLong(storeId));
				//JSONObject sendData = new JSONObject();
//				sendData.put("customer", customer);
//				sendData.put("auth", auth);
//				sendData.put("type", type);
				receiver.sendMessage(new TextMessage(storeId));
			}
		}
		
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId() + "익셉션 발생:" + exception.getMessage());
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