package com.kh.panda.notice.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.panda.notice.model.service.NoticeService;
import com.kh.panda.notice.model.vo.Notice;

@Controller
@RequestMapping("/admin")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/notice.do")
	public String notice(Model model) {

		List<Notice> list = noticeService.notice();
		model.addAttribute("list", list);
		
		return "admin/noticeList";
		
		
		
	}
	@GetMapping("/notice.ad")
	public String noticeAdd() {

			return "admin/noticeAdd";
		
	}
	
	@PostMapping("/notice.ad")
	public String noticeAdd(HttpSession session,
								@ModelAttribute Notice notice) {
		
		String noticeWriter = "admin"; //((Member)session.getAttribute("loginUser")).getMemberId();
		notice.setNoticeWriter(noticeWriter);
		int result = noticeService.noticeAdd(notice);
		
		if(result > 0){
			session.setAttribute("alertMsg", "공지사항 등록 성공");
			return "redirect:notice.do";
		}else {
			session.setAttribute("alertMsg", "공지사항 등록 실패");
			return "redirect:notice.do";
		}
	}
	
	@GetMapping("/noticeDetail.do")
	public String noticeDetail(@RequestParam int noticeNo,Model model) {

		Notice notice = noticeService.noticeDetail(noticeNo);
		model.addAttribute("notice", notice);
			
		return "admin/noticeDetail";
		
	}
	@GetMapping("/noticeDelete.de")
	public String noticeDelete(@RequestParam int noticeNo,
								HttpSession session) {

		int result = noticeService.noticeDelete(noticeNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "공지사항이 삭제되었습니다");
			return "redirect:notice.do";
		}else {
			session.setAttribute("alertMsg", "공지사항 삭제를 실패했습니다.");
			return "redirect:notice.do";
		}
	}
	@GetMapping("/footerNotice.do")
	public String footerNotice(Model model) {

		List<Notice> list = noticeService.notice2();
		model.addAttribute("list", list);
		
		
		return "admin/footerNotice";
		
	}
	@GetMapping("/footerNoticeDetail.do")
	public String footerNoticeDetail(@RequestParam int noticeNo,Model model) {

		Notice notice = noticeService.noticeDetail(noticeNo);
		model.addAttribute("notice", notice);
			
		return "admin/footerNoticeDetail";
		
	}
}
