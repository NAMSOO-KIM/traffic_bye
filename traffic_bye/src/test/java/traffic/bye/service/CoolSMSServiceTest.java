package traffic.bye.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;
import traffic.bye.config.RedisConfig;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = RedisConfig.class)
@Slf4j
public class CoolSMSServiceTest {
	
	@Autowired
	CoolSMSService coolSMSService;
	
	@Test
	public void hi() {
		log.info("zz");
	}
}
