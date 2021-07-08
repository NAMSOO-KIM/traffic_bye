package traffic.bye.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrdersDetailListVO {
	
	private String itemName;
	private long price;
	private long memberId;
	private long orderId;
	
}
