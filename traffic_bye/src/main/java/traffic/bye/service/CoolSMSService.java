package traffic.bye.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import traffic.bye.dao.RedisDAO;
import traffic.bye.exception.SMSMissMatchException;
import traffic.bye.vo.SMSVO;

@Service
@Slf4j
public class CoolSMSService {
	@Autowired
	Message coolSMS;

	@Autowired
	RedisDAO redisDAO;

	public String send(String phoneNumber) {
		String randomNumber = makeNumber();
		HashMap<String, String> params = makeParams(phoneNumber, randomNumber);
		try {
			JSONObject obj = (JSONObject) coolSMS.send(params);
			redisDAO.createSmsCertification(phoneNumber, randomNumber);
			log.info("저장됐나 확인 {}", redisDAO.getSmsCertification(phoneNumber));
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		return randomNumber;
	}

	public void checkSMS(SMSVO smsVO) {
		try {
			if (!checkIt(smsVO)) {
				throw new SMSMissMatchException("인증번호가 일치하지 않습니다.");
			}
		} catch (SMSMissMatchException smse) {
			throw smse;
		} finally {
			redisDAO.removeSmsCertification(smsVO.getPhone());
		}
	}

	private boolean checkIt(SMSVO smsVO) {
		log.info("입력받은 번호는 {}, 진짜 번호는 {}", smsVO.getRandomNumber(), redisDAO.getSmsCertification(smsVO.getPhone()));
		return (redisDAO.hasKey(smsVO.getPhone())
				&& redisDAO.getSmsCertification(smsVO.getPhone()).equals(smsVO.getRandomNumber()));
	}

	private String makeNumber() {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 4; i++)
			sb.append((int) (Math.random() * 10));
		return sb.toString();
	}

	private HashMap<String, String> makeParams(String phoneNumber, String randomNumber) {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNumber); // 수신전화번호
		params.put("from", "01055070371"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", randomNumber);
		params.put("app_version", "test app 1.2"); // application name and version
		return params;
	}
}
