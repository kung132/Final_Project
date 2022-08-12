package com.kh.panda.member.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.kh.panda.category.model.vo.Category;
import com.kh.panda.member.common.PageInfo;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.member.model.vo.Seller;
import com.kh.panda.trade.model.vo.Trade;
import com.kh.panda.zzim.model.vo.Zzim;

public interface MemberDao {
	
	// 추상메소드 틀을 정의
	// 아이디 중복 체크 메소드 틀
	Member idCheck(Member m);
		
	public int check_id(String memberId) throws Exception;
		
	// 회원가입 진행 메소드 틀
	int join(Member m);
	
	Member login(Member member);
	
	//회원 정보 조회 - 사용자 ID 해당하는 정보 가져오기
	public Member readMember(String MemberId) throws Exception;
		
	// 아이디 찾기 
	public List<Member> findId(String memberEmail)throws Exception;
	public int findIdCheck(String memberEmail)throws Exception;

	// 비밀번호 찾기
	public int updatePwd(Member member) throws Exception;
	
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
