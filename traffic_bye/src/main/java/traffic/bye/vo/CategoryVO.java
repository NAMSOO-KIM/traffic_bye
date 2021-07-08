package traffic.bye.vo;

import lombok.Data;

@Data
public class CategoryVO {
	
	private long id;
	private String name;
	private long parent_id;
}
