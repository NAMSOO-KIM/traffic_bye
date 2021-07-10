package traffic.bye.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.vo.ItemDetailVO;
import traffic.bye.vo.ItemVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Slf4j
public class ItemDAOTest {
	@Autowired
	ItemDAO itemDAO;
	
	@Test
	public void test() throws Exception {
		log.info(itemDAO.getImage(47L).toString());
		
	}
	
}
