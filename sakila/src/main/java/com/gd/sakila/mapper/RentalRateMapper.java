package com.gd.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RentalRateMapper {
	List<String> selectRentalRateList();
	
}
