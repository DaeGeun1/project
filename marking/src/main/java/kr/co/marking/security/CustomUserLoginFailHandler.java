package kr.co.marking.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.ui.Model;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserLoginFailHandler implements AuthenticationFailureHandler {

	// 로그인 실패시 작동
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		log.info("==================== CustomUserLoginFailHandler ====================");
		String error = null;
		//계정이 존재하지 않는 경우
		if (exception instanceof AuthenticationServiceException) {
			error = "1";
		} 
		// 계정 비밀번호가 틀린경우
		else if (exception instanceof BadCredentialsException) {
			error = "2";
		}
		/*
		 * else if(exception instanceof LockedException) {
		 * request.setAttribute("loginFailMsg", "잠긴 계정입니다..");
		 * 
		 * } else if(exception instanceof DisabledException) {
		 * request.setAttribute("loginFailMsg", "비활성화된 계정입니다..");
		 * 
		 * } else if(exception instanceof CredentialsExpiredException) {
		 * request.setAttribute("loginFailMsg", "비밀번호가 만료되었습니다."); }
		 */
			
		String page = "/marking.co.kr/login?error=" + error;
		response.sendRedirect(page);
			 

	}

}
