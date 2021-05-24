package com.gd.sakila.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data 
public class Page {
	private int rowPerPage;
	private int beginRow;
	private String searchWord;
	private String category;
	private String rating;
}
