package com.kh.panda.member.model.vo;

import org.springframework.web.multipart.MultipartFile;

import com.kh.panda.category.model.vo.Category;

import lombok.Data;

@Data
public class Seller {
	private int sellerNo;	//	 	SELLER_NO NUMBER CONSTRAINT SELLER_PK PRIMARY KEY NOT NULL, 
	private int gradeNo;	//		GRADE_NO NUMBER NOT NULL, 
	private int memberNo;	//		MEMBER_NO NUMBER NOT NULL, 
	private int categoryNo;	//	    CATEGORY_NO NUMBER NOT NULL, 
	private String contents;//		CONTENTS VARCHAR2(200) NOT NULL, 
	private String enrollDate;	//		ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL, 
	private String acceptDate;	//		ACCEPT_DATE DATE, 
	private String filePath;	//		FILE_PATH1 VARCHAR2(2000) NOT NULL, 
	private String career;	//		CAREER VARCHAR2(200) NOT NULL, 
	private String status;	//		STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')) NOT NULL,
}
