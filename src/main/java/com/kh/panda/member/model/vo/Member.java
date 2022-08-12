package com.kh.panda.member.model.vo;

import lombok.Data;

@Data
public class Member {
	
	private int memberNo; //	   MEMBER_NO NUMBER CONSTRAINT MEMBER_PK PRIMARY KEY NOT NULL,
	private String memberId; //     MEMBER_ID VARCHAR2(100) NOT NULL UNIQUE,
	private String memberPwd; //     MEMBER_PWD VARCHAR2(100) NOT NULL, 
	private String memberName; //     MEMBER_NAME VARCHAR2(100) NOT NULL,
	private String memberNick; //     MEMBER_NICK VARCHAR2(100) NOT NULL,
	private String memberDate; //     MEMBER_DATE DATE DEFAULT SYSDATE NOT NULL,
	private String memberPhone; //     MEMBER_PHONE VARCHAR2(12) NOT NULL,
	private String memberEmail; //     MEMBER_EMAIL VARCHAR2(100) NOT NULL UNIQUE,
	private String address; //     ADDRESS VARCHAR2(100) NOT NULL,
	private String detailAddress; //     DETAIL_ADDRESS VARCHAR2(100) NOT NULL,
	private String status; //     STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N'))
	private String gradeName;
	private String filePath;
	private String contents;
	private String career;
	private String categoryName;

}
