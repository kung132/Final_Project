package com.kh.panda.zzim.model.vo;

import lombok.Data;

@Data

public class Zzim {
	
	private int zzimNo;//ZZIM_NO	  NUMBER		CONSTRAINT ZZIM_PK PRIMARY KEY,
	private int memberNo;//MEMBER_NO	NUMBER		NOT NULL,
	private int boardNo;//BOARD_NO	NUMBER		NOT NULL,
	private String boardTitle;
	private String memberNick;
	private String stDate;
	private String fnDate;
	private int cost;
	private String titleImg;
	
}
