package kr.co.marking.product.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.marking.member.domain.MemberDTO;
import kr.co.marking.member.service.IMemberService;
import kr.co.marking.product.domain.ProductDTO;
import kr.co.marking.product.service.IProductFileService;
import kr.co.marking.product.service.IProductService;
import kr.co.marking.util.domain.Criteria;
import kr.co.marking.util.domain.PageDTO;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/product")
@Log4j
public class ProductController {
	
	@Autowired
	private IProductService productService;
	
	@Autowired
	private IProductFileService productFileService;
	
	@Autowired
	private IMemberService memberService;
	
	//===========================================================================
	//관리자단
	
	//상품 관리 페이지 이동
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/admin/list")
	public String ProductListAdminGet(Criteria criteria, Model model) {
		
		log.info("==================== Controller ProductAdminList GET ====================");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("criteria", criteria);
				
		
		List<ProductDTO> productInfo = productService.selectProductListAdminPage();
		
		model.addAttribute("productInfo", productInfo);
		
		return "/product/productAdminList";
	}
	
	
	//상품 등록페이지로 이동
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/admin/add")
	public String ProductAdminAddGet() {
		
		log.info("==================== Controller ProductAdminAdd GET ====================");
		
		return "/product/productAdd";
	}
	
	//상품추가기능
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/admin/add")
	public String ProductAdminAddPost(ProductDTO pDto, String big_category, String middle_category, String small_category, RedirectAttributes rttr) {
		
		
		log.info("==================== Controller ProductAdminAdd POST ====================");
		
		//product_no 저장되는 형태  대분류00 + 중분류00 + 소분류00 + 시퀀스값
		String product_no = big_category + middle_category + small_category;
		pDto.setProduct_no(product_no);
		productService.insertProduct(pDto);
		
		rttr.addFlashAttribute("successMessage", "상품이 성공적으로 등록되었습니다.");
		
		return "redirect:/product/admin/list";
	}
	
	
	// 상품 삭제
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping(value="/admin/delete")
	public String productAdminListPost(String product_no, RedirectAttributes rttr) {
			
		log.info("==================== controller productAdminListPost ====================");
		
		productService.deleteProduct(product_no);
		
		rttr.addFlashAttribute("successMessage", "상품이 성공적으로 삭제되었습니다.");
		
		return "redirect:/product/admin/list";
	}
	
	
	
	
	//================================================================
	//회원단
	
	@GetMapping("/list")
	public String productListUserGet(Criteria criteria, String cate_no, String cate_title, String sort, Model model) {
		
		log.info("==================== controller productListUserGet ====================");
		criteria.setAmount(20); //상품은 기본 20개 셋팅
		System.out.println(criteria);
		System.out.println(cate_no);
		System.out.println(cate_title);
		System.out.println(sort);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("criteria", criteria);
		map.put("cate_no", cate_no);
		map.put("cate_title", cate_title);
		
		int total = productService.selectProductTotalCount(map);
		
		List<ProductDTO> productList = productService.selectProductListUserPage(map);
		
		
		
		model.addAttribute("productList", productList);                         // 상품 정보 셋팅
		
		model.addAttribute("cate_title", cate_title);   						// 상품 페이지의 제목 셋팅

		model.addAttribute("cate_no", cate_no);   								// 상품 페이지의 카테고리 셋팅  dto에 있지만 명확하게 적어둠
		
		model.addAttribute("criteria", criteria);                               // 정렬 및 페이지 관련 정보 셋팅

		model.addAttribute("sort", sort);                              		    // dto에 있지만 명확하게 다시 적어둠
		
		model.addAttribute("pageMaker", new PageDTO(criteria, total));          // 페이지 관련 정보 셋팅
		
		return "/product/productUserList";
	}
	
	
	
	@GetMapping("/user/read")
	public String ProductReadUserGet(ProductDTO pDto, Principal principal, Model model) {
		
		log.info("==================== Controller ProductReadUser Get ====================");
		System.out.println(principal);
		//조회수 + 1 로직
		productService.updateProductViewCount(pDto.getProduct_no());
		
		ProductDTO productInfo = productService.selectProductInfo(pDto.getProduct_no());
		
		MemberDTO memberInfo = null;
		
		if(principal != null) { //회원이 접속한 경우 로그인 정보를 남긴다.
			
			memberInfo = memberService.selectMemberInfo(principal.getName());
		}
		
		
		
		model.addAttribute("productInfo", productInfo);

		model.addAttribute("memberInfo", memberInfo);
		
		return "/product/productUserRead";
	}
	
}
