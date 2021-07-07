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
public class MemberVO {
	Long id;
	Long authId;
	String loginId;
	String password;
	String phone;
	String passport;
	String name;
	String birth;
	ROLE role;
	AuthType authType;
}