package com.kh.panda.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.panda.board.model.service.BoardService;
import com.kh.panda.board.model.vo.Board;
import com.kh.panda.category.model.vo.Category;
import com.kh.panda.common.model.vo.PageInfo;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.review.model.service.ReviewService;
import com.kh.panda.review.model.vo.ReviewFile;

@RestController
@RequestMapping("/boardRest")
public class BoardRestController {

	@Autowired
	private BoardService boardService;	
	
	 @Autowired
	    private ReviewService reviewService;
	
	@GetMapping("/enrollrestCategory.do")
	public List<Category> enrollRest1(
			@RequestParam String mainCategory) {

		List<Category> list = boardService.enrollRestCategory(mainCategory);

		return list;
	}
	
	
	@GetMapping("/enrollrestCategoryJsp.do")
	public List<Category> enrollRest2(
			@RequestParam String mainCategory) {
		
		List<Category> list = boardService.enrollRestCategory(mainCategory);

		return list;
	}
	
	
	@GetMapping("/enrollrestGetAllCategory.do")
	public List<Category> getAllCategory() {
		
		List<Category> list = boardService.getAllCategory();
	
		return list;
	}
	
	
	
	@GetMapping("/restNextDetail.do") 
	public List<Board>restNextDetail(@RequestParam String boardWriter,
									 @RequestParam int num) {
		
		System.out.println("다음가보자");
		
		int currentPage = num;
        int pageLimit = 10;
        int boardLimit = 4;
		int listCount = boardService.selectBoardCount(boardWriter);
        
        int startPage = (currentPage - 1) / pageLimit * pageLimit  + 1;
        
        int endPage = startPage + boardLimit -1;
        
        System.out.println(listCount);
        System.out.println(startPage);
        System.out.println(endPage);
        
        int startRow = (currentPage - 1) * boardLimit + 1;
        int endRow = startRow + boardLimit - 1;
        
        Map<String, String> param = new HashMap<>();
        
        param.put("startRow", String.valueOf(startRow));
        param.put("endRow", String.valueOf(endRow));
        param.put("boardLimit", String.valueOf(boardLimit));
		
    	List<Board> list = boardService.selectThumbnailListByBoardNo(param);
    	System.out.println(list);
    
    	return list;
	}
	
	@GetMapping("/restDetailSeller.do")
	public List<Board> detailSeller(@RequestParam String boardWriter,
									@RequestParam int currentPage,
									Model model) {
		
		System.out.println("restController");
		
    	int memberNo = boardService.getInfoOfBoardWriter(boardWriter);
    	int sellerNo = boardService.getSellerNo(memberNo);
		
		int listCount = boardService.selectBoardCount(boardWriter);
		
        int pageLimit = 10;
        
        int boardLimit = 4;
        
        int maxPage = (int)Math.ceil((double)listCount / boardLimit );
        
        int startPage = (currentPage - 1) / pageLimit * pageLimit  + 1;
        
        int endPage = startPage + boardLimit -1;
        
        System.out.println(listCount);
        System.out.println(startPage);
        System.out.println(endPage);
        
        int startRow = (currentPage - 1) * boardLimit + 1;
        int endRow = startRow + boardLimit - 1;
       
        System.out.println(startRow);
        System.out.println(endRow);
        
        Map<String, String> param = new HashMap<>();
        
        param.put("startRow", String.valueOf(startRow));
        param.put("endRow", String.valueOf(endRow));
        param.put("boardLimit", String.valueOf(boardLimit));
        param.put("sellerNo", String.valueOf(sellerNo));
        
        PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
    	
    	List<Board> list = boardService.selectThumbnailListByBoardNo(param);
    	
    	return list;
	}
	
	
	@GetMapping("/reviewRest.do")
	public List reviewRest(
			@RequestParam int boardNo,
			@RequestParam int currentPage,
			@RequestParam int sort) {
		
			int pageLimit=5;
			int boardLimit=5; 
			int listCount;
			int maxPage; 
			int startPage; 
			int endPage; 
			
			List<Object> listForRiview = new ArrayList();
			listForRiview.add(currentPage);
			listForRiview.add(sort);
			//변수설정
    		listCount=reviewService.selectListCount(boardNo); //총개 가져가야함
    		maxPage = (int)Math.ceil((double)listCount / boardLimit);
    		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
    		endPage = startPage + pageLimit - 1;
    		if(endPage > maxPage) {endPage = maxPage;}	
    		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, 
					   maxPage, startPage, endPage);
    		
    		//리뷰 리스트 가져오와
    		List<Map> list= reviewService.list(pi,boardNo,sort);
    		
    		System.out.println(list);
    		//파일 리스트 가져와
    		//리뷰 넘버 최대 최소 다 뽑으셈 
    		ArrayList listNum = new ArrayList();
    		for(int i=0;i<list.size();i++) {
 
    			listNum.add(list.get(i).get("REVIEW_NO"));
    		}
    		//그리고 파일 리스트 조회할때 넘겨!!
    		List<ReviewFile> ReviewFileList= reviewService.fileList(listNum);
    		System.out.println(ReviewFileList);
    		listForRiview.add(list);
			listForRiview.add(ReviewFileList);
			listForRiview.add(startPage);
			listForRiview.add(endPage);
			listForRiview.add(maxPage);
			
			return listForRiview;
	}
	
	
	
}
