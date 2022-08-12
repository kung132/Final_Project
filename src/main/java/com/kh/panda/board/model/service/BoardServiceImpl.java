package com.kh.panda.board.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.panda.attachment.model.vo.Attachment;
import com.kh.panda.board.model.dao.BoardDao;
import com.kh.panda.board.model.vo.Board;
import com.kh.panda.category.model.vo.Category;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.seller.model.vo.Seller;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDao boardDao;

	@Override
	public int selectListCount( Map<String, String> forCount) {
		return boardDao.selectListCount(forCount);
	}

	@Override
	public List<Board> selectThumbnailList(Map<String, String> param) {
		return boardDao.selectThumbnailList(param);
	}

	//@Override
	//public int insertAttachment(Attachment at) {
	//	return boardDao.insertAttachment(at);
	//}
	
	//@Override
	//public int enrollBoard(Board board) {
	//	return boardDao.enrollBoard(board);
	//}

	@Override
	public List<Category> enrollRestCategory(String mainCategory) {
		return boardDao.enrollRestCategory(mainCategory);
	}

	@Override
	public int selectBoardNo(Board selectBoardNo) {
		return boardDao.selectBoardNo(selectBoardNo);
	}
	
	@Override
	public int checkSeller(int memberNo) {
		return boardDao.checkSeller(memberNo);
	}

	@Override
	public List<Seller> getInfo(int memberNo) {
		return boardDao.getInfo(memberNo);
	}

	@Override
	public int increaseCount(int boardNo) {
		return boardDao.increaseCount(boardNo);
	}

	@Override
	public Board detailContent(int boardNo) {
		return boardDao.detailContent(boardNo);
	}

	@Override
	public List<Attachment> detailAttachment(int boardNo) {
		return boardDao.detailAttachment(boardNo);
	}

	@Override
	public Category selectCategory(int boardNo) {
		return boardDao.selectCategory(boardNo);
	}

	@Override
	public List<Category> getAllCategory() {
		return boardDao.getAllCategory();
	}

	@Override
	public int checkCategory(Map<String, String> param) {
		return boardDao.checkCategory(param);
	}

	@Override
	public int saveUpdateBoard(Board board) {
		return boardDao.saveUpdateBoard(board);
	}
	
      
	  @Transactional(rollbackFor = SQLException.class)
	  @Override 
	  public int insertBoard(Board board, ArrayList<Attachment> list){
	  
	  int result1 = boardDao.enrollBoard(board);
	  
	  int result2 = 1;
	  
	  if(list != null) { result2 = boardDao.insertAttachment(list); }
	  
      return (result1*result2);
	 
	  }
	  
	  @Transactional(rollbackFor = SQLException.class)
	  @Override 
	  public int updateBoard(Board board, ArrayList<Attachment> list){
	  
	  int result1 = boardDao.saveUpdateBoard(board);
	  
	  int result2 = 1;
	  
	  if(list != null) { result2 = boardDao.insertNewAttachment(list); }  
		  
      return (result1*result2);
	 
	  }

	@Override
	public int deleteBoard(int boardNo) {
		return boardDao.deleteBoard(boardNo);
	}

	@Override
	public Seller sellerInfo(int sellerNo) {
		return boardDao.sellerInfo(sellerNo);
	}

	@Override
	public int getSellerNo(int memberNo) {
		return boardDao.getSellerNo(memberNo);
	}

	@Override
	public int getInfoOfBoardWriter(String boardWriter) {
		return boardDao.getInfoOfBoardWriter(boardWriter);
	}

	@Override
	public List<Board> selectThumbnailListByBoardNo(Map<String, String> param) {
		return boardDao.selectThumbnailListByBoardNo(param);
	}

	@Override
	public int selectBoardCount(String boardWriter) {
		return boardDao.selectBoardCount(boardWriter);
	}
	  
	  
}