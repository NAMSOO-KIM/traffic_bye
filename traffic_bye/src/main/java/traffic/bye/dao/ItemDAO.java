package traffic.bye.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import traffic.bye.vo.ImageDeleteVO;
import traffic.bye.vo.ImageVO;
import traffic.bye.vo.ItemAddVO;
import traffic.bye.vo.ItemDeleteVO;
import traffic.bye.vo.ItemDetailVO;
import traffic.bye.vo.ItemUpdateVO;
import traffic.bye.vo.ItemVO;
import traffic.bye.vo.OrdersDetailVO;
import traffic.bye.vo.StoreItemVO;

public interface ItemDAO {
	//ItemDTO getItem(long itemNO) throws Exception;
	List<ItemVO> getItemList() throws SQLException; //상점과 아이템 전체 목록 가져오기 
	
	ItemVO getItem(long id) throws SQLException;
	
	List<ItemVO> getRelatedItemList(HashMap<String, Object> map) throws SQLException;
	
	List<ItemVO> getMainCategoryItemList(long parent_id) throws SQLException;
	
	List<ItemVO> getItemDetail(long id) throws SQLException; // 이미지 포함
	
	int isRelatedItem(HashMap<String, Object> map) throws SQLException;


	List<ItemVO> getItemFromStore(long store_id) throws SQLException;

	List<ItemVO> getMediumCategoryItemList(long category_id) throws SQLException;

	Long addItem(ItemAddVO itemAddVO) throws SQLException;
	
	int addItemImages(List<ImageVO> list) throws SQLException;
	
	List<ItemVO> getMainCategoryNewItemList(long parent_id) throws SQLException;
	
	ItemDetailVO getItemDetailWithoutImage(Long id) throws SQLException;
	
	List<ImageVO> getImage(Long id) throws SQLException;
	
	ItemDetailVO getItemDetail(Long id) throws SQLException;
	
	Long updateItem(ItemUpdateVO itemUpdateVO) throws SQLException;
	
	Long deleteItemImages(ImageDeleteVO imageDeleteVO) throws SQLException;
	
	// 특정 카테고리 아이템 전체 개수 반환
	int countItem(long id) throws SQLException;
	
	// 페이징 된 아이템(상점명, 아이템)들 조회
	List<ItemVO> getPagingItemList(HashMap<String, Object> map) throws SQLException;
	
	List<StoreItemVO> getStoreItems(Long storeId) throws SQLException;
	
	int deleteItem (ItemDeleteVO itemDeleteVO) throws SQLException;

	int countStoreItem(long store_id) throws SQLException;

	List<ItemVO> getPagingStoreItemList(HashMap<String, Object> map) throws SQLException;
	
	// 메인 카테고리에 재고가 없는 순으로 8개 가져옴.(100이하일 경우만)
	List<ItemVO> getMainOutOfStockList(long parent_id) throws SQLException;
	
	// 스마트 오더 인기제품 (주문 기준 내림차순)
	List<ItemVO> getFrequentSmartOrderItems() throws SQLException;
	
	int updateStock(OrdersDetailVO ordersDetailVO) throws SQLException;
}
