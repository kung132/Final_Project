package com.kh.panda.review.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.panda.common.model.vo.PageInfo;
import com.kh.panda.review.model.vo.Review;
import com.kh.panda.review.model.vo.ReviewFile;



public interface ReviewService {
	
	//리뷰등록
	int enroll(Review r,ArrayList<ReviewFile> fileList);
	//페이징용 카운트 조회
	int selectListCount(int boardNo);
	//평균별점
	double avg(int boardNo);
	//리뷰리스트
	List<Map> list(PageInfo pi,int boardNo,int sort);
	//리뷰 파일들 조회
	List<ReviewFile> fileList(ArrayList listNum);
	//로그인 회원 구매이력
	int tradeCom(int memberNo,int boardNo);
	Map<String,String> sellerLoc(int boardNo);
	
	
}
