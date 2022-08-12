package com.kh.panda.member.model.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UploadVo {
	
	private String uploader;
	private List<MultipartFile> upfile;
	
	public boolean isFileExist() {
		if(upfile == null) {
			return false;
		}
		if(upfile.size() < 1) {
			return false;
		}
		if(upfile.get(0).isEmpty()) {
			return false;
		}
		return true;
	}

}
