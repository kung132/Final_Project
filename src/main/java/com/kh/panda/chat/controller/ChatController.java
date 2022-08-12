package com.kh.panda.chat.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

//import javax.servlet.http.HttpSession;

//import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.panda.board.model.vo.Board;
import com.kh.panda.common.model.vo.PageInfo;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.review.model.vo.Review;






@Controller
@RequestMapping("/chat")
public class ChatController {
	
	
	@Autowired
	private SqlSession sqlSession;
	
	//@Autowired
	//private ChatService chatService;

	
	
	// 화면 띄우기 => 메시지함 페이지 (/chat/)
	@RequestMapping(value="/box.me")
	public String box() {
		
		return "chat/box";
	}
	
	
	

	// 화면 띄우기 => 채팅 페이지 (/chat/)
		@RequestMapping(value="/chat.me")
		public String chat(@RequestParam String toNick, Model model,@RequestParam int currentPage) {
			
			model.addAttribute("toNick", toNick);
			Member member = sqlSession.selectOne("chat.sellerprofile", toNick);
			//List<Board> list = sqlSession.selectList("chat.sellerboardlist", toNick);
			//List<Review> rlist = sqlSession.selectList("chat.sellerrlist", toNick);
			int rcount = sqlSession.selectOne("chat.sellerrcount", toNick);
			String selleravg= sqlSession.selectOne("chat.selleravg", toNick);
			
	        
	        int listCount = sqlSession.selectOne("chat.sellerrcount", toNick);
			
	        int pageLimit = 10;
	        
	        int boardLimit = 4;
	        
	        int maxPage = (int)Math.ceil((double)listCount / boardLimit );
	        
	        
	        int startPage = (currentPage - 1) / pageLimit * pageLimit  + 1;
	        
	        int endPage = startPage + pageLimit -1;
	        
	        if(endPage > maxPage) { 
	            endPage = maxPage;
	        }
	        
	        
	        int startRow = (currentPage - 1) * boardLimit + 1;
	        int endRow = startRow + boardLimit - 1;
	        
	        
	        Map<Object, Object> rparam = new HashMap<Object, Object>();
			rparam.put("startRow", String.valueOf(startRow));
			rparam.put("endRow", String.valueOf(endRow));
	        rparam.put("toNick", toNick);
	        
	        PageInfo pi1 = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	       System.out.println(pi1);
	    	List<Review> rlist = sqlSession.selectList("chat.sellerrlist", rparam);
	    	//System.out.println(rlist);
	    	
	    	
	        
			int listCount2; // 현재 일반게시판의 게시글 총 갯수 => BOARD 로 부터 조회 COUNT(*) 활용 (STATUS ='Y')
	        int pageLimit2; // 페이지 하단에 보여질 페이징바의 페이지 최대 갯수 => 10개로 고정
	        int boardLimit2; // 한 페이지에 보여질 게시글의 최대 갯수 
	        
	        int maxPage2; // 가장 마지막 페이지가 몇번 페이지인지 (== 총 페이지의 갯수) 
	        int startPage2; // 페이지 하단에 보여질 페이징바의 시작 수
	        int endPage2; // 페이지 하단에 보여질 페이징바의 끝 수
	        
	        // * listCount : 총 게시글 갯수 
	        listCount2 = sqlSession.selectOne("chat.selectboardCount", toNick);
	        //System.out.println(listCount2);
	        // * pageLimit : 페이징바의 페이지 최대 갯수
	        pageLimit2 = 10;
	        
	        // * boardLimit : 한 페이지에 보여질 게시글의 최대 갯수
	        boardLimit2 = 4;
	        
	        maxPage2 = (int)Math.ceil((double)listCount2 / boardLimit2 );
	        
	        startPage2 = (currentPage - 1) / pageLimit2 * pageLimit2  + 1;
	        
	        endPage2 = startPage2 + pageLimit2 -1;
	        
	        if(endPage2 > maxPage2) { 
	            endPage2 = maxPage2;
	        }
	        
	      
	        
	        PageInfo pi2 = new PageInfo(listCount2, currentPage, pageLimit2, boardLimit2, maxPage2, startPage2, endPage2);
	        System.out.println(pi2);
	        
	        int startRow2 = (currentPage - 1) * boardLimit2 + 1;
	        int endRow2 = startRow2 + boardLimit2 - 1;
	     
	        
	        Map<Object, Object> param = new HashMap<Object, Object>();
	        param.put("startRow2", String.valueOf(startRow2));
			param.put("endRow2", String.valueOf(endRow2));
	        param.put("toNick", toNick);
	        
	    	
	    	List<Board> list = sqlSession.selectList("chat.sellerboardlist", param);
	    	//System.out.println(list);
	    	
			
			if(selleravg == null) {
				
				model.addAttribute("member", member);
				model.addAttribute("list", list);
				model.addAttribute("rlist", rlist);
				model.addAttribute("rcount", rcount);
				model.addAttribute("selleravg",'0');
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("pi2", pi2);
				model.addAttribute("pi1", pi1);
				
				
			}
				else {
					
				String selleravg2 = selleravg + "00000";
			    String avgType = selleravg2.substring(0,4);
				model.addAttribute("member", member);
				model.addAttribute("list", list);
				model.addAttribute("rlist", rlist);
				model.addAttribute("rcount", rcount);
				model.addAttribute("selleravg",avgType);
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("pi2", pi2);
				model.addAttribute("pi1", pi1);
				
				}
				return "chat/chat";
		}

		
}
