package com.kh.panda.review.model.vo;

import java.util.List;

import lombok.Data;

@Data
public class Review {
	private int reviewNo;//REVIEW_NO	NUMBER
	private int boardNo;	//BOARD_NO	NUMBER
	private int memberNo;//MEMBER_NO	NUMBER
	private int reviewStar;//REVEIW_STAR	NUMBER
	private String reviewTitle;	//REVEIW_TITLE	VARCHAR2(200 BYTE)
	private String reviewContent;	//REVEIW_CONTENT	VARCHAR2(500 BYTE)
	private String status;	//STATUS	CHAR(1 BYTE)
	
}
