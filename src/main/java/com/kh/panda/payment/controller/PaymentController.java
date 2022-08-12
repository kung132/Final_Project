package com.kh.panda.payment.controller;

//import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.panda.board.model.vo.Board;
import com.kh.panda.member.model.vo.Member;
//import com.kh.panda.payment.model.service.PaymentService;
import com.kh.panda.payment.model.vo.Payment;
import com.kh.panda.trade.model.vo.Trade;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//@Autowired
	//private PaymentService paymentService;

	@GetMapping("/paySuccess.do")
	public String paySuccess() {
		return "paySuccess";
	} // 모듈화 작업 필요 X
	
	
	// 결제 화면 띄우기  
		@GetMapping("/payment.do")
		
		public String payment(@RequestParam int payno,
				Model model) {
			
			model.addAttribute("payno", payno);
			
			Board board = sqlSession.selectOne("board.selectDetailView", payno);
			model.addAttribute("board", board);
			
			return "payment/payment";
		
		}
	
	// 카드 정보를 리스트로 가져와서 memberN의 카드번호와 비교 후 결제 요청 
	@PostMapping("/payment.do")
	public String payUser(HttpSession session,
			@ModelAttribute Payment payment,
			@RequestParam int payno
			) {
		
		int memberNo =((Member)session.getAttribute("loginUser")).getMemberNo();
	
    	// 카드 정보를 리스트로 가져와서 memberNo 값과 비교 
		
		payment.setMemberNo(memberNo);
		// 이 부분을
		int count = sqlSession.selectOne("payment.checkCard",payment);
		
		if(count>0) {
			Trade trade = new Trade();
			trade.setBoardNo(payno);
			trade.setMemberNo(memberNo);
			int result = sqlSession.insert("payment.insertTrade", trade);
			
			if( result>0) {
				session.setAttribute("alertMsg", "결제에 성공하였습니다.");
				return "payment/paysuccess";
			}
			
			else {
				
				session.setAttribute("alertMsg", "결제에 실패했습니다");
				return "redirect:/"; 	
			}
		}
		
		
		else {
			
			session.setAttribute("alertMsg", "결제에 실패했습니다");
			return "redirect:/"; 	
		}
		
		
	
	} 
	
	
	
	
	
	
}	