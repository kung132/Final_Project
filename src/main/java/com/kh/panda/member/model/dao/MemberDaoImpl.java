package com.kh.panda.member.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.category.model.vo.Category;
import com.kh.panda.member.common.PageInfo;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.member.model.vo.Seller;
import com.kh.panda.trade.model.vo.Trade;
import com.kh.panda.zzim.model.vo.Zzim;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	// 아이디 중복체크
	@Override
	public Member idCheck(Member m) {
		return sqlSession.selectOne("member.idCheck", m.getMemberId());
	}
	public int check_id(String memberId) throws Exception{
		return sqlSession.selectOne("member.check_id", memberId);
	}
		
	// 회원가입 진행 => INSERT
	@Override
	public int join(Member m) {
		return sqlSession.insert("member.join", m);
	}

	@Override
	public Member login(Member member) {
		
		return sqlSession.selectOne("member.loginMember", member);
	}
	
	//회원 정보 조회-사용자 ID 해당하는 정보 가져오기
	@Override
	public Member readMember(String memberId) throws Exception {
		//테스트(컨트롤러) 호출 -> 정보를 저장 -> DB로이동
		Member member = sqlSession.selectOne("member.readMember", memberId);
		return member;
	}
			
	// 아이디 찾기 => SELECT
	@Override
	public List<Member> findId(String memberEmail) throws Exception {
			
		return sqlSession.selectList("member.findId", memberEmail);
	}

	@Override
	public int findIdCheck(String memberEmail) throws Exception {
			
		return sqlSession.selectOne("member.findIdCheck", memberEmail);
	}
		
	//비밀번호변경
	@Override
	public int updatePwd(Member member) throws Exception {
			
		return sqlSession.update("member.updatePwd", member);
	}
	
	// 중복체크 들
		@Override
		public int emailCheck(String memberEmail) throws Exception {
			return sqlSession.selectOne("member.emailCheck", memberEmail);
		}
		@Override
		public int idCheck(String memberId) throws Exception {
			return sqlSession.selectOne("member.idCheck1", memberId);
		}
		@Override
		public int nickCheck(String memberNick) throws Exception {
			return sqlSession.selectOne("member.nickCheck", memberNick);
		}
		@Override
		public int phoneCheck(String memberPhone) throws Exception {
			return sqlSession.selectOne("member.phoneCheck", memberPhone);
		}
		

	@Override
	public int findCategory(Map<String, String> catMap) {

		return sqlSession.selectOne("category.findCategory", catMap);
	}

	@Override
	public int teacherAdd(Seller seller) {
		
		return sqlSession.insert("member.teacherAdd", seller);
	}

	@Override
	public int changeEmail(Member member) {
		
		return sqlSession.update("member.changeEmail", member);
	}

	@Override
	public List<String> sellerList(int memberNo) {
		
		return sqlSession.selectList("member.sellerList", memberNo);
	}

	@Override
	public int fixProfile(Map<Object, Object> map) {
		
		return sqlSession.update("member.fixProfile", map);
	}

	@Override
	public int exit(int memberNo) {
		
		return sqlSession.update("member.exit", memberNo);
	}

	@Override
	public int changePhone(Member member) {
		
		return sqlSession.update("member.changePhone", member);
	}

	@Override
	public int listCount(int memberNo) {

		return sqlSession.selectOne("member.listCount", memberNo);
	}

	@Override
	public List<Zzim> selectZzim(Map<Object, Object> keyMap) {
		
		return sqlSession.selectList("member.selectZzim", keyMap);
	}

	@Override
	public List<Trade> selectTradeList(Map<Object, Object> keyMap) {
		
		return sqlSession.selectList("member.selectTradeList", keyMap);
	}

	@Override
	public int listCount1(int memberNo) {
		
		return sqlSession.selectOne("member.listCount1", memberNo);
	}

	@Override
	public int changePass(Map<Object, Object> map) {
		
		return sqlSession.update("member.changePass", map);
	}

	@Override
	public int deleteZzim(int zzimNo) {
		
		return sqlSession.update("member.deleteZzim", zzimNo);
	}

	

}
