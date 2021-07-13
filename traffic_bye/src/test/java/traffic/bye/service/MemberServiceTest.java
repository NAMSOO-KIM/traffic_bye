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
	}
}
