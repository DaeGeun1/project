package kr.co.marking.product.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.marking.member.service.IMemberService;
import kr.co.marking.product.domain.BasketDTO;
import kr.co.marking.product.service.IBasketService;
import kr.co.marking.product.service.IProductFileService;
import kr.co.marking.product.service.IProductService;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/basket")
@Log4j
public class BasketController {
	
	@Autowired
	private IProductService productService;
	
	@Autowired
	private IProductFileService productFileService;
	
	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private IBasketService basketService;
	
	//장바구니 이동
	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@GetMapping("list")
	public String basketListGet(Principal principal, Model model) {
		
		log.info("==================== Controller basketList GET ====================");
		
		BasketDTO basketDto = new BasketDTO();
		
		basketDto.setMember_id(principal.getName());
		
		List<BasketDTO> basketInfo = basketService.selectBasketList(basketDto);
		
		model.addAttribute("basketInfo" , basketInfo);
		
		return "product/basket";
	}
	
}
