package traffic.bye.vo;

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
public class StoreItemVO {
	private Long id;
	private String name;
	private Integer stock;
	private Integer price;
	private Long storeId;
	private String repreFile;
	private String thumbFileURL;
	private Long categoryId;
	private String category;
	private Long parentCategoryId;
	private Long repreFileSize;
}