package kr.co.marking.member.service.Impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kr.co.marking.member.domain.MemberDTO;
import kr.co.marking.member.service.EmailService;
import kr.co.marking.member.service.IMemberService;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	JavaMailSender mailSender; // root-context.xml에 설정한 bean, 의존성을 주입
	
	@Autowired
	IMemberService memberService;

	// 인증번호 보내는 로직
	@Override
	public String sendMail(MemberDTO mDto) {
		String message = null;
		try {
			// 이메일 객체

			log.info("==================== 메일 서비스 ====================");
			log.info("이메일은요" + mDto.getMember_email());
			MimeMessage msg = mailSender.createMimeMessage();

			// 받는 사람을 설정 (수신자, 받는사람의 이메일 주소 객체를 생성해서 수신자 이메일주소를 담음)
			msg.addRecipient(RecipientType.TO, new InternetAddress(mDto.getMember_email()));

			message = RandomStringUtils.randomAlphanumeric(10).toLowerCase();

			String context = "이메일 인증번호 : " + message;
			/*
			 * createMimeMessage() : MimeMessage객체를 생성시킴 (이것을 이용해서 메시지를 구성한 뒤 메일 발송)
			 * addRecipient() : 메시지의 발신자를 설정 InternetAddress() : 이메일 주소 getReceiveMail() :
			 * 수신자 이메일 주소
			 */

			// 보내는 사람(이메일주소+이름)
			// (발신자, 보내는 사람의 이메일 주소와 이름을 담음)
			// 이메일 발신자
			msg.addFrom(new InternetAddress[] { new InternetAddress("bizpoll4800@gmail.com", "marking") }); // 발신메일주소 및
																											// 이름

			// 이메일 제목 (인코딩을 해야 한글이 깨지지 않음)
			msg.setSubject("marking 회원가입 이메일 인증번호입니다", "utf-8"); // 발신 메일 제목
			// 이메일 본문 (인코딩을 해야 한글이 깨지지 않음)
			msg.setText(context, "utf-8", "html"); // 발신 메일 내용

//            html로 보낼 경우            
//            MimeMessage message = mailSender.createMimeMessage();
//            MimeMessageHelper helper 
//            = new MimeMessageHelper(message, true);
//            helper.setTo("test@host.com");
//            helper.setText("<html><body><img src='cid:identifier1234'></body></html>", true);

			// 이메일 보내기
			mailSender.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return message;
	}

	// 회원정보 찾기에서 비밀번호 찾기 임시비밀번호 전송
	@Override
	public void sendPasswordMail(MemberDTO mDto) {
		try {
			// 이메일 객체

			log.info("==================== 메일 서비스 ====================");
			log.info("이메일은요" + mDto.getMember_email());
			MimeMessage msg = mailSender.createMimeMessage();
			// 받는 사람을 설정 (수신자, 받는사람의 이메일 주소 객체를 생성해서 수신자 이메일주소를 담음)
			msg.addRecipient(RecipientType.TO, new InternetAddress(mDto.getMember_email()));

			
			String newPassword = RandomPassword(); // 임시비밀번호 만드는 로직
			System.out.println("==================== 인증번호 ====================");
			System.out.println(newPassword);
			System.out.println("================================================");
			
			mDto.setMember_password(newPassword);
			
			memberService.updateMemberPassword(mDto);
			
			String context = "임시비밀번호는 " + newPassword + "입니다."
					+ "로그인 후 꼭 비밀번호를 변경해주세요";

			/*
			 * createMimeMessage() : MimeMessage객체를 생성시킴 (이것을 이용해서 메시지를 구성한 뒤 메일 발송)
			 * addRecipient() : 메시지의 발신자를 설정 InternetAddress() : 이메일 주소 getReceiveMail() :
			 * 수신자 이메일 주소
			 */

			// 보내는 사람(이메일주소+이름)
			// (발신자, 보내는 사람의 이메일 주소와 이름을 담음)
			// 이메일 발신자
			msg.addFrom(new InternetAddress[] { new InternetAddress("bizpoll4800@gmail.com", "marking") }); // 발신메일주소 및
																											// 이름

			// 이메일 제목 (인코딩을 해야 한글이 깨지지 않음)
			msg.setSubject("marking에서 임시비밀번호가 발송되었습니다.", "utf-8"); // 발신 메일 제목
			// 이메일 본문 (인코딩을 해야 한글이 깨지지 않음)
			msg.setText(context, "utf-8", "html"); // 발신 메일 내용

//	        html로 보낼 경우            
//	        MimeMessage message = mailSender.createMimeMessage();
//	        MimeMessageHelper helper 
//	        = new MimeMessageHelper(message, true);
//	        helper.setTo("test@host.com");
//	        helper.setText("<html><body><img src='cid:identifier1234'></body></html>", true);

			// 이메일 보내기
			mailSender.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	public String RandomPassword() {   // 임시 비밀번호 만드는 로직  숫자/영어/특수문자(!,@,#,?) 포함하는 10자리
		List<String> list = new ArrayList<>();
		Random random = new Random();
		String newPassword ="";
		
		for (int i = 0; i < 7; i++) {
			list.add(RandomStringUtils.randomAlphanumeric(1).toLowerCase());
		}
		
		list.add(Integer.toString(random.nextInt(10)));
		
		for (int i = 0; i < 2; i++) {
			int j = 0;
			while (true) {

				j = random.nextInt(65);

				if (j == 33 || j == 35 || j == 63 || (j == 64)) {
					break;
				}
			}
			list.add(Character.toString((char) j));
		}
		Collections.shuffle(list);
		
		for (int i = 0; i < list.size(); i++) {
			newPassword += list.get(i);
		}
		
		return newPassword;
	}

}
