package com.kh.panda.review.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.review.model.vo.ReviewFile;

@Repository
public class ReviewFileDaoImpl implements ReviewFileDao {
	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public int enroll(ArrayList<ReviewFile> fileList) {
		int result=0;
		for(ReviewFile f : fileList) {
			result+= sqlSession.insert("reviewFile.enroll", f);
		}
		return result;
	}



	@Override
	public List<ReviewFile> fileList(ArrayList listNum) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("listNum", listNum);
		return sqlSession.selectList("reviewFile.fileList",param);
	}

}
