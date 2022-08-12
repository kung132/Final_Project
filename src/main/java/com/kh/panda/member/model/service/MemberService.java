package com.kh.panda.member.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.kh.panda.category.model.vo.Category;
import com.kh.panda.member.common.PageInfo;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.member.model.vo.Seller;
import com.kh.panda.trade.model.vo.Trade;
import com.kh.panda.zzim.model.vo.Zzim;

public interface MemberService {
	
	// 회원가입기능 메소드 틀
	int join(Member m);
	
	Member login(Member member);
	
	// 아이디 찾기 기능
	public List<Member> findId(String memberEmail)throws Exception;
	public int findIdCheck(String memberEmail)throws Exception;
		
	// 이메일 발송
	public void sendEmail(Member member, String div) throws Exception;
		
	// 비밀번호 찾기
	public void findPwd(HttpServletResponse response, Member member) throws Exception;
	
	// 이메일, 닉네임, 휴대폰 번호 중복 체크
		int emailCheck(String memberEmail) throws Exception;
		int nickCheck(String memberNick) throws Exception;
		int phoneCheck(String memberPhone) throws Exception;
		int idCheck(String memberId) throws Exception;
	
	int findCategory(Map<String, String> catMap);
	
	int teacherAdd(Seller seller);
	
	int changeEmail(Member member);
	
	List<String> sellerList(int memberNo);

	int fixProfile(Map<Object, Object> map);

	int exit(int memberNo);

	int changePhone(Member member);
	
	int listCount(int memberNo);
	int listCount1(int memberNo);
	
	List<Zzim> selectZzim(Map<Object, Object> keyMap);
	
	List<Trade> selectTradeList(Map<Object, Object> keyMap);
	
	int changePass(Map<Object, Object> map);
	
	int deleteZzim(int zzimNo);

}
