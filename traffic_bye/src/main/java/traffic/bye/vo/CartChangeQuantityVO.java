package traffic.bye.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartChangeQuantityVO {
	
	private long currentQuantity;
	private long currentMemberId;
	private long currentItemId;

}
