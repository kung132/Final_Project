package com.kh.panda.faq.model.vo;

import lombok.Data;

@Data
public class FAQ {

	private int noticeNo;
	private String noticeWriter;
	private String noticeType;
	private String noticeTitle;
	private String noticeContent;
	private String noticeEnrolldate;
	private String status;
	
	private String keyword;
	
}
