package traffic.bye.vo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CartVO {
	private long member_id;
	private long item_id;
	private long quantity;
	
	// item, item_image와 join
	
	private long category_id;
	private String name;
	private long stock;
	private long price;
	private String detail;
	private long store_id;
	
	//item_image 테이블
	private String upload_file_name;
	private String real_file_name;
	
	//나중에 추가
	private String origin_file_url;
	private String thumb_file_url;
}
