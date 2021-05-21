package com.gd.sakila.vo;

import lombok.Data;

@Data
public class StaffView {
	private int id;
	private String name;
	private String address;
	private String zipCode;
	private String phone;
	private String city;
	private String contry;
	private int SID;
}
