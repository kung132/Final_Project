package com.kh.panda.notice.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.panda.notice.model.vo.Notice;


public interface NoticeDao {

	List<Notice> notice();
	List<Notice> notice2();

	int noticeAdd(Notice notice);

	Notice noticeDetail(int noticeNo);

	int noticeDelete(int noticeNo);

}
