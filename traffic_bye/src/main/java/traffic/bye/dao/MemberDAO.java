package traffic.bye.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import traffic.bye.vo.LoginInfo;
import traffic.bye.vo.MemberVO;

public interface MemberDAO {
	public int checkPhoneDuplicate(String phone) throws SQLException;
	
	public int checkIdDuplicate(String loginId) throws SQLException;
	
	public int checkKakaoDuplicate(long authId) throws SQLException;
	
	public int memberRegister(MemberVO memberVO) throws SQLException;
	
	public int login(LoginInfo loginInfo) throws SQLException;
	
	public LoginInfo getLoginInfo(String loginId) throws SQLException;
	
	public ArrayList<String> getRoleInfo(String loginId) throws SQLException;
	
	public String findIdByKakaoId(Long kakaoId) throws SQLException;
}
