package kr.co.marking.controller;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.marking.member.domain.MemberDTO;
import kr.co.marking.member.service.IMemberService;
import kr.co.marking.product.domain.ProductDTO;
import kr.co.marking.product.service.IProductService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	
	
	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private IProductService productService;
	
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

	@RequestMapping("/")
	public String indexGET(Principal principal, Model model) {
		
		
		log.info("==================== indexGET ====================");
		List<ProductDTO> bestProductList = productService.selectBestProductList();  //베스트상품 4개 정보
		
		List<ProductDTO> newProductList = productService.selectNewtProductList();   //신상품 4개 정보
		
		List<ProductDTO> saleProductList = productService.selectSaleProductList();  //세일상품 4개 정보
		
		MemberDTO memberInfo = null;
		
		if(principal != null) { //로그인시 회원정보
			memberInfo = memberService.selectMemberInfo(principal.getName());  //로그인시 회원정보
		}
		
		model.addAttribute("bestProductList", bestProductList); 
		System.out.println(bestProductList);
		model.addAttribute("newProductList", newProductList); 
		
		model.addAttribute("saleProductList", saleProductList); 
		
		model.addAttribute("memberInfo", memberInfo);
		

		return "common/index";
	}
	@PreAuthorize("isAnonymous()")
	@GetMapping("/login")
	public String loginGET(HttpServletRequest request, String error, RedirectAttributes rttr, Model model) {

		log.info("==================== Controller loginGET ====================");
		
		log.info(error);
		
		if ("1".equals(error)) {
			rttr.addFlashAttribute("failMessage" , "해당되는 계정이 없습니다.");
			model.addAttribute("failMessage" , "해당되는 계정이 없습니다.");
		} else if ("2".equals(error)) {
			rttr.addFlashAttribute("failMessage" , "비밀번호가 틀립니다.");
			model.addAttribute("failMessage" , "비밀번호가 틀립니다.");
		}
		
		//마음에 안드는뎅.....
		
		
		
		// 요청 시점의 사용자 URI 정보를 Session의 Attribute에 담아서 전달(잘 지워줘야 함)
		// 로그인이 틀려서 다시 하면 요청 시점의 URI가 로그인 페이지가 되므로 조건문 설정
		String uri = request.getHeader("Referer");
		if (!uri.contains("/marking.co.kr/login")) {
			request.getSession().setAttribute("prevPage", request.getHeader("Referer"));
		}

		return "/common/login";
	}
	
	@PreAuthorize("isAnonymous()")
	@PostMapping("/login")
	public String loginPost(Principal principal ) {
		
		log.info("==================== Controller loginPOST ====================");
		
		return "/common/login";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/logout")
	public String logoutGET() {

		log.info("==================== Controller logoutGET ====================");

		return "redirect:/logout";
	}

	// 테스트용
	@RequestMapping("/dninePage")
	public String error() {
		
		log.info("==================== Controller remeberId Post ====================");

		return "/error/dninePage";
	}
	
	@PostMapping("/remeberId")
	@ResponseBody
	public void remeberIdPost(String member_id, boolean remember_id, HttpServletResponse response) throws UnsupportedEncodingException {
		
		log.info("==================== Controller remeberId Post ====================");
		
		
		if (remember_id) { //기억하기 눌렀을시
			Cookie cookie = new Cookie("id", member_id); 

			cookie.setMaxAge(60 * 60 * 24 * 7); //일주일
			response.addCookie(cookie);
			
		} else {
			Cookie cookie = new Cookie("id", "");
			cookie.setMaxAge(0); //쿠키 삭제
			response.addCookie(cookie);
		}
		
	}

}
