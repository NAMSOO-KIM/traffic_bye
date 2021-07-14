package traffic.bye.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import traffic.bye.vo.AuthType;
import traffic.bye.vo.MemberVO;
import traffic.bye.vo.ROLE;


@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class MemberServiceTest {
	@Autowired
	MemberService memberService;
	
	@Test
	public void test() throws Exception{
	//	MemberVO memberVO = new MemberVO(null, null, "test3", "1", "1234567", "1234", "남수3", "1234", ROLE.ADMIN, AuthType.PHONE);
		//memberService.memberRegister(memberVO);
		//MemberVO memberVO  = new MemberVO(null, null , "admin1", "1", "1234", "1234", "삼성전자", "2016-09-26", ROLE.ADMIN, AuthType.PHONE, "1234");
		MemberVO memberVO1  = new MemberVO(null, null , "admin1", "1", "1234", "1234", "삼성전자", "2016-09-26", ROLE.ADMIN, AuthType.PHONE, "1235");
		MemberVO memberVO2  = new MemberVO(null, null , "admin2", "2", "1234", "1234", "캐논", "2016-09-26", ROLE.ADMIN, AuthType.PHONE, "1236");
		MemberVO memberVO3  = new MemberVO(null, null , "admin3", "3", "1234", "1234", "소니", "2016-09-26", ROLE.ADMIN, AuthType.PHONE, "1237");
		MemberVO memberVO4  = new MemberVO(null, null , "admin4", "4", "1234", "1234", "담배매장", "2016-09-26", ROLE.ADMIN, AuthType.PHONE, "1238");
		MemberVO memberVO5  = new MemberVO(null, null , "admin5", "5", "1234", "1234", "주류매장", "2016-09-26", ROLE.ADMIN, AuthType.PHONE, "1239");
		MemberVO memberVO6  = new MemberVO(null, null , "admin6", "6", "1234", "1234", "정관장", "2016-09-26", ROLE.ADMIN, AuthType.PHONE, "1240");
		MemberVO memberVO7  = new MemberVO(null, null , "admin7", "7", "1234", "1234", "뱅앤올룹슨", "2016-09-26", ROLE.ADMIN, AuthType.PHONE, "1241");
		memberService.memberRegister(memberVO1);
		memberService.memberRegister(memberVO2);
		memberService.memberRegister(memberVO3);
		memberService.memberRegister(memberVO4);
		memberService.memberRegister(memberVO5);
		memberService.memberRegister(memberVO6);
		memberService.memberRegister(memberVO7);
	}
}
