package traffic.bye.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import net.nurigo.java_sdk.api.Message;


@Configuration
@PropertySource("classpath:config/authconfig.properties")
public class AuthConfig {
	@Value("${kakao.apikey}")
	public String kakaoKey;
	
	@Value("${coolsms.apikey}")
	public String coolSMSKey;
	
	@Value("${coolsms.secretkey}")
	public String coolSMSSecret;

	@Bean
	public String kakaoAuthInfo() {
		StringBuffer sb = new StringBuffer();
		sb.append("grant_type=authorization_code");
		sb.append("&client_id=");
		sb.append(kakaoKey);
		sb.append("&redirect_uri=http://localhost/app/member/auth/kakao");
		sb.append("&code=");
		return sb.toString();
	}
	
	@Bean
	public String kakaoLoginRedirectURI() {
		StringBuffer sb = new StringBuffer();
		sb.append("https://kauth.kakao.com/oauth/authorize");
		sb.append("?client_id=");
		sb.append(kakaoKey);
		sb.append("&redirect_uri=http://localhost/app/member/auth/kakao");
		sb.append("&response_type=code&prompt=login");
		return sb.toString();
	}
	
	@Bean
	public String kakaoLogoutRedirectURI() {
		StringBuffer sb = new StringBuffer();
		sb.append("https://kauth.kakao.com/oauth/logout");
		sb.append("?client_id=");
		sb.append(kakaoKey);
		sb.append("&logout_redirect_uri=http://localhost/app/member/logout/kakao");
		sb.append("&response_type=code");
		return sb.toString();
	}
	
	@Bean
	public String kakaoAuthFindId() {
		StringBuffer sb = new StringBuffer();
		sb.append("grant_type=authorization_code");
		sb.append("&client_id=");
		sb.append(kakaoKey);
		sb.append("&redirect_uri=http://localhost/app/member/auth/findId/kakao");
		sb.append("&code=");
		return sb.toString();
	}
	
	@Bean
	public String kakaoFindIdRedirectURI() {
		StringBuffer sb = new StringBuffer();
		sb.append("https://kauth.kakao.com/oauth/authorize");
		sb.append("?client_id=");
		sb.append(kakaoKey);
		sb.append("&redirect_uri=http://localhost/app/member/auth/findId/kakao");
		sb.append("&response_type=code&prompt=login");
		return sb.toString();
	}
	
	@Bean
	public String kakaoAuthFindPw() {
		StringBuffer sb = new StringBuffer();
		sb.append("grant_type=authorization_code");
		sb.append("&client_id=");
		sb.append(kakaoKey);
		sb.append("&redirect_uri=http://localhost/app/member/auth/findPw/kakao");
		sb.append("&code=");
		return sb.toString();
	}
	
	@Bean
	public String kakaoFindPwRedirectURI() {
		StringBuffer sb = new StringBuffer();
		sb.append("https://kauth.kakao.com/oauth/authorize");
		sb.append("?client_id=");
		sb.append(kakaoKey);
		sb.append("&redirect_uri=http://localhost/app/member/auth/findPw/kakao");
		sb.append("&response_type=code&prompt=login");
		return sb.toString();
	}
	
	@Bean
	public String kakaoWithdrawalRedirectURI() {
		StringBuffer sb = new StringBuffer();
		sb.append("https://kauth.kakao.com/oauth/authorize");
		sb.append("?client_id=");
		sb.append(kakaoKey);
		sb.append("&redirect_uri=http://localhost/app/member/withdrawal/authKakao");
		sb.append("&response_type=code&prompt=login");
		return sb.toString();
	}
	
	@Bean
	public String kakaoAuthWithdrawal() {
		StringBuffer sb = new StringBuffer();
		sb.append("grant_type=authorization_code");
		sb.append("&client_id=");
		sb.append(kakaoKey);
		sb.append("&redirect_uri=http://localhost/app/member/withdrawal/authKakao");
		sb.append("&code=");
		return sb.toString();
	}
	
	@Bean
	Message coolSMS() {
		return new Message(coolSMSKey, coolSMSSecret);
	}
}
