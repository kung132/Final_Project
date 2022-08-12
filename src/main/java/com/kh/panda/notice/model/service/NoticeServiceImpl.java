package com.kh.panda.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.admin.model.vo.AdminMember;
import com.kh.panda.notice.model.dao.NoticeDao;
import com.kh.panda.notice.model.vo.Notice;



@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticeDao;

	@Override
	public List<Notice> notice() {
		
		List<Notice> list = noticeDao.notice();

		return list;
		
	}
	@Override
	public List<Notice> notice2() {
		
		List<Notice> list = noticeDao.notice2();

		return list;
		
	}


	@Override
	public int noticeAdd(Notice notice) {

		int result = noticeDao.noticeAdd(notice);

		return result;
	}


	@Override
	public Notice noticeDetail(int noticeNo) {

		Notice notice = noticeDao.noticeDetail(noticeNo);
		return notice;
	}


	@Override
	public int noticeDelete(int noticeNo) {
		
		int result = noticeDao.noticeDelete(noticeNo);
		return result;
	}
	
}
