package com.kh.panda.category.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.panda.category.model.vo.Category;
import com.kh.panda.category.model.service.CategoryService;

@Controller
@RequestMapping("/category")
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;

	@GetMapping("/category.do")
	@ResponseBody
	public List<Category> category(@RequestParam String categoryOption,
						   Model model) {
		
		List<Category> catResult = categoryService.category(categoryOption);
		
		//model.addAttribute("catResult", catResult);
		
		
		return catResult;
	}
}
