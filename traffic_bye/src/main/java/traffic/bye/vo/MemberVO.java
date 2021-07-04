package traffic.bye.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class MemberVO {
	long id;
	long authId;
	String loginId;
	String password;
	String phone;
	String passport;
	String name;
	String birth;
	String card;
	String cardCvc;
	String cardExpire;
	ROLE role;
	AuthType authType;
}
