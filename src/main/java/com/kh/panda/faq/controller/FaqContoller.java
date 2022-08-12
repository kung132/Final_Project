package com.kh.panda.faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.kh.panda.faq.model.service.FaqService;
import com.kh.panda.faq.model.vo.FAQ;

@RestController 
@RequestMapping("/faq")
public class FaqContoller {
	
	@Autowired
	private FaqService faqService;

	
	@GetMapping("/faq.do")
	public List<FAQ> faqList(@RequestParam(required = false) String keyword, 
								Model model) {
		
		List<FAQ> list = faqService.faqList(keyword);
		
		model.addAttribute("list", list);
		
		return list;
		
	}
	@GetMapping("/faq.de")
	public FAQ faqDetail(@RequestParam int nno) {
		
		FAQ faq = faqService.faqDetail(nno);
		
		System.out.println(faq);
		
		
		return faq;
		
	}
	
		
}
