package com.kh.panda.board.controller;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.panda.attachment.model.vo.Attachment;
import com.kh.panda.board.model.service.BoardService;
import com.kh.panda.board.model.vo.Board;
import com.kh.panda.category.model.vo.Category;
import com.kh.panda.common.model.vo.MyFileRenamePolicy;
import com.kh.panda.common.model.vo.PageInfo;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.review.model.service.ReviewService;
import com.kh.panda.review.model.vo.Review;
import com.kh.panda.review.model.vo.ReviewFile;
import com.kh.panda.seller.model.vo.Seller;
@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;
    @Autowired
    private ReviewService reviewService;
    
    @GetMapping("/categoryBoard.do")
    public String selectList(@RequestParam(required = false) String mainCategory,
                             @RequestParam(required = false) String categoryName,
                             @RequestParam int currentPage,
                             @ModelAttribute PageInfo pageInfo,
                             @RequestParam(required = false, defaultValue = "BOARD_NO") String col,
                             @RequestParam(required = false, defaultValue = "ASC") String order,
                             @RequestParam(required = false) String type, 
                             @RequestParam(required = false) String keyword, 
                             HttpSession session,
                             Model model) {
        
        int listCount; // 현재 일반게시판의 게시글 총 갯수 => BOARD 로 부터 조회 COUNT(*) 활용 (STATUS ='Y')
        // int currentPage; // 현재 페이지 (즉, 사용자가 요청한 페이지) 
        int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대 갯수 => 10개로 고정
        int boardLimit; // 한 페이지에 보여질 게시글의 최대 갯수 
        
        int maxPage; // 가장 마지막 페이지가 몇번 페이지인지 (== 총 페이지의 갯수) 
        int startPage; // 페이지 하단에 보여질 페이징바의 시작 수
        int endPage; // 페이지 하단에 보여질 페이징바의 끝 수
        
        // * listCount : 총 게시글 갯수 
    
        
        Map<String, String> forCount = new HashMap<>();
        forCount.put("mainCategory", mainCategory);
        forCount.put("categoryName", categoryName);
        
        listCount = boardService.selectListCount(forCount);
        
        // * pageLimit : 페이징바의 페이지 최대 갯수
        pageLimit = 10;
        
        // * boardLimit : 한 페이지에 보여질 게시글의 최대 갯수
        boardLimit = 9;
        
        maxPage = (int)Math.ceil((double)listCount / boardLimit );
        
        startPage = (currentPage - 1) / pageLimit * pageLimit  + 1;
        
        endPage = startPage + boardLimit -1;
        
        if(endPage > maxPage) { 
            endPage = maxPage;
        }
        
        int startRow = (currentPage - 1) * boardLimit + 1;
        int endRow = startRow + boardLimit - 1;
        
        PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
        Map<String, String> param = new HashMap<>();
        
        param.put("categoryName", categoryName);
        param.put("type", type);
        param.put("keyword", keyword);
        param.put("col", col);
        param.put("order", order);
        param.put("mainCategory", mainCategory);
        param.put("startRow", String.valueOf(startRow));
        param.put("endRow", String.valueOf(endRow));
        param.put("boardLimit", String.valueOf(boardLimit));
        List<Board> list = boardService.selectThumbnailList(param);
        
        if(((Member)session.getAttribute("loginUser")) == null) {
             // 로그인 안된 상태
                   model.addAttribute("list", list);
                   model.addAttribute("pi", pi);
                   model.addAttribute("mainCategory", mainCategory);
                   model.addAttribute("categoryName", categoryName);
                   model.addAttribute("currentPage", currentPage);
         }
           else {
                  // 셀러가 맞을때
                 // 판매자인지 아닌지 여부도 같이 model 에 실어서 보내보자
                // 쿼리문 조회해서 model.addAttribute();로
                int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
                int result = boardService.checkSeller(memberNo);
               
                model.addAttribute("list", list);
                model.addAttribute("pi", pi);
                model.addAttribute("mainCategory", mainCategory);
                model.addAttribute("categoryName", categoryName);
                model.addAttribute("currentPage", currentPage);
                model.addAttribute("result", result);
         }
        	
        return "/board/categoryBoard";
    }
    
    @GetMapping("/enrollBoard.do")
    public String enrollBoard(HttpSession session,
                            Model model) {
        
        int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
        List<Seller> list = boardService.getInfo(memberNo);
        
        model.addAttribute("list", list);
        return "board/enrollBoard";
    }
    
    @PostMapping("/enrollBoard.do")
	public String enrollBoard(
			@ModelAttribute Board boardEnroll,
			@RequestParam String mainCategoryJsp,
			@RequestParam String categoryName,
			@RequestParam List<MultipartFile> upfiles,
			Model model,
			HttpSession session) {
		
		/*
		for(MultipartFile file : upfiles) {
			System.out.println(file.isEmpty());
			System.out.println(file.getOriginalFilename());
			System.out.println("---------");
		}
		*/

		String boardWriter = ((Member)session.getAttribute("loginUser")).getMemberNick();
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		int sellerNo = boardService.getSellerNo(memberNo);
		
		Seller seller = boardService.sellerInfo(sellerNo);
	
		boardEnroll.setBoardWriter(boardWriter);	
		boardEnroll.setSellerNo(sellerNo);
		
		Map<String, String> param = new HashMap<>();
		param.put("mainCategory", String.valueOf(mainCategoryJsp));
		param.put("categoryName", String.valueOf(categoryName));
		int categoryNo = boardService.checkCategory(param);
		
		boardEnroll.setCategoryNo(categoryNo);
		
			ArrayList<Attachment> list = new ArrayList<>();
		
			//if(result > 0) {} // 그 보드에 추가한게 성공이라면 사진을 넣겠다.
			String savePath = session.getServletContext().getRealPath("/resources/upfiles/");
			
				if(upfiles != null && !upfiles.get(0).isEmpty()) { // 첨부사진이 있다면
				 // 사진갯수만큼 반복을 돌려서 한번 반복때마다 추가하겠다.(사진을 다운로드 받고 그담에  Attachment 테이블에 삽입) 
					
					int count = 0;
					
					for(int i = 0; i < 4; i ++) { 
						
						if(!upfiles.get(i).isEmpty()) {

							Attachment at = new Attachment();
							//at.setBoardNo(bdNo);
							
							if(count == 0) { // 첫번째 사진일경우
								// 썸네일 
								count++;
								at.setFileLevel(1);
							}
							else { // 첫번째 사진이 아닐경우
								at.setFileLevel(2);
							}
							
							at.setOriginName(upfiles.get(i).getOriginalFilename());
							String changeName = new MyFileRenamePolicy().rename(upfiles.get(i).getOriginalFilename());
							at.setChangeName(changeName);
							at.setFilePath("resources/upfiles/");
							at.setFileType(upfiles.get(i).getContentType());
							
							File target = new File(savePath, changeName);
							
							try {
								upfiles.get(i).transferTo(target);
							} catch (IllegalStateException | IOException e) {
								e.printStackTrace();
							}
							
							list.add(at);
						}
						else {
							
							Attachment at = new Attachment();
							at.setFileLevel(2);
							at.setOriginName("");
							at.setChangeName("");
							at.setFilePath("resources/upfiles/");
							at.setFileType("");
							
							list.add(at);
						}
					}
				}
				
				System.out.println(list);
	            int result = boardService.insertBoard(boardEnroll,list);
	            
	            if(result>0) {
	            	
	            	int boardNo = boardService.selectBoardNo(boardEnroll);
	            	
	            	Board board = new Board();
	            	board = boardService.detailContent(boardNo);
	            	            
		            List<Attachment> attachment = boardService.detailAttachment(boardNo);
		            
		            Category category = boardService.selectCategory(boardNo);
		            System.out.println(category);
		            
		            // 수하물 붙이기
		            model.addAttribute("board", board);
		            model.addAttribute("attachment", attachment);
		            model.addAttribute("category", category);
		            model.addAttribute("boardNo",boardNo);
		
	                return "redirect:/board/detailView.do";
	            }
	            
	            else 
	            { return "redirect:/"; }  
	        
	    }
	 @GetMapping("/detailView.do")
	    public String detailView(@RequestParam int boardNo,
	    		@RequestParam(defaultValue="1") int currentPage,
				@RequestParam(defaultValue="1") int sort,
	                       HttpSession session,
	                             Model model) {
	       
	        int result = boardService.increaseCount(boardNo);
	        
	        if(result > 0) {
	            Board board = boardService.detailContent(boardNo);
	            
	            List<Attachment> attachment = boardService.detailAttachment(boardNo);
	            
	            Category category = boardService.selectCategory(boardNo);
	            System.out.println(category);
	            
	            int sellerNo = board.getSellerNo();
	            
	            Seller seller = boardService.sellerInfo(sellerNo);
	            
	            // 수하물 붙이기
	            model.addAttribute("board", board);
	            model.addAttribute("seller", seller);
	            model.addAttribute("attachment", attachment);
	            model.addAttribute("category", category);
	            
	            
	            int pageLimit=5;
				int boardLimit=5; 
				int listCount;
				int maxPage; 
				int startPage; 
				int endPage; 
				
	       
	            //내꺼 
	            //후기 버튼 처리 
	            if(session.getAttribute("loginUser") != null){
	    			int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
	    			int tradeCom=reviewService.tradeCom(memberNo,boardNo);
	    			model.addAttribute("tradeCom",tradeCom);
	    		}
	    		else {model.addAttribute("tradeCom",0);}
	            
	            //판매자 위치
	            
	            Map<String,String> sellerLoc = reviewService.sellerLoc(boardNo);
	           
	        	model.addAttribute("sellerLoc", sellerLoc);
	        	  
	        	
	            //리뷰 개수
	            listCount=reviewService.selectListCount(boardNo);
	            maxPage = (int)Math.ceil((double)listCount / boardLimit);
	    		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
	    		endPage = startPage + pageLimit - 1;
	    		
	    		if(endPage > maxPage) {endPage = maxPage;}	
	    	
	            //리뷰없을때
	            if(listCount==0) {
	            	model.addAttribute("listCount",0);
	            	model.addAttribute("avg",0);
	            	return "board/detailBoard";
	            }
	            model.addAttribute("listCount",listCount);
	            //평균 가져와
	    		double avg=reviewService.avg(boardNo);
	    		model.addAttribute("avg",Math.round(avg*100) / 100.0);
	    		//etc
	    		model.addAttribute("currentPage",currentPage);
	    		model.addAttribute("sort",sort);
	    		model.addAttribute("maxPage",maxPage);
	    		model.addAttribute("startPage",startPage);
	    		model.addAttribute("endPage",endPage);
	            
	            
	          
	    		
	    		
	            // 응답뷰 지정
	            return "board/detailBoard";
	        } else {
	            return "redirect:categoryBoard.do";
	        }
	    }
    
    @GetMapping("/updateBoard.do")
    public String updateBoard(@RequestParam int boardNo,
                              Model model) {
        
        Board board = boardService.detailContent(boardNo);
        List<Attachment> attachment = boardService.detailAttachment(boardNo); 
        Category category = boardService.selectCategory(boardNo);
       
      
        model.addAttribute("board", board);
        model.addAttribute("attachment", attachment);
        model.addAttribute("category", category);
        
        return "board/updateBoard";
    }
    
    @PostMapping("/saveUpdateBoard.do")
    public String saveUpdateBoard(@ModelAttribute Board boardSave,
    		@RequestParam List<MultipartFile> newFileName,
            @RequestParam int boardNo,
            @RequestParam String mainCategoryJsp,
            @RequestParam String categoryName,
            @RequestParam List<MultipartFile> reupfiles,
            HttpSession session,
            Model model) {
        
    	for(MultipartFile f : newFileName) {
    		System.out.println(f.getOriginalFilename());
    	}
    	
        Map<String, String> param = new HashMap<>();
        param.put("mainCategory", String.valueOf(mainCategoryJsp));
        param.put("categoryName", String.valueOf(categoryName));
        int categoryNo = boardService.checkCategory(param);
        
		String boardWriter = ((Member)session.getAttribute("loginUser")).getMemberNick();
		int memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		int sellerNo = boardService.getSellerNo(memberNo);
		
		Seller seller = boardService.sellerInfo(sellerNo);
	
		boardSave.setBoardWriter(boardWriter);	
		boardSave.setSellerNo(sellerNo);
		
		boardSave.setCategoryNo(categoryNo);
        
        boardSave.setCategoryNo(categoryNo);

		// 원래 있던 파일들 
        List<Attachment> beforeAttachment = boardService.detailAttachment(boardNo); // 기존의 첨부파일 리스트를 일단 먼저 불러오고

        //int resultDelete = boardService.deleteAttachment(boardNo);
        //System.out.println(resultDelete);
        
        ArrayList<Attachment> list1 = new ArrayList<>();
        ArrayList<Attachment> list = new ArrayList<>();
        String savePath = session.getServletContext().getRealPath("/resources/upfiles/");
		System.out.println(beforeAttachment);

		// 반복용
		int index = 0;

    	// 새롭게 추가된 파일들
    	for(MultipartFile m : reupfiles) {
    		
    		Attachment at = new Attachment();
    		
    		// 사진갯수만큼 반복을 돌려서 한번 반복때마다 추가하겠다.(사진을 다운로드 받고 그담에  Attachment 테이블에 삽입) 
    		if(m.getSize() == 0) {
    			System.out.println("----- 원래파일 -----");
    			
    			list1.add(beforeAttachment.get(index++));
    		}
    		else {
        		at.setBoardNo(boardNo);
                at.setOriginName(m.getOriginalFilename());
                String changeName = new MyFileRenamePolicy().rename(m.getOriginalFilename());
                at.setChangeName(changeName);
                at.setFilePath("resources/upfiles/");
                at.setFileType(m.getContentType());
                
                File target = new File(savePath, changeName);
				
				try {
					m.transferTo(target);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
                
                System.out.println("----- 새파일 -----");
                System.out.println(at);
                list.add(at);
    		}
    	}
    	
    	// 얘 기준으로 업데이트 ㄲㄲㄱ
    	System.out.println("최종 파일 넣을것!");
    	for(Attachment a : list) {
    		System.out.println("---------------");
    		System.out.println(a);
    	}
    	
    	int result = boardService.updateBoard(boardSave, list);
            
		if(result>0) {
        	Board board = new Board();
        	board = boardService.detailContent(boardNo);
        	            
            List<Attachment> attachment = boardService.detailAttachment(boardNo);
            
            Category category = boardService.selectCategory(boardNo);
            System.out.println(category);
            
            // 수하물 붙이기
            model.addAttribute("board", board);
            model.addAttribute("attachment", attachment);
            model.addAttribute("category", category);

            return "board/detailBoard";
        } else { 
        	return "redirect:/"; 
    	}
}
    
    @GetMapping("deleteBoard.do")
	public String deleteBoard(@RequestParam int boardNo,
							  @RequestParam String mainCategory,
							  @RequestParam String categoryName,
							  HttpSession session,
							  Model model) {
		
		Category category = boardService.selectCategory(boardNo);
		int result = boardService.deleteBoard(boardNo);
		
		
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글이 삭제 되었습니다.");
			model.addAttribute("category", category);
			return "redirect:/"; 
		} else {
			session.setAttribute("alertMsg", "게시글 삭제가 실패했습니다.");
			return "redirect:/"; 
		}
	}
	
  //리뷰 등록창 띄우기
  		@GetMapping("enroll.do")
  		public String enroll(
  				@RequestParam(required = false) int boardNo,
  				@RequestParam(required = false) int memberNo,
  				@RequestParam(required = false) String boardTitle,
  				 Model model
  				) {
  			    model.addAttribute("boardNo", boardNo);
  			    model.addAttribute("memberNo", memberNo);
  			    model.addAttribute("boardTitle", boardTitle);
  			
  			return "review/enroll";
  		}
  		
  		//리뷰 등록 
  		@PostMapping("/enroll.do")
  		public String enroll(
  				@ModelAttribute Review r,
  				@RequestParam(required = false) MultipartFile upfile1,
  				@RequestParam (required = false) MultipartFile upfile2,
  				 Model model,
  				HttpSession session) {
  		
  			//파일 객체 담을 어레이 리스트
  			ArrayList<ReviewFile> fileList = new ArrayList<ReviewFile>();
  		
  			//1번파일 vo가공
  			if(!upfile1.isEmpty()) {
  				//원본이름
  				ReviewFile f=new ReviewFile();
  				f.setReviewNo(r.getReviewNo());
  				f.setOriginName(upfile1.getOriginalFilename());
  				//저장될 이름
  				String changeName = new MyFileRenamePolicy().rename(upfile1.getOriginalFilename());
  				f.setChangeName(changeName);
  				// 실제 파일이 저장될 물리적 저장경로 설정
  				String filePath = session.getServletContext().getRealPath("/resources/reviewFiles/");
  				// DB에 FILEPATH 컬럼에 보관할 파일경로
  				f.setFilePath("resources/reviewFiles/");
  				File target =new File(filePath,changeName);
  				try {
  					upfile1.transferTo(target);
  				}catch(IllegalStateException | IOException e) {
  				e.printStackTrace();
  				}
  				fileList.add(f);
  			}
  			
  			//2번파일 vo가공
  			if(!upfile2.isEmpty()) {
  				//원본이름
  				ReviewFile f=new ReviewFile();
  				f.setReviewNo(r.getReviewNo());
  				f.setOriginName(upfile2.getOriginalFilename());
  				//저장될 이름
  				String changeName = new MyFileRenamePolicy().rename(upfile2.getOriginalFilename());
  				f.setChangeName(changeName);
  				//저장경로 설정
  				String filePath = session.getServletContext().getRealPath("/resources/reviewFiles/");
  				f.setFilePath("resources/reviewFiles/");
  				File target =new File(filePath,changeName);
  				try {
  					upfile2.transferTo(target);
  				}catch(IllegalStateException | IOException e) {
  					e.printStackTrace();
  				}
  				fileList.add(f);
  			}
  		
  			int result = reviewService.enroll(r,fileList);
  			model.addAttribute("boardNo", r.getBoardNo());
  			switch(result){
  			case 1:
  			case 2:
  			case 3:
  				session.setAttribute("alertMsg", "후기가 성공적으로 등록되었습니다.");
  				return "redirect:/board/detailView.do"; 
  			default:
  				session.setAttribute("alertMsg", "후기 등록 실패...잠시후 다시 시도해 주세요");
  				return "redirect:/board/detailView.do"; // union.do 로 리다이렉트
  			}
  		
  		}
		
		
		 @GetMapping("sellerDetail.do")
		    public String sellerDetail(@RequestParam String boardWriter,
		    						   @RequestParam int currentPage,
		    						   Model model) {
		      	
		    	int memberNo = boardService.getInfoOfBoardWriter(boardWriter);
		    	int sellerNo = boardService.getSellerNo(memberNo);
		    	Seller seller = boardService.sellerInfo(sellerNo);
		    	System.out.println(seller);
		    	
		    	int listCount; // 현재 일반게시판의 게시글 총 갯수 => BOARD 로 부터 조회 COUNT(*) 활용 (STATUS ='Y')
		        int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대 갯수 => 10개로 고정
		        int boardLimit; // 한 페이지에 보여질 게시글의 최대 갯수 
		        
		        int maxPage; // 가장 마지막 페이지가 몇번 페이지인지 (== 총 페이지의 갯수) 
		        int startPage; // 페이지 하단에 보여질 페이징바의 시작 수
		        int endPage; // 페이지 하단에 보여질 페이징바의 끝 수
		        
		        // * listCount : 총 게시글 갯수 
		        listCount = boardService.selectBoardCount(boardWriter);
		        System.out.println(listCount);
		        // * pageLimit : 페이징바의 페이지 최대 갯수
		        pageLimit = 10;
		        
		        // * boardLimit : 한 페이지에 보여질 게시글의 최대 갯수
		        boardLimit = 4;
		        
		        maxPage = (int)Math.ceil((double)listCount / boardLimit );
		        
		        startPage = (currentPage - 1) / pageLimit * pageLimit  + 1;
		        
		        endPage = startPage + boardLimit -1;
		        
		        if(endPage > maxPage) { 
		            endPage = maxPage;
		        }
		        
		        int startRow = (currentPage - 1) * boardLimit + 1;
		        int endRow = startRow + boardLimit - 1;
		        
		        PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		        System.out.println(pi);
		        
		        Map<String, String> param = new HashMap<>();
		        
		        param.put("startRow", String.valueOf(startRow));
		        param.put("endRow", String.valueOf(endRow));
		        param.put("boardLimit", String.valueOf(boardLimit));
		        param.put("sellerNo", String.valueOf(sellerNo));
		    	
		    	List<Board> list = boardService.selectThumbnailListByBoardNo(param);
		    	System.out.println(list);
		    	
		    	model.addAttribute("pi", pi);
		    	model.addAttribute("list", list);
		        model.addAttribute("currentPage", currentPage);
		    	model.addAttribute("boardWriter", boardWriter);
		    	model.addAttribute("seller", seller);
		    	System.out.println("최종");
		    	System.out.println(pi);
		    	System.out.println(list);
		    	System.out.println(currentPage);
		    	System.out.println(seller);
		    	
		    	return "board/sellerDetail";
		    	
		    }
		
		
		
		
		
		
}
    
	