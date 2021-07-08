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
public class UpdateMemberVO {
	private Long id;
	private String name;
	private String birth;
	private String phone;
	private String passport;
	private String password;
	private String changePassword;
	
}
