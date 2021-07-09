package traffic.bye.vo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CartVO {
	private long member_id;
	private long item_id;
	private long quantity;
	
	// item 과 join
	
	private long category_id;
	private String name;
	private long stock;
	private long price;
	private String detail;
	private long store_id;
	
	private String origin_file_url;
	private String thumb_file_url;
	
	// store 과 join
	private String store_name;
}
