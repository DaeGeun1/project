package kr.co.marking.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.marking.member.domain.MemberDTO;
import kr.co.marking.member.service.EmailService;
import kr.co.marking.member.service.IMemberService;
import lombok.extern.log4j.Log4j;

@Controller // 컨트롤러 어노테이션 선언
@Log4j
public class EmailController {

	@Autowired
	EmailService emailService; // 서비스를 호출하기위한 의존성 주입

	@Autowired
	IMemberService memberService;

	@RequestMapping(value = "/send", method = RequestMethod.POST) // 확인 (메일발송) 버튼을 누르면 맵핑되는 메소드
	@ResponseBody
	public String sendMail(@RequestBody MemberDTO mDto, Model model, RedirectAttributes rttr) { // 해당 메일에 인증번호 보내고 인증번호를 화면에 반환
		
		log.info("==================== send POST ====================");
		
		String result = null; // 결과값은 이메일 인증번호

		boolean check = memberService.memberCheck(mDto);

		if (!check) { // 중복된 회원이 없는 경우 메일 전송하고 실행

			try {
				result = emailService.sendMail(mDto); // dto (메일관련 정보)를 sendMail에 저장함
				rttr.addFlashAttribute("successMessage", "해당하는 메일로 인증번호가 전송되었습니다.");

			} catch (Exception e) {
				e.printStackTrace();
				rttr.addFlashAttribute("successMessage", "메일 전송 실패. 오류");
			}

		}

		return result; // 결과값은 이메일 인증번호
	}

	@RequestMapping(value = "/findPassword", method = RequestMethod.POST)
	public String sendPasswordMail(MemberDTO mDto, Model model, RedirectAttributes rttr) { // 해당 메일에 인증번호 보내고 인증번호를 화면에 반환
		
		log.info("==================== findPassword POST ====================");
		
		MemberDTO memberInfo = memberService.findMember(mDto);

		if (memberInfo == null) {
			rttr.addFlashAttribute("failMessage", "일치하는 정보의 계정이 없습니다.");
			return "redirect:/member/find";
		} else {
			try {
				emailService.sendPasswordMail(mDto); // dto (메일관련 정보)를 sendMail에 저장함
				rttr.addFlashAttribute("successMessage", "해당하는 메일로 인증번호가 전송되었습니다.");
				return "redirect:/login";
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return "member/memberFind";

	}

}
