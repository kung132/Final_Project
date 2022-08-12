package com.kh.panda.board.model.dao;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.panda.attachment.model.vo.Attachment;
import com.kh.panda.board.model.vo.Board;
import com.kh.panda.category.model.vo.Category;
import com.kh.panda.common.model.vo.PageInfo;
import com.kh.panda.common.model.vo.UploadVO;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.seller.model.vo.Seller;

public interface BoardDao{
	
	int selectListCount( Map<String, String> forCount);

	List<Board> selectThumbnailList(Map<String, String> param);
	
	int insertAttachment(ArrayList<Attachment> list);
	
	List<Seller> getInfo(int memberNo);
	
	int enrollBoard(Board board);
	
	List<Category> enrollRestCategory(String mainCategory);
	
	int selectBoardNo(Board board);
	
	int checkSeller(int memberNo);

	int increaseCount(int boardNo);

	Board detailContent(int boardNo);

	List<Attachment> detailAttachment(int boardNo);

	Category selectCategory(int boardNo);

	List<Category> getAllCategory();

	int checkCategory(Map<String, String> param);
	
	int updateBoard(ArrayList<Attachment> list);

	int saveUpdateBoard(Board board);

	int deleteBoard(int boardNo);

	Seller sellerInfo(int sellerNo);

	int getSellerNo(int memberNo);

	int getInfoOfBoardWriter(String boardWriter);

	List<Board> selectThumbnailListByBoardNo(Map<String, String> param);

	int selectBoardCount(String boardWriter);

	int insertNewAttachment(ArrayList<Attachment> list);

}