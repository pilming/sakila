package com.gd.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.CustomerForm;

@Mapper
public interface AddressMapper {
	int insertAddressForCustomer(CustomerForm customerForm);
}
