package com.kh.panda.notice.model.service;

import java.util.List;

import com.kh.panda.notice.model.vo.Notice;

public interface NoticeService {

	List<Notice> notice();
	List<Notice> notice2();

	int noticeAdd(Notice notice);

	Notice noticeDetail(int noticeNo);

	int noticeDelete(int noticeNo);

}
