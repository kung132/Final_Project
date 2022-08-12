package com.kh.panda.attachment.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Attachment {
	  
	  private int fileNo; // FILE_NO NUMBER PRIMARY KEY,
	  private int boardNo; // BOARD_NO NUMBER NOT NULL,
	  private String originName; // ORIGIN_NAME VARCHAR2(255) NOT NULL,
	  private String changeName; // CHANGE_NAME VARCHAR2(255) NOT NULL,
	  private String filePath; // FILE_PATH VARCHAR2(1000),
	  private long fileSize; // FILE_SIZE NUMBER NOT NULL,
	  private String fileType;// FILE_TYPE  VARCHAR2(20) NOT NULL,
	  private Date uploadDate; // UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
	  private int fileLevel;
	  private String status;//  STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
	
}

