package kr.co.marking.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import kr.co.marking.member.domain.MemberDTO;
import kr.co.marking.member.mapper.MemberMapper;
import kr.co.marking.security.domain.CustomUser;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;       //암호화 시키는 클래스

	@Override
	public UserDetails loadUserByUsername(String member_id) throws UsernameNotFoundException {
		
		log.info("==================== CustomUserDetailsService ====================");
		log.info("입력받은 아이디 : " + member_id);
		
		CustomUser customUser = new CustomUser();
		
		// user_id means user_id
		MemberDTO mDto = memberMapper.selectMemberInfo(member_id);
		
		if(mDto == null || "Y".equals(mDto.getMember_withdraw())) {
			customUser = null;
		} else {
			
			customUser.setUsername(mDto.getMember_id());
			customUser.setPassword(mDto.getMember_password());
			
			customUser.setAuthorities(memberMapper.selectMemberAuthorities(member_id));
			
		}
		
		return customUser;
	}
	
}
