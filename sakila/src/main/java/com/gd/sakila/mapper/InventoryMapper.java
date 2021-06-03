package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.Page;

@Mapper
public interface InventoryMapper {
	List<Map<String, Object>> selectInventoryInfoList(Map<String, Object> map);
	List<Integer> selectInventoryTotal();
	int selectInventoryStockCnt(Map<String, Object> map);
	List<Integer> selectInventoryOneStock(Map<String, Object> map);
	List<Integer> selectInventoryOneNotStock(Map<String, Object> map);
	int selectInventoryNotStockCnt (Map<String, Object> map);
	int selectInventoryTotalCount (String searchWord);
	List<Map<String, Object>> selectInventoryByFilmId(int filmId);
	int insertInventory(Map<String, Object> map);
	int removeInventory(int inventoryId);
}
