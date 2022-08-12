package com.kh.panda.category.model.dao;

import java.util.List;

import com.kh.panda.category.model.vo.Category;

public interface CategoryDao {

	List<Category> category(String categoryOption);
}
