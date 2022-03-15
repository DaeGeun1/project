package kr.co.marking.security.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.ToString;


/* Spring Security 로그인을 위한 UserDetails VO 객체 */
@ToString
public class CustomUser implements UserDetails {
	
	
	//안쓰면 뭔가 에러남
	private static final long serialVersionUID = 1L;

	
	private String username; // ID
	private String password; // PW
	private List<GrantedAuthority> authorities;
	 
	// setter
	public void setUsername(String username) {
		this.username = username;
	}

	// setter
	public void setPassword(String password) {
		this.password = password;
	}

	// setter
	public void setAuthorities(List<String> authList) {

		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		for (int i = 0; i < authList.size(); i++) {
			authorities.add(new SimpleGrantedAuthority(authList.get(i)));
		}

		this.authorities = authorities;
	}
	
	// 권한
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		return authorities;
	}

	@Override
	public String getPassword() {
		
		return password;
	}

	@Override
	public String getUsername() {

		return username;
	}
	
	
	// 계정 만료되었는치 체크
	@Override
	public boolean isAccountNonExpired() {
		
		return true;
	}
	
	// 계정이 잠겨있는지
	@Override
	public boolean isAccountNonLocked() {

		return true;
	}
	
	// 패스워드가 만료되었는지
	@Override
	public boolean isCredentialsNonExpired() {

		return true;
	}
	
	//계정이 활정화 되어있는지
	@Override
	public boolean isEnabled() {

		return true;
	}
	
	
}
