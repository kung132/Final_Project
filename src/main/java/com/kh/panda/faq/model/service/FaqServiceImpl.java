package com.kh.panda.faq.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.panda.faq.model.dao.FaqDao;
import com.kh.panda.faq.model.vo.FAQ;


@Service
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqDao faqDao;

	@Override
	public FAQ faqDetail(int nno) {
		
		FAQ faq = faqDao.faqDetail(nno);
		
		return faq;
	}

	@Override
	public List<FAQ> faqList(String keyword) {
		
		List<FAQ> list = faqDao.faqList(keyword);

		return list;
	}

	
}
