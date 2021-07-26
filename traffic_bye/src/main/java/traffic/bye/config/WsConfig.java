package traffic.bye.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import traffic.bye.handler.SmartOrderHandler;


@Configuration
@EnableWebSocket
public class WsConfig implements WebSocketConfigurer{

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(smartOrderHandler(), "/smartOrder.sockjs").withSockJS();
	}

	private SmartOrderHandler smartOrderHandler() {
		return new SmartOrderHandler();
	}

}
