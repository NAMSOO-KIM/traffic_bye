package traffic.bye.vo;

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
public class StoreDetailVO {
	private Long id;
	private String name;
	private String detail;
	private String streamingURL;
	private String contact;
	private Integer capacity;
	private String thumbFileURL;
	private String repreFile;
	private String location;
	private Long repreFileSize;
	private String repreFileURL;
}
