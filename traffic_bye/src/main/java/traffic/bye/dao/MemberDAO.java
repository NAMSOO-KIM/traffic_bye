package traffic.bye.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import traffic.bye.vo.LoginInfo;
import traffic.bye.vo.MemberVO;
import traffic.bye.vo.UpdateMemberVO;

public interface MemberDAO {
	public int checkPhoneDuplicate(String phone) throws SQLException;
	
	public int checkIdDuplicate(String loginId) throws SQLException;
	
	public int checkKakaoDuplicate(long authId) throws SQLException;
	
	public int memberRegister(MemberVO memberVO) throws SQLException;
	
	public int login(LoginInfo loginInfo) throws SQLException;
	
	public LoginInfo getLoginInfo(String loginId) throws SQLException;
	
	public ArrayList<String> getRoleInfo(String loginId) throws SQLException;
	
	public String findIdByKakaoId(Long kakaoId) throws SQLException;
	
	public String findIdByPhone(String phone) throws SQLException;
	
	public void testUpdate(String pw) throws SQLException;
	
	// 추가 -- 김남수 07.07
	public MemberVO findMember(Long id) throws SQLException;
	
	public void passwordChange(LoginInfo loginInfo) throws SQLException;
	
	public MemberVO getMember(Long id) throws SQLException;
	
	public void updateMember(UpdateMemberVO updateVO) throws SQLException;
	
	public void deleteMember(LoginInfo loginInfo) throws SQLException;
	
	public Long getAuthId(Long id) throws SQLException;
}
