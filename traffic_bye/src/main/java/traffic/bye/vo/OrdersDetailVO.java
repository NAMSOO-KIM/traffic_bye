package traffic.bye.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrdersDetailVO {
	private long itemId;
	private long ordersId;
	private long storeId;
	private long quantity;
}
