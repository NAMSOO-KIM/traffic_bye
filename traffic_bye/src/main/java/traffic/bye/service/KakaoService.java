package traffic.bye.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class KakaoService {

	@Autowired
	String kakaoAuthInfo;
	
	@Autowired
	String kakaoLogoutRedirectURI;

	public String getAccessToken(String authorizeCode) throws Exception {
		String access_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		URL url = new URL(reqURL);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
		conn.setRequestMethod("POST");
		conn.setDoOutput(true);

		// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		StringBuilder sb = new StringBuilder();
		System.out.println(kakaoAuthInfo);
		sb.append(kakaoAuthInfo);
		sb.append(authorizeCode);
		bw.write(sb.toString());
		bw.flush();
		bw.close();

		System.out.println(conn.getResponseMessage());
		// 결과 코드가 200이라면 성공
		int responseCode = conn.getResponseCode();
		System.out.println("responseCode : " + responseCode);

		// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String line = "";
		String result = "";

		while ((line = br.readLine()) != null) {
			result += line;
		}
		br.close();

		// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(result);

		access_Token = element.getAsJsonObject().get("access_token").getAsString();

		return access_Token;
	}

	public long getUserInfo(String accessToken) throws Exception {
		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		URL url = new URL(reqURL);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("POST");

		// 요청에 필요한 Header에 포함될 내용
		conn.setRequestProperty("Authorization", "Bearer " + accessToken);
		int responseCode = conn.getResponseCode();
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

		String line = "";
		String result = "";

		while ((line = br.readLine()) != null) {
			result += line;
		}
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(result);
		System.out.println(element.toString());
		long id = element.getAsJsonObject().get("id").getAsLong();
		return id;
	}

	public void kakaoLogout(String accessToken) throws Exception {
		URL url = new URL(kakaoLogoutRedirectURI);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		int responseCode = conn.getResponseCode();
		log.info("responseCode : {}", responseCode);
	}

}