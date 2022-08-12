package com.kh.panda.board.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.panda.attachment.model.vo.Attachment;
import com.kh.panda.board.model.vo.Board;
import com.kh.panda.category.model.vo.Category;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.seller.model.vo.Seller;

public interface BoardService {

	int selectListCount(Map<String, String> forCount);
	
	List<Board> selectThumbnailList(Map<String, String> param);
	
	//int insertAttachment(Attachment at);
	
	List<Seller> getInfo(int memberNo);
	
	//int enrollBoard(Board board);
	
	int selectBoardNo(Board selectBoardNo);
	
	List<Category> enrollRestCategory(String mainCategory);
	
	int checkSeller(int memberNo);

	int increaseCount(int boardNo);

	Board detailContent(int boardNo);

	List<Attachment> detailAttachment(int boardNo);

	Category selectCategory(int boardNo);

	List<Category> getAllCategory();

	int checkCategory(Map<String, String> param);

	int saveUpdateBoard(Board board);

	int insertBoard(Board board, ArrayList<Attachment> list);

	int updateBoard(Board board, ArrayList<Attachment> list);

	int deleteBoard(int boardNo);

	Seller sellerInfo(int sellerNo);

	int getSellerNo(int memberNo);

	int getInfoOfBoardWriter(String boardWriter);

	List<Board> selectThumbnailListByBoardNo(Map<String, String> param);

	int selectBoardCount(String boardWriter);
	
	

}
