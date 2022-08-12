package com.kh.panda.category.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.category.model.dao.CategoryDao;
import com.kh.panda.category.model.vo.Category;

@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired
	private CategoryDao categoryDao;

	@Override
	public List<Category> category(String categoryOption) {
		
		return categoryDao.category(categoryOption);
	}
	
	

}
