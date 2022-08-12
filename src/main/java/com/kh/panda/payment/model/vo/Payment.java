package com.kh.panda.payment.model.vo;



public class Payment {
	
	
private String cardNo;				//	CARD_NO VARCHAR2(100) CONSTRAINT CARD_PK PRIMARY KEY,
private int memberNo;					//    MEMBER_NO NUMBER NOT NULL,
private String cardValidate;					//    CARD_VALIDATE VARCHAR2(20) NOT NULL,
private int cardPassword;					//    CARD_PASSWORD NUMBER NOT NULL,
private int cvc;						//    CVC NUMBER NOT NULL,


public Payment() {
	super();

}


public Payment(String cardNo, String cardValidate, int memberNO, int cardPassword, int cvc) {
	super();
	this.cardNo = cardNo;
	this.memberNo = memberNo;
	this.cardValidate = cardValidate;
	this.cardPassword = cardPassword;
	this.cvc = cvc;
}


public String getCardNo() {
	return cardNo;
}


public void setCardNo(String cardNo) {
	this.cardNo = cardNo;
}


public int getMemberNo() {
	return memberNo;
}


public void setMemberNo(int memberNo) {
	this.memberNo = memberNo;
}


public String getCardValidate() {
	return cardValidate;
}


public void setCardValidate(String cardValidate) {
	this.cardValidate = cardValidate;
}


public int getCardPassword() {
	return cardPassword;
}


public void setCardPassword(int cardPassword) {
	this.cardPassword = cardPassword;
}


public int getCvc() {
	return cvc;
}


public void setCvc(int cvc) {
	this.cvc = cvc;
}


@Override
public String toString() {
	return "Payment [cardNo=" + cardNo + ", memberNo=" + memberNo + ", cardValidate=" + cardValidate + ", cardPassword="
			+ cardPassword + ", cvc=" + cvc + "]";
}



}
