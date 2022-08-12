package com.kh.panda.notice.model.vo;

import lombok.Data;

@Data
public class Notice {

	
	private int noticeNo;
	private String noticeWriter;
	private String noticeType;
	private String noticeTitle;
	private String noticeContent;
	private String noticeEnrolldate;
	private String status;
	
}
