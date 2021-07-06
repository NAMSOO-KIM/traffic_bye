package traffic.bye.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.slf4j.Slf4j;
import traffic.bye.vo.UserDetailsVO;

@Service("userLoginAuthenticationProvider")
@Slf4j
public class UserLoginAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	UserDetailsService userDetailsService;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// TODO Auto-generated method stub
		String userId = authentication.getName();
		String userPw = (String) authentication.getCredentials();
		UserDetailsVO userDetails = (UserDetailsVO) userDetailsService.loadUserByUsername(userId);
		log.info("입력받은 비밀번호는 {}", userPw);
		log.info("이거 맞는지 확인 {} ", passwordEncoder.matches(userPw, userDetails.getPassword()));
		if (userDetails == null || !userId.equals(userDetails.getUsername())
				|| !passwordEncoder.matches(userPw, userDetails.getPassword())) {
			log.info("로그인 실패!!!");
			throw new BadCredentialsException("비밀번호 혹은 아이디가 틀렸습니다!");
		}
		userDetails.setPassword(null);
		log.info("id : {}, name : {}, pw : {}", new Object[] {userDetails.getId(), userDetails.getUsername(), userDetails.getPassword()});
		Authentication newAuth = new UsernamePasswordAuthenticationToken(userDetails, null,
				userDetails.getAuthorities());
		return newAuth;

	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
