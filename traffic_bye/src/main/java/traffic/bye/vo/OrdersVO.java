package traffic.bye.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrdersVO {
	private long id;
	private long memberId;
	private String departureDate;
	private String paymentDate;
	private long status;
	private long amount;
	private long destinationId;
	private long cigaretteAmount;
	private long drinkAmount;
	private long perfumeAmount;
}
