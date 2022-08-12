package com.kh.panda.common.model.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class UploadVO {
	
	private MultipartFile upfile1;
	private MultipartFile upfile2;
	private MultipartFile upfile3;
	private MultipartFile upfile4;
	
	private List<MultipartFile> upfiles;	
	
	public UploadVO() {
		super();
	}

	public UploadVO(MultipartFile upfile1, MultipartFile upfile2, MultipartFile upfile3, MultipartFile upfile4) {
		super();
		this.upfile1 = upfile1;
		this.upfile2 = upfile2;
		this.upfile3 = upfile3;
		this.upfile4 = upfile4;
	}

	public UploadVO(MultipartFile upfile1, MultipartFile upfile2, MultipartFile upfile3, MultipartFile upfile4,
			List<MultipartFile> upfiles) {
		super();
		this.upfile1 = upfile1;
		this.upfile2 = upfile2;
		this.upfile3 = upfile3;
		this.upfile4 = upfile4;
		this.upfiles = upfiles;
	}

	public MultipartFile getUpfile1() {
		return upfile1;
	}

	public void setUpfile1(MultipartFile upfile1) {
		this.upfile1 = upfile1;
	}

	public MultipartFile getUpfile2() {
		return upfile2;
	}

	public void setUpfile2(MultipartFile upfile2) {
		this.upfile2 = upfile2;
	}

	public MultipartFile getUpfile3() {
		return upfile3;
	}

	public void setUpfile3(MultipartFile upfile3) {
		this.upfile3 = upfile3;
	}

	public MultipartFile getUpfile4() {
		return upfile4;
	}

	public void setUpfile4(MultipartFile upfile4) {
		this.upfile4 = upfile4;
	}

	public List<MultipartFile> getUpfiles() {
		return upfiles;
	}

	public void setUpfiles(List<MultipartFile> upfiles) {
		this.upfiles = upfiles;
	}
	
	public void setUpfiles() {
		this.upfiles = new ArrayList<>();
		
		this.upfiles.add(upfile1);
		this.upfiles.add(upfile2);
		this.upfiles.add(upfile3);
		this.upfiles.add(upfile4);
	}

	@Override
	public String toString() {
		return "UploadVO [upfile1=" + upfile1 + ", upfile2=" + upfile2 + ", upfile3=" + upfile3 + ", upfile4=" + upfile4
				+ ", upfiles=" + upfiles + "]";
	}



	public boolean isFileExist() {
		
		// upfiles 기준으로
		// => 일단 list 가 널인지 아닌지
		// => list 의 크기 비교
		// => 0번째 파일이 비어있는지 아닌지
		
		// 파일이 없는 경우의 수를 나열 => 각각 return false;
		if(upfile1 == null) { // upfile 이 아예 null 일때
			return false;
		}
		
		if(upfile1.getSize() < 1) { // upfile 객체가 있지만 size 가 0 일 경우
			return false;
		}
		
		if(upfile1.isEmpty()) { // upfile 객체의 0번째 인덱스의 파일이 비어있는 경우
			return false;
		}
		
		// 나머지의 경우는 무조건 파일이 있음!
		return true;
	}
}
