package traffic.bye.service;

import traffic.bye.vo.LoginInfo;
import traffic.bye.vo.MemberVO;

public interface MemberService {
	public int checkPhoneDuplicate(String phone) throws Exception;
	
	public int checkIdDuplicate(String loginId) throws Exception;
	
	public int checkKakaoDuplicate(long authId) throws Exception;
	
	public int memberRegister(MemberVO memberVO) throws Exception;
	
	public String findIdByKakaoId(Long kakaoId) throws Exception;
	
	public String findIdByPhone(String phone) throws Exception;
	

	// 추가 -- 김남수 07.07
	public MemberVO findMember(Long id) throws Exception;

	public void passwordChange(LoginInfo loginInfo) throws Exception;

}
