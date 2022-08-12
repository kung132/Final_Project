package com.kh.panda.category.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.category.model.vo.Category;

@Repository
public class CategoryDaoImpl implements CategoryDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Category> category(String categoryOption) {
		
		return sqlSession.selectList("category", categoryOption);
	}

}
