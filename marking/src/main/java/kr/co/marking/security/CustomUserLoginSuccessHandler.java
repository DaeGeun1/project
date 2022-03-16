package kr.co.marking.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import kr.co.marking.member.service.IMemberService;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserLoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Autowired
	IMemberService memberService;
	
	
	//로그인 성공시 돌아가는 로직
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
			log.info("==================== CustomUserLoginSuccessHandler ====================");
			
			//성공시 돌아가는 로직 
			
			//회원 접속날짜 갱신
			memberService.accessMember(authentication.getName());
			
				
				
			// 디폴트 URI
			String uri = "/marking.co.kr";

			/* 강제 인터셉트 당했을 경우의 데이터 get */
			RequestCache requestCache = new HttpSessionRequestCache();
			SavedRequest savedRequest = requestCache.getRequest(request, response);
			
			/* 로그인 버튼 눌러 접속했을 경우의 데이터 get */
			String prevPage = (String) request.getSession().getAttribute("prevPage");
			//우리 홈페이지 어디에선가 로그인 버튼을 클릭하여 접속한경우
			if (prevPage != null) {
				request.getSession().removeAttribute("prevPage");
				
				// null이 아니라면 강제 인터셉트 당했다는 것
				if (savedRequest != null) {
					uri = savedRequest.getRedirectUrl();
				}
				// 권한으로 인해 이전페이지로 갈경우 403이 발생함으로 그걸 방지하기위한것  회원가입페이지에서 로그인으로 가는경우 / 
				else if (prevPage.contains("/member/join") || prevPage.contains("/member/find")) {
					uri = request.getContextPath();
				}
				// ""가 아니라면 직접 로그인 페이지로 접속한 것	
				else if (prevPage != null && !prevPage.equals("")) {
					uri = prevPage;
				}
			} 
			
			//전혀 다른곳에서 url을 입력하여 접근한 경우
			else if(prevPage == null) {
				uri = "/gogo.co.kr";
			}

			
			// 세 가지 케이스에 따른 URI 주소로 리다이렉트
			response.sendRedirect(uri);
		}
}
