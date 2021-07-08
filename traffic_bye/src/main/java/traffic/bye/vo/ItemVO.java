package traffic.bye.vo;

import lombok.Data;

@Data
public class ItemVO {
	private long id;
	private long category_id;
	private String name;
	private long stock;
	private long price;
	private String detail;
	private long store_id;
	
	private String repre_file;
	private String thumb_file_url;
	
	
	//item_image 테이블
	private String upload_file_name;
	private String real_file_name;
	
	
}
