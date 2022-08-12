package com.kh.panda.trade.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Trade {
	
	private int tradeNo;
	private int memberNo;
	private String memberNick;
	private int boardNo;
	private String boardTitle;
	private Date tradeDate;
	private String status;
	private String fnDate;
	private String titleImg;
	

}




