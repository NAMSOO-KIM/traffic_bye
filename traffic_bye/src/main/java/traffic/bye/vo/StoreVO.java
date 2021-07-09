package traffic.bye.vo;

import java.util.List;

import lombok.Data;

@Data
public class StoreVO {
	private long id;
	private String name;
	private String detail;
	private String streaming_url;
	private long capacity;
	private long store_id;
	
	//store_image 테이블
	private String upload_file_name;
	private String real_file_name;
	
	//추가?
	private String origin_file_name;
	private String thumb_file_url;
	
	private String contact;
	private List<Long> categories;
}
