package com.kh.panda.member.model.service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.panda.category.model.vo.Category;
import com.kh.panda.member.common.PageInfo;
import com.kh.panda.member.model.dao.MemberDao;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.member.model.vo.Seller;
import com.kh.panda.trade.model.vo.Trade;
import com.kh.panda.zzim.model.vo.Zzim;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;

	@Override
	public int join(Member m) {

		int result = 0;
		
		Member findMem = memberDao.idCheck(m);
		
		if(findMem == null) { // 중복 아이디가 없다면 => 가입 진행
			result = memberDao.join(m);
		} // 성공하면 result == 1
		
		return result;
	}
	
	@Override
	public List<Member> findId(String memberEmail) throws Exception {
		
		return memberDao.findId(memberEmail);
	}

	@Override
	public int findIdCheck(String memberEmail) throws Exception {
		
		return memberDao.findIdCheck(memberEmail);
	}

	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(Member member, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //구글 이용시 smtp.gmail.com
		String hostSMTPid = "sym123456";
		String hostSMTPpwd = "kkung132@";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "sym123456@naver.com";
		String fromName = "재능판다";
		String subject = "";
		String msg = "";

		if(div.equals("findPwd")) {
			subject = "재능판다 임시비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getMemberId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += member.getMemberPwd() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = member.getMemberEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	
	//비밀번호찾기
	@Override
	public void findPwd(HttpServletResponse response, Member member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		Member ck = memberDao.readMember(member.getMemberId());
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(memberDao.check_id(member.getMemberId()) == 0) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!member.getMemberEmail().equals(ck.getMemberEmail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pwd = "";
			for (int i = 0; i < 12; i++) {
				pwd += (char) ((Math.random() * 26) + 97);
			}
			member.setMemberPwd(pwd);
			// 비밀번호 변경
			memberDao.updatePwd(member);
			// 비밀번호 변경 메일 발송
			sendEmail(member, "findPwd");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	
	}
	
	
	// 중복 체크 
		@Override
		public int emailCheck(String memberEmail) throws Exception {
			int result = memberDao.emailCheck(memberEmail);
			return result;
		}
		@Override
		public int idCheck(String memberId) throws Exception {
			int result = memberDao.idCheck(memberId);
			return result;
		}

		@Override
		public int nickCheck(String memberNick) throws Exception {
			int result = memberDao.nickCheck(memberNick);
			return result;
		}

		@Override
		public int phoneCheck(String memberPhone) throws Exception {
			int result = memberDao.phoneCheck(memberPhone);
			return result;
		}
		

	@Override
	public Member login(Member member) {
		
		return memberDao.login(member);
	}

	@Override
	public int findCategory(Map<String, String> catMap) {
		
		return memberDao.findCategory(catMap);
	}

	@Override
	public int teacherAdd(Seller seller) {
		
		return memberDao.teacherAdd(seller);
	}

	@Override
	public int changeEmail(Member member) {
		
		return memberDao.changeEmail(member); 
	}

	@Override
	public List<String> sellerList(int memberNo) {
		
		return memberDao.sellerList(memberNo);
	}

	@Override
	public int fixProfile(Map<Object, Object> map) {
		
		return memberDao.fixProfile(map);
	}

	@Override
	public int exit(int memberNo) {
		
		return memberDao.exit(memberNo);
	}

	@Override
	public int changePhone(Member member) {

		return memberDao.changePhone(member);
	}

	@Override
	public int listCount(int memberNo) {
		
		return memberDao.listCount(memberNo);
	}

	@Override
	public List<Zzim> selectZzim(Map<Object, Object> keyMap) {
		
		return memberDao.selectZzim(keyMap);
	}

	@Override
	public List<Trade> selectTradeList(Map<Object, Object> keyMap) {
		
		return memberDao.selectTradeList(keyMap);
	}

	@Override
	public int listCount1(int memberNo) {
		
		return memberDao.listCount1(memberNo);
	}

	@Override
	public int changePass(Map<Object, Object> map) {
		
		return memberDao.changePass(map);
	}

	@Override
	public int deleteZzim(int zzimNo) {
		
		return memberDao.deleteZzim(zzimNo);
	}

	

}
