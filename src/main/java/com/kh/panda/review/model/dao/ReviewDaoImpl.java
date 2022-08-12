package com.kh.panda.review.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.common.model.vo.PageInfo;
import com.kh.panda.review.model.vo.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int enroll(Review r) {
		
		return sqlSession.insert("review.enroll", r);
	}


	@Override
	public int selectListCount(int boardNo) {
		int temp=sqlSession.selectOne("review.selectListCount",boardNo);
		return temp;
	}

	

	@Override
	public List<Map> list(PageInfo pi, int boardNo,int sort) {
		//시작 먼저 
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		
		String howtoSort = "";
		
		switch(sort) {
		case 1:
			 howtoSort="REVIEW_NO DESC"; break;
		case 2:
			 howtoSort="REVIEW_NO"; break;
		case 3:
			 howtoSort="REVIEW_STAR DESC,REVIEW_NO DESC"; break;
		case 4:
			 howtoSort="REVIEW_STAR ASC,REVIEW_NO DESC"; break;
		}
		
		Map<String, Object> param = new HashMap<String,Object>();
		param.put("boardNo",boardNo);
		param.put("startRow",startRow);
		param.put("endRow",endRow);
		param.put("howtoSort",howtoSort);
		
		
		
		return sqlSession.selectList("review.list",param); // 리뷰 내용물들
	}


	@Override
	public double avg(int boardNo) {
		return sqlSession.selectOne("review.avg",boardNo); // 평균점수
	}


	@Override
	public int tradeCom(int memberNo ,int boardNo) {
		
		Map<String, Integer> param = new HashMap<String,Integer>();
		
		param.put("boardNo",boardNo);
		param.put("memberNo",memberNo);
		if (sqlSession.selectList("review.tradeCom",param).isEmpty()) {
			return 0;
		}
		return 1;
	}


	@Override
	public Map<String,String> sellerLoc(int boardNo) {
		List<Object> sellerLoc = sqlSession.selectList("review.sellerLoc",boardNo);
		String sellerGrade = sqlSession.selectOne("review.sellerGrade",boardNo);
		
		Map<String, String> param = new HashMap<String,String>();
		
		param.put("ADDRESS", (String)sellerLoc.get(0));
		param.put("GRADE", sellerGrade);
		
		 
		return param;
	}
}
