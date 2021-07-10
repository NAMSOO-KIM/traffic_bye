package traffic.bye.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ItemDetailVO {
	private Long id;
	private String name;
	private Integer stock;
	private Integer price;
	private String detail;
	private Long storeId;
	private String repreFile;
	private String thumbFileURL;
	private List<ImageVO> images;
	private Long categoryId;
	private Long parentCategoryId;
	private Long repreFileSize;
}
