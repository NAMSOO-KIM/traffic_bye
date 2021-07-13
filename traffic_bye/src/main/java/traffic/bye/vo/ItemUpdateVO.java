package traffic.bye.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ItemUpdateVO {
	private Long id;
	private String name;
	private Integer bigCategory;
	private Integer midCategory;
	private Integer stock;
	private Integer price;
	private String detail;
	private Long storeId;
	private String repreFile;
	private String thumbFileURL;
	private String repreFileURL;
	private String mainThumbFileURL;
	private Long repreFileSize;
	private List<String> deletedImgs;
}
