package traffic.bye.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrdersManageVO {
	
	private long ordersId;
	private long storeId;
	private long status;
	private long amount;
	private String memberName;
	private String paymentDate;
	
}
