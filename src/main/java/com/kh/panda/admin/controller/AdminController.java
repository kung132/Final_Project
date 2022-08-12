package com.kh.panda.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.panda.admin.model.service.AdminService;
import com.kh.panda.admin.model.vo.AdminMember;
import com.kh.panda.board.model.vo.Board;
import com.kh.panda.category.model.vo.Category;
import com.kh.panda.common.model.vo.PageInfo;
import com.kh.panda.seller.model.vo.Seller;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	@GetMapping("/admin.do")
	public String memberList(Model model) {

		int countMember = adminService.memberCount();
		int countSeller = adminService.sellerCount();
		int countTrade = adminService.tradeCount();
		int tradeToday = adminService.tradeToday();
		int tradeWeek = adminService.tradeWeek();
		int tradeMonth = adminService.tradeMonth();
		int tradeLastWeek = adminService.tradeLastWeek();
		
		

		List<AdminMember> list = adminService.selectList();


		model.addAttribute("tradeToday", tradeToday);
		model.addAttribute("tradeWeek", tradeWeek);
		model.addAttribute("tradeMonth", tradeMonth);
		model.addAttribute("tradeLastWeek", tradeLastWeek);

		model.addAttribute("countMember", countMember);
		model.addAttribute("countSeller", countSeller);
		model.addAttribute("countTrade", countTrade);
		model.addAttribute("list", list);
		
		

		return "admin/adminHome";
	}

	@GetMapping("/customer.do")
	public String customerList(@RequestParam(required = false, defaultValue = "MEMBER_NAME") String type,
			@RequestParam(required = false, defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int currentPage,
			Model model) {
		
	
		int pageLimit = 5;
		int boardLimit = 5;
		int listCount;
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = adminService.selectListCount();

		maxPage = (int) Math.ceil((double) listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		Map<String, Object> param = new HashMap<>();

		param.put("type", type);
		param.put("keyword", keyword);

		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("maxPage", maxPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		List<AdminMember> pageList= adminService.pageList(pi,param);
		
		model.addAttribute("pageList", pageList);
		model.addAttribute("keyword",keyword);
		model.addAttribute("type",type);
		

		return "admin/customer";

	}

	@GetMapping("/customer.de")
	public String customerDetail(@RequestParam int memberNo, Model model) {

		AdminMember member = adminService.customerDetail(memberNo);
		Seller seller = adminService.sellerList(memberNo);
		
		
		model.addAttribute("member", member);
		model.addAttribute("seller", seller);

		return "admin/customerDetail";

	}

	@GetMapping("/delete.cu")
	public String customerDelete(@RequestParam int memberNo, HttpSession session) {

		int result = adminService.customerDelete(memberNo);

		if (result > 0) {
			session.setAttribute("alertMsg", "회원삭제 성공");
			return "redirect:customer.do";
		} else {
			session.setAttribute("alertMsg", "삭제실패");
			return "redirect:customer.do";
		}

	}

	@GetMapping("/approval.do")
	public String approvalUpdate(@RequestParam int memberNo, HttpSession session) {

		int result = adminService.approvalUpdate(memberNo);

		if (result > 0) {
			session.setAttribute("alertMsg", "승인");
			return "redirect:admin.do";
		} else {
			session.setAttribute("alertMsg", "승인실패");
			return "redirect:admin.do";
		}

	}

	@GetMapping("/grade.up")
	public String gradeUpdate(@RequestParam int memberNo, @RequestParam int grade, HttpSession session) {

		List<Integer> list = new ArrayList<>();
		list.add(memberNo);
		list.add(grade);

		int result = adminService.gradeUpdate(list);

		if (result > 0) {
			session.setAttribute("alertMsg", "승인완료");
			return "redirect:customer.do";
		} else {
			session.setAttribute("alertMsg", "승인실패");
			return "redirect:customer.do";
		}
	}
	@GetMapping("/message.do")
	public String messageMemberList(@RequestParam(required = false) String type,
								@RequestParam(required = false) String keyword,
								Model model) {
		
		Map<String, Object> param = new HashMap<>();

		param.put("type", type);
		param.put("keyword", keyword);
		
		List<AdminMember> memberList= adminService.messageMemberList(param);
		
		model.addAttribute("memberList", memberList);
		
		
		return "admin/message";
	}
	
	@PostMapping("/message.up")
	public String messageSend(HttpSession session,
								@RequestParam(required = false) List<String> check,
								@RequestParam(required = false) String content) {
		
		Map< String, String> param = new HashMap<>();
		for(int i=0; i<check.size(); i++) {
			param.put("key"+i, check.get(i));
		}
		param.put("content", content);
		int result = adminService.messageSend(param);

		if(result>0) {
			session.setAttribute("alertMsg", "메시지를 전송했습니다.");
			return "redirect:message.do";
		}else {
			session.setAttribute("alertMsg", "메시지 전송을 실패했습니다.");
			return "redirect:message.do";
		}
		
		
	}
	@GetMapping("/refusal.do")
	public String refusalDelete(@RequestParam int memberNo, HttpSession session) {

		int result = adminService.refusalDelete(memberNo);

		if (result > 0) {
			session.setAttribute("alertMsg", "승인거절");
			return "redirect:admin.do";
		} else {
			session.setAttribute("alertMsg", "승인실패");
			return "redirect:admin.do";
		}

	}
	@GetMapping("/data.do")
	public String dataPage(HttpSession session, Model model) {

		int newMember = adminService.newMember();
		int tradeMonth = adminService.tradeMonth();
		int newBoard = adminService.newBoard();
		List<Integer> sellerRank= adminService.sellerRank();
		List<AdminMember> sellerRankB = adminService.sellerRankB(sellerRank);
		List<Integer> boardRank= adminService.boardRank();
		List<Board> boardRankB = adminService.boardRankB(boardRank);
		List<Integer> categoryRank= adminService.categoryRank();
		List<Category> categoryRankB = adminService.categoryRankB(categoryRank);
		
		
		model.addAttribute("newMember", newMember);
		model.addAttribute("tradeMonth", tradeMonth);
		model.addAttribute("newBoard", newBoard);
		model.addAttribute("sellerRankB", sellerRankB);
		model.addAttribute("boardRankB", boardRankB);
		model.addAttribute("categoryRankB", categoryRankB);
		
		System.out.println(sellerRankB);
			return "admin/data";
		

	}
	
}
