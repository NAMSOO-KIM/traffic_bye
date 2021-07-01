package traffic.bye.dao;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})

public class SampleDAOTest {
	@Autowired
	SampleDAO sampleDAO;
	
	
	@Test
	public void testIt() throws Exception{
		String res = sampleDAO.test();
		assertEquals("실험", res);
	}
}
