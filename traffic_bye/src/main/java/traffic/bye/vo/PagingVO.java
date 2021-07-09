package traffic.bye.vo;

import lombok.Data;

@Data
public class PagingVO {	
	
	private int nowPage; 
	private int startPage; 
	private int endPage; 
	private int total; 
	private int cntPerPage; 
	private int lastPage; 
	private int start; 
	private int end;
}
