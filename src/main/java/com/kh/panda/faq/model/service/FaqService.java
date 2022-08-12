package com.kh.panda.faq.model.service;

import java.util.List;

import com.kh.panda.faq.model.vo.FAQ;

public interface FaqService {

	FAQ faqDetail(int nno);

	List<FAQ> faqList(String keyword);

}
