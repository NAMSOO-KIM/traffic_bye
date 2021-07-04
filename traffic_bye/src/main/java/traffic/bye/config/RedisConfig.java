package traffic.bye.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.StringRedisTemplate;

@Configuration
@PropertySource("classpath:config/redis.properties")
public class RedisConfig {
	@Value("${redis.host}")
	String host = "redis-10211.c85.us-east-1-2.ec2.cloud.redislabs.com";
	
	@Value("${redis.port}")
	int port = 10211;
	
	@Bean
	public JedisConnectionFactory jedisConnectionFactory() {
		JedisConnectionFactory jedisConnectionFactory = new JedisConnectionFactory();
		jedisConnectionFactory.setHostName(host);
		jedisConnectionFactory.setPort(port);
		jedisConnectionFactory.setUsePool(false);
		jedisConnectionFactory.setPassword("wDG4qCTaYXDBd1ttHcI9o8BSw6CYZQtQ");
		return jedisConnectionFactory;
	}
	
	@Bean
	public StringRedisTemplate stringRedisTemplate() {
		return new StringRedisTemplate(jedisConnectionFactory());
	}
}
