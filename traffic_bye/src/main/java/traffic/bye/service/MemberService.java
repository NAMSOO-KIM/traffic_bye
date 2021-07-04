package traffic.bye.service;

import traffic.bye.vo.LoginInfo;
import traffic.bye.vo.MemberVO;

public interface MemberService {
	public int checkPhoneDuplicate(String phone) throws Exception;
	
	public int checkIdDuplicate(String loginId) throws Exception;
	
	public int checkKakaoDuplicate(long authId) throws Exception;
	
	public int memberRegister(MemberVO memberVO) throws Exception;
	
	public int login(LoginInfo loginInfo) throws Exception;
}
