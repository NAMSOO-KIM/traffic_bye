package traffic.bye.dao;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class RedisDAO {
	@Autowired
	private StringRedisTemplate stringRedisTemplate;
	
	private final int LIMIT_TIME = 180;
	
	public void createSmsCertification(String phone, String certificationNumber) {
		log.info("dao쪽에서 만들 때 잘 넘어가나~ {}", certificationNumber);
		stringRedisTemplate.opsForValue().set(phone, certificationNumber, LIMIT_TIME, TimeUnit.SECONDS);
    }
	
	public String getSmsCertification(String phone) {
		log.info("dao쪽에서 뽑을 떄 잘 나오나~ {}", stringRedisTemplate.opsForValue().get(phone));
        return stringRedisTemplate.opsForValue().get(phone);
    }
	
	public void removeSmsCertification(String phone) {
        stringRedisTemplate.delete(phone);
    }
	
	public boolean hasKey(String phone) {
        return stringRedisTemplate.hasKey(phone);
    }
}
