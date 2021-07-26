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
public class LoginInfo {
	private Long id;
	private Long storeId;
	private String loginId;
	private String password;
	private String memberName;
	private String storeName;
}
