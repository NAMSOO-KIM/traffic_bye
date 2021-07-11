package traffic.bye.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import traffic.bye.vo.ItemDetailVO;
import traffic.bye.vo.ItemVO;
import traffic.bye.vo.PagingVO;


public interface ItemService {
	
	//public ItemDTO getItem(long itemNO) throws Exception;
	
	List<ItemVO> getItemList() throws Exception;
	
	ItemVO getItem(long id) throws Exception;

	List<ItemVO> getRelatedItemList(HashMap<String, Object> map) throws Exception; 
	
	List<ItemVO> getMainCategoryItemList(long parent_id) throws SQLException;
	
	List<ItemVO> getItemDetail(long id) throws Exception;
	
	int isRelatedItem(HashMap<String, Object> map) throws Exception;

	List<ItemVO> getItemFromStore(long id) throws Exception;

	List<ItemVO> getMediumCategoryItemList(long category_id) throws SQLException;

	Long addItem(Long storeId, String items, MultipartHttpServletRequest mreq) throws Exception;
	
	void updateItem(Long itemId, String items, MultipartHttpServletRequest mreq) throws Exception;

	List<ItemVO> getMainCategoryNewItemList(long category_id) throws SQLException;
	
	ItemDetailVO getItemDetailWithImage(Long id) throws Exception;
	
	// 아이템 전체 개수 반환 (김남수)
	int countItem(long id) throws Exception;
	
	// 페이징 된 아이템 목록(상점, 아이템)들 조회
	List<ItemVO> getPagingItemList(HashMap<String, Object> map) throws SQLException;

	// 메인 카테고리에 재고가 없는 순으로 8개 가져옴.(100이하일 경우만)
	List<ItemVO> getMainOutOfStockList(long parent_id) throws SQLException;
	
	// 스마트 오더가 완료(orders_detail 상태가 3)인 개수들을 세서 개수가 많은 순으로 반환 
	List<ItemVO> getFrequentSmartOrderItems() throws SQLException;
	
	
}
