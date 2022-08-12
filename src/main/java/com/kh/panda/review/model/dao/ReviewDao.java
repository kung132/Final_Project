package com.kh.panda.review.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.panda.common.model.vo.PageInfo;
import com.kh.panda.review.model.vo.Review;

public interface ReviewDao {

	//리뷰등록
	int enroll(Review r);
	
	int selectListCount(int boardNo);
	
	double avg(int boardNo);
	
	List<Map> list(PageInfo pi,int boardNo,int sort);
	
	int tradeCom(int memberNo,int boardNo);

	Map<String,String> sellerLoc(int boardNo);
	
}

