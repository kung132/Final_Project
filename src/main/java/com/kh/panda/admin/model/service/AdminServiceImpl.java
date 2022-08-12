package com.kh.panda.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.admin.model.dao.AdminDao;
import com.kh.panda.admin.model.vo.AdminMember;
import com.kh.panda.board.model.vo.Board;
import com.kh.panda.category.model.vo.Category;
import com.kh.panda.common.model.vo.PageInfo;
import com.kh.panda.seller.model.vo.Seller;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;

	@Override
	public int memberCount() {

		int memberCount = adminDao.memberCount();

		return memberCount;
	}

	@Override
	public int sellerCount() {
		int sellerCount = adminDao.sellerCount();

		return sellerCount;
	}

	@Override
	public int tradeCount() {
		int tradeCount = adminDao.tradeCount();

		return tradeCount;
	}

	@Override
	public List<AdminMember> selectList() {

		List<AdminMember> list = adminDao.selectList();

		return list;
	}

	

	@Override
	public AdminMember customerDetail(int memberNo) {

		AdminMember member = adminDao.customerDetail(memberNo);

		return member;
	}

	@Override
	public int approvalUpdate(int memberNo) {

		int result = adminDao.approvalUpdate(memberNo);

		return result;
	}

	@Override
	public int customerDelete(int memberNo) {
		int result = adminDao.customerDelete(memberNo);

		return result;
	}

	@Override
	public int tradeToday() {

		int tradeToday = adminDao.tradeToday();

		return tradeToday;
		
	}

	@Override
	public int tradeWeek() {
		int tradeWeek = adminDao.tradeWeek();

		return tradeWeek;
	}

	@Override
	public int tradeMonth() {
		int tradeMonth = adminDao.tradeMonth();

		return tradeMonth;
	}

	@Override
	public int tradeLastWeek() {
		int tradeLastWeek = adminDao.tradeLastWeek();

		return tradeLastWeek;
	}

	@Override
	public int gradeUpdate(List<Integer> list) {
		
		int result = adminDao.gradeUpdate(list);

		return result;
	}

	@Override
	public int selectListCount() {

		int result = adminDao.selectListCount();

		return result;
	}

	@Override
	public List<AdminMember> pageList(PageInfo pi, Map<String, Object> param) {
		
		List<AdminMember> result = adminDao.pageList(pi, param);

		return result;
	}

	@Override
	public Seller sellerList(int memberNo) {
		
		Seller seller = adminDao.sellerList(memberNo);

		return seller;
	}

	@Override
	public List<AdminMember> messageMemberList(Map<String, Object> param) {


		List<AdminMember> memberList = adminDao.messageMemberList(param);

		return memberList;
	}

	@Override
	public int messageSend(Map<String, String> param) {

		int result = adminDao.messageSend(param);
		
		return result;
	}

	@Override
	public int refusalDelete(int memberNo) {
		
		int result = adminDao.refusalDelete(memberNo);

		return result;
	}

	@Override
	public int newMember() {


		int newMember = adminDao.newMember();

		return newMember;
	}

	@Override
	public int newBoard() {

		int newBoard = adminDao.newBoard();

		return newBoard;
	}

	@Override
	public List<Integer> sellerRank() {
		List<Integer>  sellerRank = adminDao.sellerRank();

		return sellerRank;
	}

	@Override
	public List<AdminMember> sellerRankB(List<Integer> sellerRank) {
		List<AdminMember>  sellerRankB = adminDao.sellerRankB(sellerRank);

		return sellerRankB;
	}

	@Override
	public List<Integer> boardRank() {
		List<Integer>  boardRank = adminDao.boardRank();

		return boardRank;
	}

	@Override
	public List<Board> boardRankB(List<Integer> boardRank) {
		List<Board>  boardRankB = adminDao.boardRankB(boardRank);
		return boardRankB;
	}

	@Override
	public List<Integer> categoryRank() {
		
		List<Integer>  categoryRank = adminDao.categoryRank();

		return categoryRank;
	}

	@Override
	public List<Category> categoryRankB(List<Integer> categoryRank) {
		List<Category>  categoryRankB = adminDao.categoryRankB(categoryRank);
		return categoryRankB;
	}

	

	

	

	
	

	
	

	

}
