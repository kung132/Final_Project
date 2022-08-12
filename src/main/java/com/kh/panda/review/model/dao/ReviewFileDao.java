package com.kh.panda.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import com.kh.panda.review.model.vo.ReviewFile;

public interface ReviewFileDao {
	int enroll(ArrayList<ReviewFile> fileList);
	List<ReviewFile> fileList(ArrayList listNum);
}
