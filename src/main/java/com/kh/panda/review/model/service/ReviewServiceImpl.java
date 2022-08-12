package com.kh.panda.review.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.common.model.vo.PageInfo;
import com.kh.panda.review.model.dao.ReviewDao;
import com.kh.panda.review.model.dao.ReviewFileDao;
import com.kh.panda.review.model.vo.Review;
import com.kh.panda.review.model.vo.ReviewFile;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private ReviewFileDao reviewFileDao;
	

	@Override
	public int enroll(Review r, ArrayList<ReviewFile> f) {
		int result=0;
		if(f.isEmpty()) {
			
			return reviewDao.enroll(r);
		}
		//파일 첨부 했을땐 리턴 2 or 3
		result+= reviewDao.enroll(r);
		if(result >0){
			result+= reviewFileDao.enroll(f);
			return result;
		}
		//리뷰등록 실패시
		else {
			return -1;
		}
		
	}

	@Override
	public int selectListCount(int boardNo) {
		return reviewDao.selectListCount(boardNo);
	}


	@Override
	public List<Map> list(PageInfo pi, int boardNo,int sort) {
		return reviewDao.list(pi, boardNo,sort);
	}

	@Override
	public double avg(int boardNo) {
		return reviewDao.avg(boardNo);
	}

	@Override
	public List<ReviewFile> fileList(ArrayList listNum) {
		return reviewFileDao.fileList(listNum);
	}

	@Override
	public int tradeCom(int memberNo,int boardNo) {
		return reviewDao.tradeCom( memberNo, boardNo);
	}

	@Override
	public Map<String,String> sellerLoc(int boardNo) {

		return reviewDao.sellerLoc(boardNo);
	}

	


	

}
