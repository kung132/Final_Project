package com.kh.panda.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.panda.admin.model.vo.AdminMember;
import com.kh.panda.board.model.vo.Board;
import com.kh.panda.category.model.vo.Category;
import com.kh.panda.common.model.vo.PageInfo;
import com.kh.panda.seller.model.vo.Seller;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int memberCount() {

		return sqlSession.selectOne("admin.MemberCount");
	}

	@Override
	public int sellerCount() {

		return sqlSession.selectOne("admin.SellerCount");

	}

	@Override
	public int tradeCount() {

		return sqlSession.selectOne("admin.TradeCount");

	}

	@Override
	public List<AdminMember> selectList() {

		return sqlSession.selectList("admin.SelectList");
	}

	@Override
	public AdminMember customerDetail(int memberNo) {

		return sqlSession.selectOne("admin.CustomerDetail", memberNo);
	}

	@Override
	public int approvalUpdate(int memberNo) {

		return sqlSession.update("admin.ApprovalUpdate", memberNo);
	}

	@Override
	public int customerDelete(int memberNo) {

		return sqlSession.update("admin.CustomerDelete", memberNo);

	}

	@Override
	public int tradeToday() {

		return sqlSession.selectOne("admin.tradeToday");
	}

	@Override
	public int tradeWeek() {

		return sqlSession.selectOne("admin.tradeWeek");
	}

	@Override
	public int tradeMonth() {

		return sqlSession.selectOne("admin.tradeMonth");
	}

	@Override
	public int tradeLastWeek() {

		return sqlSession.selectOne("admin.tradeLastWeek");
	}

	@Override
	public int gradeUpdate(List<Integer> list) {

		return sqlSession.update("admin.GradeUpdate", list);
	}

	@Override
	public int selectListCount() {

		return sqlSession.selectOne("admin.SelectListCount");
	}

	@Override
	public List<AdminMember> pageList(PageInfo pi, Map<String, Object> param) {

		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		return sqlSession.selectList("admin.pageList", param);
	}

	@Override
	public Seller sellerList(int memberNo) {

		return sqlSession.selectOne("admin.SellerList", memberNo);
	}

	@Override
	public List<AdminMember> messageMemberList(Map<String, Object> param) {

		return sqlSession.selectList("admin.MessageMemberList", param);
	}

	@Override
	public int messageSend(Map<String, String> param) {

		int result = 0;
		for (int i = 0; i < param.size() - 1; i++) {
			String memberNick = param.get("key" + i);
			String content = param.get("content");
			Map<String, String> send = new HashMap<>();
			send.put("memberNick", memberNick);
			send.put("content", content);
			sqlSession.insert("admin.MessageSend", send);

			result = result + 1;

		}
		return result;

	}

	@Override
	public int refusalDelete(int memberNo) {

		return sqlSession.delete("admin.RefusalDelete", memberNo);
	}

	@Override
	public int newMember() {
		return sqlSession.selectOne("admin.newMember");
	}

	@Override
	public int newBoard() {
		return sqlSession.selectOne("admin.newBoard");
	}

	@Override
	public List<Integer> sellerRank() {
		
		return sqlSession.selectList("admin.sellerRank");
	}

	@Override
	public List<AdminMember> sellerRankB(List<Integer> sellerRank) {
		List<AdminMember> joined = new ArrayList<>();
		for(int i=0; i<sellerRank.size(); i++) {
			int a = sellerRank.get(i);
			List<AdminMember> sellerRankB = sqlSession.selectList("admin.sellerRankB", a);
			joined.addAll(sellerRankB);
		}
		
		return joined;
	}

	@Override
	public List<Integer> boardRank() {
		return sqlSession.selectList("admin.boardRank");
	}

	@Override
	public List<Board> boardRankB(List<Integer> boardRank) {
		List<Board> joined = new ArrayList<>();
		for(int i=0; i<boardRank.size(); i++) {
			int a = boardRank.get(i);
			List<Board> boardRankB = sqlSession.selectList("admin.boardRankB", a);
			joined.addAll(boardRankB);
		}
		
		return joined;
	}

	@Override
	public List<Integer> categoryRank() {
		return sqlSession.selectList("admin.categoryRank");
	}

	@Override
	public List<Category> categoryRankB(List<Integer> categoryRank) {
		List<Category> joined = new ArrayList<>();
		for(int i=0; i<categoryRank.size(); i++) {
			int a = categoryRank.get(i);
			List<Category> categoryRankB = sqlSession.selectList("admin.categoryRankB", a);
			joined.addAll(categoryRankB);
		}
		
		return joined;
	}
	
	

}
