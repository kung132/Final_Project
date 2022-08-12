package com.kh.panda.member.common;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FileRenamePolicy {

	public String rename(String originName) {
		
		String sysDate = new SimpleDateFormat("yyyyMMddhhmmss").format(new Date());
		
		int random = (int)(Math.random() * 90000) + 10000;
		
		String etc = originName.substring(originName.lastIndexOf("."));
		
		String changeName = sysDate + random + etc;
		
		return changeName;
	}
}
