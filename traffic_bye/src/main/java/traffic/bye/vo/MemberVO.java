package traffic.bye.vo;

import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberVO implements Serializable{
	private long id;
	private String passport;
	private String phone;
	private String name;
	private String email;
	private String birth;
	private String card;
	private long cardCvc;
	private String role;
	private String authType;
}
