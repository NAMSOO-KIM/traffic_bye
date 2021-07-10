package traffic.bye.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrdersTrackingVO {
	
	private long orderId;
	private String memberName;
	private String paymentDate;
	private String amount;
	private long status;
}
