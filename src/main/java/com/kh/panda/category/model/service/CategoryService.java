package com.kh.panda.category.model.service;

import java.util.List;

import com.kh.panda.category.model.vo.Category;

public interface CategoryService {
	
	List<Category> category(String categoryOption);
}
