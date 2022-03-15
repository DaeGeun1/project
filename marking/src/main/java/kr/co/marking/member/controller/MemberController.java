package kr.co.marking.member.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.marking.member.domain.MemberDTO;
import kr.co.marking.member.service.IMemberService;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;       //암호화 시키는 클래스
	
	@Autowired
	private IMemberService memberService;
	
	//회원등록페이지 이동
	@PreAuthorize("isAnonymous()")
	@GetMapping("/join")
	public String memberJoinGet() {
		
		log.info("==================== memberJoin GET ====================");
		
		return "/member/memberJoin";
	}
	
	//회원등록 기능
	@PreAuthorize("isAnonymous()")
	@PostMapping("/join")
	public String memberJoinPost(@ModelAttribute MemberDTO mDto, RedirectAttributes rttr) throws Exception {
		
		log.info("==================== memberJoin POST ====================");
		
		rttr.addFlashAttribute("successMessage" , mDto.getMember_name() + "님 회원가입을 축하드립니다.");
		
		memberService.insertMember(mDto);
		
    	return "redirect:/";
		
	}
	
	//회원정보 체크창 이동  회원정보 수정하기전 
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/check")
	public String memberCheckGet(Principal principal, Model model) {
		
		log.info("==================== memberCheck GET ====================");
		
		MemberDTO mDto = memberService.selectMemberInfo(principal.getName());
		
		model.addAttribute("memberInfo", mDto);
		
		return "/member/memberCheck";
	}
	
	//회원정보 체크 기능
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/check")
	public String memberCheckPost(MemberDTO mDto, Model model, RedirectAttributes rttr) {

		log.info("==================== memberCheck POST ====================");
		
		if(!("".equals(mDto.getMember_password()))) {
			
			MemberDTO memberInfo = memberService.selectMemberInfo(mDto.getMember_id());
			
			if (passwordEncoder.matches(mDto.getMember_password(),memberInfo.getMember_password())) {
				
				return "redirect:/member/modify";
				
			} else {
				
				rttr.addFlashAttribute("failMessage", "비밀번호가 틀렸습니다.");
				
				return "redirect:/marking.co.kr/member/check";
			}
		} else {
			rttr.addFlashAttribute("failMessage", "비밀번호를 작성해주세요.");
			return "redirect:/member/check";
		}
		
		
		
	}
	
	//회원정보 수정창 이동
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/modify")
	public String memberModifyGet(Principal principal, Model model) {
		
		log.info("==================== memberModify GET ====================");
		
		MemberDTO mDto = memberService.selectMemberInfo(principal.getName());
		
		model.addAttribute("memberInfo", mDto);
		
		return "/member/memberModify";
	}
	
	//회원정보 수정 기능
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/modify")
	public String memberModifyPost(MemberDTO mDto, Model model ,RedirectAttributes rttr) {
		
		log.info("==================== memberModify POST ====================");
		
		MemberDTO memberInfo = memberService.selectMemberInfo(mDto.getMember_id());
		
		if (passwordEncoder.matches(mDto.getMember_password(),memberInfo.getMember_password())) {   // 이부분이 db의 암호화 값과 화면에서 날라오는 비밀번호 값 매칭하는 곳
			
			boolean result = memberService.updateMemberInfo(mDto);
			if(result) { //정보수정 성공
				rttr.addFlashAttribute("successMessage" , "회원정보가 수정되었습니다.");
				return "redirect:/member/modify";
			} else {     // 정보수정 실패
				rttr.addFlashAttribute("failMessage" , "에러입니다. 잡아주세요.");
				return "redirect:/member/modify";
			}
		
		} else {
			System.out.println("비번불일치");
			rttr.addFlashAttribute("failMessage" , "비밀번호가 일치하지않습니다.");
			return "redirect:/member/modify";
		}
		
	}
	
	//회원비밀번호 수정창 이동
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/modifyPassword")
	public String memberModifyPasswordGet(Principal principal, Model model) {
		
		log.info("==================== memberModifyPassword GET ====================");
		
		MemberDTO mDto = memberService.selectMemberInfo(principal.getName());
		
		model.addAttribute("memberInfo", mDto);
		
		return "/member/memberModifyPassword";
	}
	
	//회원비밀번호 수정기능
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/modifyPassword")
	public String memberModifyPasswordPost(MemberDTO mDto, String new_password, String new_password_check, Model model, RedirectAttributes rttr) {
		
		log.info("==================== memberModifyPassword POST ====================");
		
		
		MemberDTO memberInfo = memberService.selectMemberInfo(mDto.getMember_id());
		
		if (passwordEncoder.matches(mDto.getMember_password(),memberInfo.getMember_password())) {
			
			mDto.setMember_password(new_password);   //새로운 비번으로 셋팅
			
			boolean result = memberService.updateMemberPassword(mDto);  // 비번 변경 쿼리문
			
			if(result) { //정보수정 성공
				rttr.addFlashAttribute("successMessage" , "비밀번호가 수정되었습니다.");
				return "redirect:/member/modify";
			} else {     // 정보수정 실패
				rttr.addFlashAttribute("failMessage" , "에러입니다. 잡아주세요.");
				return "redirect:/member/modifyPassword";
			}
		
		} else {
			rttr.addFlashAttribute("failMessage" , "비밀번호가 일치하지않습니다.");
			return "redirect:/member/modifyPassword";
		}
		
	}
	
	//회원탈퇴 기능
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@PostMapping("/delete")
	public String memberDeletePost(MemberDTO mDto, Model model, HttpSession session, RedirectAttributes rttr) {
		
		log.info("==================== memberDelete POST ====================");
		
		MemberDTO memberInfo = memberService.selectMemberInfo(mDto.getMember_id());
		
		if (passwordEncoder.matches(mDto.getMember_password(),memberInfo.getMember_password())) {
			
			boolean result = memberService.deleteMember(mDto.getMember_id());
			
			if(result) { //회원탈퇴 성공 성공
				
				session.invalidate();
				
				return "redirect:/";
				
			} else {     // 정보수정 실패
				
				rttr.addFlashAttribute("failMessage" , "에러입니다. 잡아주세요.");
				
				return "redirect:/member/modify";
				
			}
		
		} else {
			
			rttr.addFlashAttribute("failMessage" , "비밀번호가 일치하지않습니다.");
			
			return "redirect:/member/modify";
			
		}
	}
	
	@PreAuthorize("isAnonymous()")
	@GetMapping("/find")
	public String memberFindGet() {
		
		log.info("==================== memberFind GET ====================");
		
		return "/member/memberFind";
	}
	
	@PreAuthorize("isAnonymous()")
	@PostMapping("/findId")
	public String memberFindIdPost(MemberDTO mDto, RedirectAttributes rttr) {
		
		log.info("==================== memberFindId POST ====================");
		
		MemberDTO memberInfo = memberService.findMember(mDto);
		
		if (memberInfo == null) {
			
			rttr.addFlashAttribute("failMessage" , "해당하는 계정이 없습니다.");
			
			return "redirect:/member/find";
			
		} else {
			
			rttr.addFlashAttribute("successMessage" , "해당되는 계정의 아이디는 " + memberInfo.getMember_id() + "입니다.");
			
			return "redirect:/member/find";
			
		}
		
	}
	
	
}
