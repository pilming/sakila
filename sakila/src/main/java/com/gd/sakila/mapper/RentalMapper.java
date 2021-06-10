package com.gd.sakila.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RentalMapper {
	int insertRental(Map<String, Object> map);
	int updateReturnDate(int rantalId);
	Map<String, Object> selectReturnInfo(Map<String, Object> map);
}
