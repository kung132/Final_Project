package com.kh.panda.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.panda.board.model.vo.Board;
import com.kh.panda.chat.model.vo.Chat;
import com.kh.panda.common.model.vo.PageInfo;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.review.model.vo.Review;

@RestController 

@RequestMapping("/test")

public class ChatRestController {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@PostMapping("/test1.do")
	public int insertChat(
			@RequestParam String toNick,
			@RequestParam String chatContent,
			HttpSession session) {
		
		String fromNick =((Member)session.getAttribute("loginUser")).getMemberNick();
		//System.out.println(toId);
		//System.out.println(chatContent);
		
		Chat chat = new Chat();
		chat.setFromNick(fromNick);
		chat.setToNick(toNick);
		chat.setChatContent(chatContent);
		
		int result = sqlSession.insert("chat.insertChat", chat);
		
	
		return result;
	
	
	
	}
	
	
	@PostMapping("/test2.do")
	public List<Chat> chatList(
			@RequestParam String toNick,
			HttpSession session) {
		
		String fromNick =((Member)session.getAttribute("loginUser")).getMemberNick();
		
		//System.out.println(fromId);
		//System.out.println(toId);
		
		Map<String, Object> param = new HashMap<>();
		// 자바에서는 일반 자료형을 제네릭으로 설정할 수 없다.
		// Wrapper 클래스 형태로 지정해주거나, Object 타입으로 적으면 다형성에 의해 값이 잘 들어간다.
		param.put("fromNick", fromNick);
		param.put("toNick", toNick);
		
		
		List<Chat> chatList = sqlSession.selectList("chat.selectChatList", param);
		
				
		
		for(int i=0; i<chatList.size(); i++) {
			Chat x = chatList.get(i);
			int chatTime = Integer.parseInt(x.getChatTime().substring(11, 13));
			String timeType = "오전";
			
			if(chatTime >= 12) 
			{ timeType = "오후"; chatTime -= 12; }
			x.setChatTime(x.getChatTime().substring(0, 11)  + " " + timeType + " " + chatTime + ":" + x.getChatTime().substring(14, 16) + "");
			
		}
		
		sqlSession.update("chat.readChat",param);
		return chatList;
	
	}
	
	
	
	@PostMapping("/test3.do")
	public List<Chat> boxList(HttpSession session) {
		
		String memberNick =((Member)session.getAttribute("loginUser")).getMemberNick();
		
		
		//int count = sqlSession.selectOne("chat.unreadChat", memberNick);
		
		List<Chat> boxList = sqlSession.selectList("chat.selectBoxList", memberNick);
		
		for(int i=0; i<boxList.size(); i++) {
			Chat x = boxList.get(i);
			
			
			String unread = "";
			if(memberNick.equals(x.getToNick())) {
				
				
				Map<String, Object> param = new HashMap<>();
				
				param.put("fromNick", x.getFromNick());
				param.put("toNick", memberNick);
				
				
				unread = sqlSession.selectOne("chat.unreadChat", param)+ "";
				if(unread.equals("0")) unread = "";
			}
			
			// System.out.println(unread); 값 잘 찍힘
			
			x.setChatCount(unread);
			
			int chatTime = Integer.parseInt(x.getChatTime().substring(11, 13));
			String timeType = "오전";
			
			if(chatTime >= 12) 
			{ timeType = "오후"; chatTime -= 12; }
			x.setChatTime(x.getChatTime().substring(0, 11)  + " " + timeType + " " + chatTime + ":" + x.getChatTime().substring(14, 16) + "");
			
			
			
			for(int j=0; j<boxList.size(); j++) {
				Chat y = boxList.get(j);
				if(x.getFromNick().equals(y.getToNick()) && x.getToNick().equals(y.getFromNick())) {
					if(x.getChatId() < y.getChatId()) {
						boxList.remove(x);
						i--;
						break;
					} else {
						boxList.remove(y);
						j--;
					}}}
			
		}
		
		return boxList;
	
	}
	
	
	@PostMapping("/test4.do")
	public int unreadChat(HttpSession session) {
		
		
		if(((Member)session.getAttribute("loginUser")) != null) { // 로그인 된 상태
			 String memberNick =((Member)session.getAttribute("loginUser")).getMemberNick();
			int count = sqlSession.selectOne("chat.allUnreadChat", memberNick);
			
			return count; }
		
		else {
			
			return 0; }
		
		
		
	}
	
	@PostMapping("/test5.do")
	public int deleteChat(@RequestParam String toNick,HttpSession session) {
		
		String fromNick =((Member)session.getAttribute("loginUser")).getMemberNick();
		
		
		Map<String, Object> param = new HashMap<>();
		param.put("fromNick", fromNick);
		param.put("toNick", toNick);
		
		int result = sqlSession.delete("chat.deleteChat", param);
		
		return result;
	
	}
	
	
	
	
	@GetMapping("/test6.do")
	public List<Board> sellerlist(@RequestParam String toNick,
									@RequestParam int currentPage,
									Model model) {
		
		int listCount2 = sqlSession.selectOne("chat.selectboardCount", toNick);
		
        int pageLimit2 = 10;
        
        int boardLimit2 = 4;
        
        int maxPage2 = (int)Math.ceil((double)listCount2 / boardLimit2 );
        
        int startPage2 = (currentPage - 1) / pageLimit2 * pageLimit2  + 1;
        
        int endPage2 = startPage2 + pageLimit2 -1;
        
        
        int startRow2 = (currentPage - 1) * boardLimit2 + 1;
        int endRow2 = startRow2 + boardLimit2 - 1;
       
     
        
        Map<Object, Object> param = new HashMap<Object, Object>();
		param.put("startRow2", String.valueOf(startRow2));
		param.put("endRow2", String.valueOf(endRow2));
        param.put("toNick", toNick);
        
        PageInfo pi2 = new PageInfo(listCount2, currentPage, pageLimit2, boardLimit2, maxPage2, startPage2, endPage2);
        System.out.println("Rest-pi2");
        System.out.println(pi2);
    	List<Board> list = sqlSession.selectList("chat.sellerboardlist", param);
    	System.out.println(list);
    	return list;
    	
	}
	
	
	
	
	@GetMapping("/test7.do")
	public List<Review> sellerrlist(@RequestParam String toNick,
									@RequestParam int currentPage,
									Model model) {
		
		int listCount = sqlSession.selectOne("chat.sellerrcount", toNick);
		
        int pageLimit = 10;
        
        int boardLimit = 4;
        
        int maxPage = (int)Math.ceil((double)listCount / boardLimit );
        
        int startPage = (currentPage - 1) / pageLimit * pageLimit  + 1;
        
        int endPage = startPage + pageLimit -1;
        
        
        int startRow = (currentPage - 1) * boardLimit + 1;
        int endRow = startRow + boardLimit - 1;
       
        Map<Object, Object> rparam = new HashMap<Object, Object>();
		rparam.put("startRow", String.valueOf(startRow));
		rparam.put("endRow", String.valueOf(endRow));
        rparam.put("toNick", toNick);
        
        
        PageInfo pi1 = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
        System.out.println("Rest-pi");
        System.out.println(pi1);
    	List<Review> rlist = sqlSession.selectList("chat.sellerrlist", rparam);
    	//System.out.println(rlist);
    	
    	return rlist;
    	
	}
	
	
	
}	


