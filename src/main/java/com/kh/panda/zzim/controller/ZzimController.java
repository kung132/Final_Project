package com.kh.panda.zzim.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.panda.member.model.vo.Member;
import com.kh.panda.zzim.model.vo.Zzim;

@RestController 

@RequestMapping("/zzim")
public class ZzimController {
		
@Autowired
private SqlSession sqlSession;
	
	
@PostMapping("/zzim1.do")
public int updateZzim(HttpSession session
		,@RequestParam int boardNo){
	
	int memberNo =((Member)session.getAttribute("loginUser")).getMemberNo();
	
	Zzim zzim = new Zzim();
	
	zzim.setMemberNo(memberNo);
	zzim.setBoardNo(boardNo);
	
	
	
	int count = sqlSession.selectOne("zzim.zzimCheck", zzim);
	
	
	
	if(count>0) {
		
		int result2 = sqlSession.delete("zzim.deleteZzim", zzim);
		
	}
	
	else {
		
		int result1 = sqlSession.insert("zzim.insertZzim", zzim);
		
	}
	
	
	return count;
	
}
	
	
@PostMapping("/zzim2.do")
public int countZzim(@RequestParam int boardNo) {
	
	
	int count =  sqlSession.selectOne("zzim.zzimCount", boardNo);
	
	return count;
	
}
	

}
