package traffic.bye.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;


import traffic.bye.vo.ItemVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})

public class SampleDAOTest2 {
	@Autowired
	ItemDAO itemDAO;
	
	
	@Test
	public void testIt() throws Exception{
		List<ItemVO> list = itemDAO.getItemList();
		System.out.println(list.get(2).getDetail());
		assertEquals("말보로 레드", list.get(2));
	}
}
