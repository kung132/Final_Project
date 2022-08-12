package com.kh.panda.category.model.vo;

import lombok.Data;

@Data
public class Category {
	
	private int categoryNo;	//	CATEGORY_NO NUMBER PRIMARY KEY,
	private String mainCategoryName;	//	MAINCATEGORY_NAME VARCHAR2(50) NOT NULL,
	private String categoryName;	//	CATEGORY_NAME VARCHAR2(50) NOT NULL
}
