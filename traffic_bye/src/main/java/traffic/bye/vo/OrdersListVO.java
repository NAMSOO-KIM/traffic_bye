package traffic.bye.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrdersListVO {
	private long memberId;
	private long orderId;
	private String departureDate;
	private String paymentDate;
	private long status;
	private long amount;
	

}
