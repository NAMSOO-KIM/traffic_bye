package traffic.bye.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.slf4j.Slf4j;
import traffic.bye.dao.MemberDAO;
import traffic.bye.vo.LoginInfo;
import traffic.bye.vo.UserDetailsVO;

@Service("userDetailsServiceCustom")
@Slf4j
public class UserDetailsServiceCustom implements UserDetailsService {

	@Autowired
	MemberDAO memberDAO;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		// 최종적으로 리턴해야할 객체
		UserDetailsVO userDetails = new UserDetailsVO();


		// 사용자 정보 select
		LoginInfo userInfo = null;
		try {
			userInfo = memberDAO.getLoginInfo(username);
			log.info(username);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 사용자 정보 없으면 null 처리
		if (userInfo == null) {
			throw new UsernameNotFoundException("일치하는 회원이 없습니다!");
			// 사용자 정보 있을 경우 로직 전개 (userDetails에 데이터 넣기)
		} else {
			userDetails.setUsername(userInfo.getLoginId());
			userDetails.setPassword(userInfo.getPassword());
			userDetails.setId(userInfo.getId());
			userDetails.setStoreId(userInfo.getStoreId());
			log.info("id {} name {} pw {}", new Object[] {userInfo.getId(), userInfo.getLoginId(), userInfo.getPassword()});
			// 사용자 권한 select해서 받아온 List<String> 객체 주입
			try {
				userDetails.setAuthorities(memberDAO.getRoleInfo(username));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return userDetails;
	}

}
