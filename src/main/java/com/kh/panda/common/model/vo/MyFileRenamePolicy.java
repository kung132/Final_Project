package com.kh.panda.common.model.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MyFileRenamePolicy {
	
	public String rename(String originName) {
		
		// 파일 업로드 시간
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 5자리 랜덤값
		int ranNum = (int)(Math.random() * 90000) * 10000;
		
		// 원본 파일 확장자명
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		return changeName;
		
	}
}
