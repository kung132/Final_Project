package com.kh.panda.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PageInfo {
	
	// 7가지 변수들을 필드로 정의
	private int listCount; // 현재 일반게시판의 게시글 총 갯수 => BOARD 로 부터 조회 COUNT(*) 활용 (STATUS ='Y')
	private int currentPage; // 현재 페이지 (즉, 사용자가 요청한 페이지) => request.getParameter("currentPage");
	private int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대 갯수 => 10개로 고정
	private int boardLimit; // 한 페이지에 보여질 게시글의 최대 갯수 => 10개로 고정
	
	private int maxPage; // 가장 마지막 페이지가 몇번 페이지인지 (== 총 페이지의 갯수) 
	private int startPage; // 페이지 하단에 보여질 페이징바의 시작 수
	private int endPage; // 페이지 하단에 보여질 페이징바의 끝 수
	
	
}
