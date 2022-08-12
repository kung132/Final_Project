package com.kh.panda.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.panda.member.common.FileRenamePolicy;
import com.kh.panda.member.common.PageInfo;
import com.kh.panda.member.model.vo.Member;
import com.kh.panda.member.model.vo.Seller;
import com.kh.panda.member.model.vo.UploadVo;
import com.kh.panda.trade.model.vo.Trade;
import com.kh.panda.zzim.model.vo.Zzim;
import com.kh.panda.member.model.service.MemberService;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	// 회원가입 폼
		@GetMapping("/join.do")
		public String join() {
			
			return "member/join";
		}
		
		@PostMapping("/join.do")
		public String join(@ModelAttribute Member m) {
			
			int result = memberService.join(m);
			
			if(result > 0) { // 성공
				return "redirect:joinSuccess.do"; // 성공페이지 이동 시 alert 창으로 띄어지게끔 
			}
			else { // 실패
				return "redirect:join.do?error";
			}
			
		} 
		@GetMapping("/joinSuccess.do")
		public String joinSuccess() {
			return "member/joinSuccess";
		} // 모듈화 작업 필요 X
		
		@GetMapping("/logout.do")
		public String logout(HttpSession session) {
			
			session.removeAttribute("loginUser");
			
			// 로그아웃되었습니다. 알람메세지도 같이 띄우기
			session.setAttribute("alertMsg", "로그아웃 되었습니다.");
			
			return "redirect:/";
		}
		
		// 아이디 찾기
		@GetMapping("/findId.do")
		public String findIdView() throws Exception{
			return"/member/findIdform";
		}
		
		@PostMapping("/findId.do")
		public String findId(Member member,Model model) throws Exception{
			
			if(memberService.findIdCheck(member.getMemberEmail())==0) {
			model.addAttribute("msg", "이메일을 확인해주세요");
			return "/member/findIdform";
			}else {
			model.addAttribute("member", memberService.findId(member.getMemberEmail()));

			return "/member/findId";
			}
			
		}
		
		// 비밀번호 찾기
		@GetMapping(value = "/findPwdForm.do")
		public String findPwdForm() throws Exception{
			return "/member/findPwd";
		}
		
		@PostMapping(value = "/findPwd.do")
		public void findPwd(@ModelAttribute Member member, HttpServletResponse response) throws Exception{
			memberService.findPwd(response, member);
		}

		
		// 중복체크
		
		@ResponseBody
		@PostMapping("/emailCheck.do")
		public int emailCheck(String memberEmail) throws Exception {
			int result = memberService.emailCheck(memberEmail);
			return result;
		}
		
		@ResponseBody
		@PostMapping("/idCheck.do")
		public int idCheck(String memberId) throws Exception {
			int result = memberService.idCheck(memberId);
			return result;
		}
		
		@ResponseBody
		@PostMapping("/nickCheck.do")
		public int nickCheck(String memberNick) throws Exception {
			int result = memberService.nickCheck(memberNick);
			return result;
		}
		
		@ResponseBody
		@PostMapping("/phoneCheck.do")
		public int phoneCheck(String memberPhone) throws Exception {
			int result = memberService.phoneCheck(memberPhone);
			return result;
		}
		
		
		
		
		
	@GetMapping("/mypage.do")
	public String myPage() {
		
		return "member/myPage";
	}
	
	@GetMapping("/login.do")
	public String login() {
		
		return "member/login";
	}
	@PostMapping("/login.do")
	public String login(@ModelAttribute Member member,
						HttpSession session) {
	
		Member loginUser = memberService.login(member);
		
		if(loginUser != null) {
			session.setAttribute("alertMsg", "로그인에 성공하였습니다.");
			session.setAttribute("loginUser", loginUser);
			
			int memberNo = loginUser.getMemberNo();
			
			List<String> sellerList = memberService.sellerList(memberNo);
			
			session.setAttribute("sellerList", sellerList);
		}
		else {
			session.setAttribute("alertMsg", "로그인에 실패하였습니다.");
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/teacherAdd.do")
	public String teacherAdd() {
		
		return "member/teacheradd";
	}
	
	@PostMapping("/teacherAdd.do")
	public String teacherAdd(@RequestParam MultipartFile upfile,
							 @RequestParam String content,
							 @RequestParam String career,
							 @RequestParam String optradio,
							 @RequestParam String categoryName,
							 Model model,
							 HttpSession session) {
		
		Seller seller = new Seller();
		Member member = (Member) session.getAttribute("loginUser");
		String changeName = "";
		
		if(!upfile.isEmpty()) {
			
			MultipartFile file = upfile;
			
			String savePath = session.getServletContext().getRealPath("/resources/upfile/");
			
			changeName = new FileRenamePolicy().rename(file.getOriginalFilename());
			File target = new File(savePath, changeName);
			
			try {
				file.transferTo(target);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		Map<String, String> catMap = new HashMap<String, String>();
		
		catMap.put("optradio", optradio);
		catMap.put("categoryName", categoryName);
		
		int catNo = memberService.findCategory(catMap);
		
		seller.setMemberNo(member.getMemberNo());
		seller.setCategoryNo(catNo);
		seller.setContents(content);
		seller.setFilePath("resources/upfile/" + changeName);
		seller.setCareer(career);
		
		System.out.println(seller);
		
		
		int result = memberService.teacherAdd(seller);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "선생님 신청이 완료되었습니다");
			
			Member loginUser = (Member) session.getAttribute("loginUser");

	        int memberNo = loginUser.getMemberNo();

	        List<String> sellerList = memberService.sellerList(memberNo);

	        session.setAttribute("sellerList", sellerList);
		}
		else {
			session.setAttribute("alertMsg", "선생님 신청이 실패했습니다.");
		}
		
		return "redirect:teacherAdd.do";
		
	}
	

	
	@GetMapping("/changeEmail.do")
	public String changeEmail() {
		return "member/changeEmail";
	}
	
	@PostMapping("/changeEmail.do")
	public String changeEmail(@RequestParam String memberEmail,
							  HttpSession session) {
		Member member = new Member();
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		member.setMemberNo(loginUser.getMemberNo());
		member.setMemberEmail(memberEmail);
		
		int result = memberService.changeEmail(member);
		
		if(result > 0) {
			loginUser.setMemberEmail(memberEmail);
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "이메일 변경에 성공했습니다");
		}
		else {
			session.setAttribute("alertMsg", "이메일 변경에 실패했습니다");
		}
		
		return "redirect:mypage.do";
	}
	
	@GetMapping("/changePass.do")
	public String changePass() {
		return "member/changePass";
	}
	
	@PostMapping("/changePass.do")
	public String changePass(@RequestParam String memberPwd,
							 @RequestParam String memberNewPwd,
								HttpSession session) {
		
		Member member = (Member) session.getAttribute("loginUser");
		
		if(!member.getMemberPwd().equals(memberPwd)) {
			
			session.setAttribute("alertMsg", "현재 비밀번호가 일치하지 않습니다.");
			return "redirect:changePass.do";
		}
		else {
			
			Map<Object, Object> map = new HashMap<>();
			map.put("memberNo", member.getMemberNo());
			map.put("memberNewPwd", memberNewPwd);
			
			int result = memberService.changePass(map);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "비밀번호 변경에 성공했습니다.");
			}
			else {
				session.setAttribute("alertMsg", "비밀번호 변경에 실패했습니다.");
			}
			
			return "redirect:changePass.do";
		}	
	}
	
	@PostMapping("/checkPass.do")
	@ResponseBody
	public int checkPass(@RequestParam String memberNewPwd,
						 @RequestParam String memberNewPwdConfirm) {
		
		if(memberNewPwd.equals(memberNewPwdConfirm)) {
			return 1;
		}
		else {
			return 0;
		}
	}
	
	@GetMapping("/changePhone.do")
	public String changePhone() {
		return "member/changePhone";
	}
	
	@PostMapping("/changePhone.do")
	public String changePhone(@RequestParam String memberPhone,
							  HttpSession session) {
		
		Member member = new Member();
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		member.setMemberNo(loginUser.getMemberNo());
		member.setMemberPhone(memberPhone);
		
		int result = memberService.changePhone(member);
		
		if(result > 0) {
			loginUser.setMemberPhone(memberPhone);
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "전화번호 변경에 성공했습니다");
		}
		else {
			session.setAttribute("alertMsg", "전화번호 변경에 실패했습니다");
		}
		
		return "redirect:mypage.do";
		
	}
	
	@GetMapping("/myProfile.do")
    public String myProFile(HttpSession session) {

        Member loginUser = (Member) session.getAttribute("loginUser");

        int memberNo = loginUser.getMemberNo();

        List<String> sellerList = memberService.sellerList(memberNo);

        session.setAttribute("sellerList", sellerList);

        return "member/myProfile";
    }
	
	@GetMapping("/fixProfile.do")
	public String fixProfile() {
		
		return "member/fixProfile";
	}
	
	@PostMapping("fixProfile.do")
	public String fixProfile(@RequestParam String contents,
							 @RequestParam MultipartFile upfile,
							 HttpSession session) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		List<Map<String, String>> sellerList = (List<Map<String, String>>) session.getAttribute("sellerList");
		
		Map<Object, Object> map = new HashMap<>();
		
		map.put("memberNo", loginUser.getMemberNo());
		map.put("contents", contents);
		
		
		
		if(!upfile.isEmpty()) {
			
			MultipartFile file = upfile;
			
			String savePath = session.getServletContext().getRealPath("/resources/upfile/");
			
			String changeName = new FileRenamePolicy().rename(file.getOriginalFilename());
			File target = new File(savePath, changeName);
			
			map.put("upfilePath", "resources/upfile/" + changeName);
			
			int result = memberService.fixProfile(map);
			
			try {
				file.transferTo(target);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(result > 0) {
				session.setAttribute("alertMsg", "프로필이 변경되었습니다.");
			}
			else {
				session.setAttribute("alertMsg", "프로필이 변경되지 않았습니다.");
			}
			
		}
		else {
			map.put("upfilePath", sellerList.get(0).get("FILE_PATH1"));
			
			int result = memberService.fixProfile(map);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "프로필이 변경되었습니다.");
			}
			else {
				session.setAttribute("alertMsg", "프로필이 변경되지 않았습니다.");
			}
		}
	
		return "redirect:myProfile.do";
	}
	
	@GetMapping("/exit.do")
	public String exit() {
		return "member/exit";
	}
	
	@PostMapping("/exit.do")
	public String exit(@RequestParam String memberPwdExit,
					   HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int memberNo = loginUser.getMemberNo();
		
		if(loginUser.getMemberPwd().equals(memberPwdExit)) {
			
			int result = memberService.exit(memberNo);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "탈퇴가 완료되었습니다.");
				session.invalidate();
				return "redirect:/";
			}
			else {
				session.setAttribute("alertMsg", "탈퇴에 실패했습니다");
				
				return "redirect:mypage.do";
			}
		}
		else {
			session.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다");
			return "redirect:exit.do";
		}
	}
	
	@GetMapping("/zzimlist.do")
	public String zzimList(HttpSession session,
							Model model,
							@RequestParam(value="currentPage", required = false)int currentPage) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int memberNo = (Integer)loginUser.getMemberNo();
		
		int listCount;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = memberService.listCount(memberNo);
		
		
		pageLimit = 10;
		boardLimit = 3;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		int startRow = (currentPage - 1) * boardLimit + 1;
        int endRow = startRow + boardLimit - 1;
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		Map<Object, Object> keyMap = new HashMap<Object, Object>();
		keyMap.put("startRow", String.valueOf(startRow));
		keyMap.put("endRow", String.valueOf(endRow));
		keyMap.put("memberNo", memberNo);
		
		List<Zzim> zList = memberService.selectZzim(keyMap);
		
		System.out.println(zList); //2개찍힘
		model.addAttribute("zList", zList);
		model.addAttribute("pi", pi);
		
		
		return "member/zzim";
	}
	
	@GetMapping("/deleteZzim.do")
	public String deleteZzim(@RequestParam int zzimNo,
							HttpSession session) {
		
		System.out.println(zzimNo);
		
		int result = memberService.deleteZzim(zzimNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "관심이 제거되었습니다.");
		}
		else {
			session.setAttribute("alertMsg", "관심이 제거되지 않았습니다.");
		}
		
		return "redirect:zzimlist.do?currentPage=1";
		
	}
	
	
	
	@GetMapping("/thistory.do")
	public String thistory(HttpSession session,
							Model model,
							@RequestParam(value="currentPage", required = false )int currentPage) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int memberNo = (Integer)loginUser.getMemberNo();
		
		int listCount;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = memberService.listCount1(memberNo);
		
		
		pageLimit = 10;
		boardLimit = 3;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		int startRow = (currentPage - 1) * boardLimit + 1;
        int endRow = startRow + boardLimit - 1;
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		Map<Object, Object> keyMap = new HashMap<Object, Object>();
		keyMap.put("startRow", startRow);
		keyMap.put("endRow", endRow);
		keyMap.put("memberNo", memberNo);
		
		List<Trade> trList = memberService.selectTradeList(keyMap);
		
		model.addAttribute("trList", trList);
		model.addAttribute("pi", pi);
		
		return "member/trhistory";
	}
}
