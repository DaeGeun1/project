package kr.co.marking.product.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.marking.member.domain.MemberDTO;
import kr.co.marking.member.service.IMemberService;
import kr.co.marking.product.domain.BasketDTO;
import kr.co.marking.product.domain.OrderDTO;
import kr.co.marking.product.domain.ProductDTO;
import kr.co.marking.product.service.IBasketService;
import kr.co.marking.product.service.IOrderService;
import kr.co.marking.product.service.IProductService;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/order")
@Log4j
public class orderController {
	
	@Autowired
	IMemberService memberService;
	
	@Autowired
	IBasketService basketService;
	
	@Autowired
	IProductService productService;
	
	@Autowired
	IOrderService orderService;
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("")
	public String basketOrderGet(Principal principal, BasketDTO basketDto ,Model model) {
		
		log.info("==================== Controller basketOrderGet ====================");
		
		ProductDTO productInfo = null;
		
		List<BasketDTO> basketList = null;
		
		MemberDTO memberInfo = memberService.selectMemberInfo(principal.getName());
		
		if(basketDto.getProduct_no() != null) { // 바로 주문하기 버튼 눌렀을때
			
			productInfo = productService.selectProductInfo(basketDto.getProduct_no());
			
		} else { //장바구니에서 주문하기 눌렀을때 회원정보의 장바구니 목록 출력
			basketDto.setMember_id(principal.getName());
			basketList = basketService.selectBasketList(basketDto);
		}
		model.addAttribute("productInfo", productInfo);
		
		model.addAttribute("memberInfo", memberInfo);
		
		model.addAttribute("basketList", basketList); //바로 주문하기 눌렀을시 product_amount만 담겨있음
		
		model.addAttribute("amount", basketDto.getProduct_amount()); //바로 주문하기 눌렀을시 product_amount만 담겨있음
		
		return "product/order";
	}
	
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("/list")
	public String basketOrderListGet(Principal principal ,String message, Model model) {
		
		if("1".equals(message)) {
			
			model.addAttribute("successMessage" , "결제완료");
			
		}
		List<OrderDTO> orderList = null;
		
		if(principal != null) {
			orderList = orderService.selectOrderList(principal.getName());
		}
		
		model.addAttribute("orderList" , orderList);
		
		return "product/orderList";
	}
	
}
