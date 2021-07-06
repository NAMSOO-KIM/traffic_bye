package traffic.bye.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import traffic.bye.dao.MemberDAO;
import traffic.bye.exception.IDDuplicateException;
import traffic.bye.exception.KakaoDuplicateException;
import traffic.bye.exception.PhoneDuplicateException;
import traffic.bye.vo.LoginInfo;
import traffic.bye.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberDAO memberDAO;

	@Override
	public int checkPhoneDuplicate(String phone) throws Exception {
		// TODO Auto-generated method stub
		int res = memberDAO.checkPhoneDuplicate(phone);
		if(res == 1) throw new PhoneDuplicateException("이미 가입한 번호입니다");
		return res;
	}

	@Override
	public int checkIdDuplicate(String loginId) throws Exception {
		// TODO Auto-generated method stub
		int res = memberDAO.checkIdDuplicate(loginId);
		if(res == 1) throw new IDDuplicateException("이미 가입한 계정입니다");
		return res;
	}

	@Override
	public int checkKakaoDuplicate(long authId) throws Exception {
		// TODO Auto-generated method stub
		int res = memberDAO.checkKakaoDuplicate(authId); 
		if(res == 1) throw new KakaoDuplicateException();
		return res;
	}

	@Override
	public int memberRegister(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.memberRegister(memberVO);
	}

	@Override
	public LoginInfo login(LoginInfo loginInfo) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.login(loginInfo);
	}
	
	

}
