package kr.co.marking.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.co.marking.member.domain.MemberDTO;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUser extends User {
	
	
	
	private static final long serialVersionUID = 1L;
	
	private MemberDTO mDto;
	
	
	public CustomUser(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	}
	
	public CustomUser(MemberDTO mDto) {
		
		super(mDto.getMember_id(), mDto.getMember_password(), mDto.getAuthList().stream()
			 .map(auth -> new SimpleGrantedAuthority(auth.getMember_authority())).collect(Collectors.toList()));
		
		this.mDto = mDto;
	}
	
	
	
	
}