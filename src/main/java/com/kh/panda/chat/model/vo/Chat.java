package com.kh.panda.chat.model.vo;

import lombok.Data;

@Data
public class Chat {

	 private int chatId;//CHAT_ID NUMBER NOT NULL PRIMARY KEY,
	 private String fromNick;//FROM_NICK VARCHAR2(24) NOT NULL,
	 private String toNick;//TO_NICK VARCHAR2(24) NOT NULL,
	 private String chatContent; //CHAT_CONTENT VARCHAR2(100) NOT NULL,
	 private String chatTime;// CHAT_TIME DATE DEFAULT SYSDATE,
	 private char chatRead; // CHAT_READ CHAR(1) DEFAULT 'N' CHECK (CHAT_READ IN ('Y', 'N')) NOT NULL,
	 private String chatCount; // CHAT_COUNT VARCHAR(100) DEFAULT NULL,
	 
	
	
}



