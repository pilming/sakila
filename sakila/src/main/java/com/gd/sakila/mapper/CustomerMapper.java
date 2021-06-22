package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.sakila.vo.CustomerForm;

@Mapper
public interface CustomerMapper {
	int updateCustomerActiveByscheduler();
	List<Map<String, Object>> selectCustomerList(Map<String, Object> map);
	List<Map<String, Object>> selectCustomerList();
	int selectCustomerTotal(Map<String, Object> map);
	Map<String, Object> selectCustomerOne(int customerId);
	Double selectPaymentByCustomerId(int customerId);
	int selectBlackConsumer(int customerId);
	int insertCustomer(CustomerForm customerForm);
	List<Map<String, Object>> selectCustomerRentalHisroty(int customerId);
}
