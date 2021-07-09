package traffic.bye.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class WordDTO implements Serializable {
	
	private long id;
	private String member_id;
	private String question;
	private String answer;
	
	
}
