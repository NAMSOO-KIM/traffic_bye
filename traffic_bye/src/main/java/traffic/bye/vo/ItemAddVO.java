package traffic.bye.vo;

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
public class ItemAddVO {
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
}
