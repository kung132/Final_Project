package com.kh.panda.review.model.vo;
import lombok.Data;

@Data
public class ReviewFile {
	private int imgNo;	//IMG_NO	NUMBER	No		1	
	private int reviewNo;//REVIEW_NO	NUMBER	No		2	
	private String originName;//ORIGIN_NAME	VARCHAR2(255 BYTE)	No		3	
	private String changeName;//CHANGE_NAME	VARCHAR2(255 BYTE)	No		4	
	private String filePath;//FILE_PATH	VARCHAR2(1000 BYTE)	No		5	
	private String status;//STATUS	CHAR(1 BYTE)	Yes	'Y' 	6	
}
