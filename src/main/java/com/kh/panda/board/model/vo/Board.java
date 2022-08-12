package com.kh.panda.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Board {
	
	  private int boardNo; // BOARD_NO NUMBER PRIMARY KEY,
	  private int sellerNo; // SELLER_NO NUMBER NOT NULL,
	  private int categoryNo; // CATEGORY_NO NUMBER,
	  private String boardTitle; // BOARD_TITLE VARCHAR2(100) NOT NULL,
	  private String lessonContent; // LESSON_CONTENT VARCHAR2(1000) NOT NULL,
	  private String career; // CAREER VARCHAR2(2000) NOT NULL,
	  private String boardContent; // BOARD_CONTENT VARCHAR2(4000) NOT NULL, 
	  private int count; // COUNT NUMBER DEFAULT 0,
	  private String boardWriter; // BOARD_WRITER ,
	  private String enrollDate; // ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL,
	  private String status; // STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
	  private int cost; // COST NUMBER NOT NULL,
	  private String placeContent;
	  private String stDate; // ST_DATE DATE NOT NULL,
	  private String fnDate; // FN_DATE DATE NOT NULL,
	  
	  private String titleImg; // 별칭 TITLEIMG 파일명
	  private String gradeName;
	  private int gradeNo; 
}
