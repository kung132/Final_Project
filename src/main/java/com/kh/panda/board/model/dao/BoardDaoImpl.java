package com.kh.panda.board.model.dao;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.panda.attachment.model.vo.Attachment;
import com.kh.panda.board.model.vo.Board;
import com.kh.panda.category.model.vo.Category;
import com.kh.panda.common.model.vo.PageInfo;
import com.kh.panda.common.model.vo.UploadVO;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.seller.model.vo.Seller;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectListCount( Map<String, String> forCount) {
		return sqlSession.selectOne("board.selectListCount", forCount);
	}
	
	@Override
	public List<Board> selectThumbnailList(Map<String, String> param) {
		return sqlSession.selectList("board.selectThumbnailList", param);
	}
	
	@Override
	public int insertAttachment(ArrayList<Attachment> list) {
		int result = 0;
		
		for(Attachment at : list) {
			
			result = sqlSession.insert("board.insertAttachment", at);
		}
				
		return result;
	}
	
	
	@Override
	public int enrollBoard(Board board){
		return sqlSession.insert("board.enrollBoard", board);
	}

	@Override
	public List<Category> enrollRestCategory(String mainCategory) {
		System.out.println("mainCategory:");
		System.out.println(mainCategory);
		return sqlSession.selectList("board.selectCategory", mainCategory);
	}

	@Override
	public int selectBoardNo(Board board) {
		return sqlSession.selectOne("board.selectBoardNo", board);
	}

	@Override
	public int checkSeller(int memberNo) {
		return sqlSession.selectOne("board.checkSeller", memberNo);
	}

	@Override
	public List<Seller> getInfo(int memberNo) {
		return sqlSession.selectList("board.getInfo", memberNo);
	}

	@Override
	public int increaseCount(int boardNo) {
		return sqlSession.update("board.increaseCount", boardNo);
	}

	@Override
	public Board detailContent(int boardNo) {
		return sqlSession.selectOne("board.selectDetailView", boardNo);
	}

	@Override
	public List<Attachment> detailAttachment(int boardNo) {
		return sqlSession.selectList("board.detailAttachment", boardNo);
	}
	
	// 입력되어있는 카테고리 가져오기
	@Override
	public Category selectCategory(int boardNo) {
		return sqlSession.selectOne("board.selectedCategory", boardNo);
	}

	@Override
	public List<Category> getAllCategory() {
		return sqlSession.selectList("board.getAllCategory");
	}

	@Override
	public int checkCategory(Map<String, String> param) {
		return sqlSession.selectOne("board.checkCategory", param);
	}
	
	@Override
	public int saveUpdateBoard(Board board) {
		
		return sqlSession.update("board.saveUpdateBoard", board);
	}
	
	@Override
	public int updateBoard(ArrayList<Attachment> list) {
	
		int result2 = 1;
		for(Attachment at : list) {
			result2 = sqlSession.insert("board.saveUpdateAttachment",at);
		 }
		return result2;
	}

	@Override
	public int deleteBoard(int boardNo) {
		return sqlSession.update("board.deleteBoard", boardNo);
	}

	@Override
	public Seller sellerInfo(int sellerNo) {
		return sqlSession.selectOne("board.sellerInfo", sellerNo);
	}

	@Override
	public int getSellerNo(int memberNo) {
		return sqlSession.selectOne("board.getSellerNo", memberNo);
	}

	@Override
	public int getInfoOfBoardWriter(String boardWriter) {
		return sqlSession.selectOne("board.getMemberNO", boardWriter);
	}

	@Override
	public List<Board> selectThumbnailListByBoardNo(Map<String, String> param) {
		return sqlSession.selectList("board.selectThumbnailListByBoardNo", param);
	}

	@Override
	public int selectBoardCount(String boardWriter) {
		return sqlSession.selectOne("board.selectBoardCount", boardWriter);
	}

	@Override
	public int insertNewAttachment(ArrayList<Attachment> list) {
		int result2 = 1;
		for(Attachment at : list) {
			result2 = sqlSession.insert("board.insertNewAttachment",at);
		 }
		return result2;
	}
	
}