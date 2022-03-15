package kr.co.marking.member.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.marking.member.domain.MemberDTO;
import kr.co.marking.member.service.IMemberService;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/member")
@Log4j
public class RestMemberController {
	
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping(value="/memberEmailCheck", method = RequestMethod.POST) // 이메일 중복체크
    public boolean memberEmailCheck(@RequestBody MemberDTO mDto, Model model) { // 해당 메일에 인증번호 보내고 인증번호를 화면에 반환
       
		log.info("==================== ajax memberEmailCheck controller ====================");
		
    	boolean check = memberService.memberCheck(mDto);
    	
        return check;  //ture 존재 / false 존재안함
    }


	@RequestMapping(value="/memberIdCheck", method = RequestMethod.POST) // 아이디 중복체크
	public boolean memberIdCheck(@RequestBody MemberDTO mDto, Model model) { // 해당 메일에 인증번호 보내고 인증번호를 화면에 반환
		
		log.info("==================== ajax memberIdCheck controller ====================");
		
		boolean check = memberService.memberCheck(mDto);
		
	    return check ;  //ture 존재 / false 존재안함
}
	
	
	
	
}
