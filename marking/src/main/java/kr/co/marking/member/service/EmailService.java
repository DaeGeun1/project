package kr.co.marking.member.service;

import kr.co.marking.member.domain.MemberDTO;

public interface EmailService {
	
	public String sendMail(MemberDTO mDto);   // 메일 보내고 retrun은 인증번호
	
	public void sendPasswordMail(MemberDTO mDto); // 메일보내고 return 없음
}
