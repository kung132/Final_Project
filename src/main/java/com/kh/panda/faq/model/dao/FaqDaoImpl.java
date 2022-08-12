package com.kh.panda.faq.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.faq.model.vo.FAQ;

@Repository
public class FaqDaoImpl implements FaqDao{

	@Autowired
	private SqlSession sqlSession;


	@Override
	public FAQ faqDetail(int nno) {

		return sqlSession.selectOne("faq.faqDetail",nno);
	}

	@Override
	public List<FAQ> faqList(String keyword) {
		
		return sqlSession.selectList("faq.faqList",keyword);
	}

	
	
}
