package com.kh.panda.faq.model.dao;

import java.util.List;

import com.kh.panda.faq.model.vo.FAQ;

public interface FaqDao {

	FAQ faqDetail(int nno);

	List<FAQ> faqList(String keyword);

}
