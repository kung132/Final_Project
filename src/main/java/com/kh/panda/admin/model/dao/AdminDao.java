package com.kh.panda.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.panda.admin.model.vo.AdminMember;
import com.kh.panda.board.model.vo.Board;
import com.kh.panda.category.model.vo.Category;
import com.kh.panda.common.model.vo.PageInfo;
import com.kh.panda.seller.model.vo.Seller;

public interface AdminDao {
	
	int memberCount();

	int sellerCount();

	int tradeCount();

	List<AdminMember> selectList();

	AdminMember customerDetail(int memberNo);

	int approvalUpdate(int memberNo);

	int customerDelete(int memberNo);

	int tradeToday();

	int tradeWeek();

	int tradeMonth();

	int tradeLastWeek();

	int gradeUpdate(List<Integer> list);

	int selectListCount();

	List<AdminMember> pageList(PageInfo pi, Map<String, Object> param);

	Seller sellerList(int memberNo);

	List<AdminMember> messageMemberList(Map<String, Object> param);


	int messageSend(Map<String, String> param);

	int refusalDelete(int memberNo);

	int newMember();

	int newBoard();

	List<Integer> sellerRank();

	List<AdminMember> sellerRankB(List<Integer> sellerRank);

	List<Integer> boardRank();

	List<Board> boardRankB(List<Integer> boardRank);

	List<Integer> categoryRank();

	List<Category> categoryRankB(List<Integer> categoryRank);

	

	
	

	

}
