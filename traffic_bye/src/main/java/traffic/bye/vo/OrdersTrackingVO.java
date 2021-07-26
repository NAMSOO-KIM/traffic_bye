package traffic.bye.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrdersTrackingVO {
	
	private String storeName;
	private String itemName;
	private long price;
	private long quantity;
	private long orderId;
	private long totalPrice;
	private String memberName;
	private String paymentDate;
	private String detailStatus;
	private String totalStatus;
	private long orderAmount;
	private String itemImg;
}
