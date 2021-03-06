package kr.co.marking.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import kr.co.marking.member.domain.MemberDTO;
import kr.co.marking.member.service.IMemberService;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserLoginAuthenticationProvider implements AuthenticationProvider {
	
	@Autowired
	CustomUserDetailsService userDetailsService; //내가 커스터마이징한 클래스
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;       //암호화 시키는 클래스
	
	@Autowired
	private IMemberService memberService;
	
	//인증하는 로직
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		log.info("==================== CustomUserLoginAuthenticationProvider ====================");
		
		String id = authentication.getName();
		String password = (String)authentication.getCredentials();
		
		UserDetails userInfo = userDetailsService.loadUserByUsername(id); //db에서 값 가져오기
		MemberDTO mDto = memberService.selectMemberInfo(id);
		
		
		//계정이 존재하지않음 or 탈퇴한 계정
		if(userInfo == null || "Y".equals(mDto.getMember_withdraw())) { 
			throw new AuthenticationServiceException(id);
		} 
		
		//계정비번이 틀린경우
		else if( !passwordEncoder.matches(password, userInfo.getPassword())){
			System.out.println(!passwordEncoder.matches(password, userInfo.getPassword()));
			System.out.println(password);
			throw new BadCredentialsException(id);
		}
		

		/* 최종 리턴 시킬 새로만든 Authentication 객체 */
		Authentication newAuth = new UsernamePasswordAuthenticationToken(
				userInfo, null, userInfo.getAuthorities());

		return newAuth;
	}

	@Override
	// 위의 authenticate 메소드에서 반환한 객체가 유효한 타입이 맞는지 검사
	// null 값이거나 잘못된 타입을 반환했을 경우 인증 실패로 간주
	public boolean supports(Class<?> authentication) {

		// 스프링 Security가 요구하는 UsernamePasswordAuthenticationToken 타입이 맞는지 확인
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
