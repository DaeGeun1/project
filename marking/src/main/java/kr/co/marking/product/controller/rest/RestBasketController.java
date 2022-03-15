package kr.co.marking.product.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.marking.product.domain.BasketDTO;
import kr.co.marking.product.service.IBasketService;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/basket")
@Log4j
public class RestBasketController {

	@Autowired
	private IBasketService basketService;
	
	//장바구니 등록
	@PreAuthorize("hasAnyRole({'ROLE_ADMIN', 'ROLE_MEMBER'})")
	@PostMapping(value="/add")
	public ResponseEntity<String> basketAddPost(BasketDTO basketDto) {
		
		log.info("==================== restController basketAddPost ====================");
		System.out.println(basketDto);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html;charset=UTF-8");
		
		List<BasketDTO> basketInfo = basketService.selectBasketList(basketDto);  // 장바구니에 해당 상품이 담겨있는지 체크
		
		System.out.println(basketInfo.size());
		String product_no = basketDto.getProduct_no();
		
		//장바구니 존재시
		if(basketInfo.size() != 0) {
			
			return new ResponseEntity<String>("이미 장바구니에 등록되어있는 상품입니다.", headers,HttpStatus.OK);
			
		} 
		
		basketDto.setProduct_no(null);
		basketInfo = basketService.selectBasketList(basketDto);  // 장바구니에 해당 상품이 담겨있는지 체크
		
		System.out.println(basketInfo.size());
		
		if(basketInfo.size() >= 5) {
			
			return new ResponseEntity<String>("장바구니는 최대 5개 상품만 담을 수 있습니다.", headers,HttpStatus.OK);
		}
		
		//장바구니 등록하기
		basketDto.setProduct_no(product_no);
		boolean result = basketService.insertBasket(basketDto);  // 장바구니 담기  true : 성공  false : 실패
		
		//실패시
		if(!result) {
			
			return new ResponseEntity<String>("일시적인 오류발생 다시 시도해주세요.", headers,HttpStatus.NOT_FOUND);
		}
		
		//성공시
		return new ResponseEntity<String>("장바구니 등록완료.", headers, HttpStatus.OK);
	}
	
	//장바구니 삭제
	@PreAuthorize("hasAnyRole({'ROLE_ADMIN', 'ROLE_MEMBER'})")
	@PostMapping(value="/delete")
	public ResponseEntity<String> basketDeletePost(String basket_no) {
		
		log.info("==================== restController basketDeletePost ====================");
		System.out.println(basket_no);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html;charset=UTF-8");
		
		boolean result = basketService.deleteBasket(basket_no);
		
		
		//실패시
		if(!result) {
			
			return new ResponseEntity<String>("일시적인 오류발생 다시 시도해주세요.", headers,HttpStatus.NOT_FOUND);
		}
		
		//성공시
		return new ResponseEntity<String>("장바구니 상품 삭제 완료.", headers, HttpStatus.OK);
	}
	
	/*
	 * //장바구니 숫자 업데이트
	 * 
	 * @PostMapping(value="/update") public ResponseEntity<String>
	 * basketUpdatePost(BasketDTO basketDto) {
	 * 
	 * log.
	 * info("==================== restController basketUpdatePost ===================="
	 * ); System.out.println(basketDto);
	 * 
	 * HttpHeaders headers = new HttpHeaders(); headers.add("Content-Type",
	 * "text/html;charset=UTF-8");
	 * 
	 * boolean result = basketService.updateBasket(basketDto);
	 * 
	 * 
	 * //실패시 if(!result) {
	 * 
	 * return new ResponseEntity<String>("일시적인 오류발생 다시 시도해주세요.",
	 * headers,HttpStatus.NOT_FOUND); }
	 * 
	 * //성공시 return new ResponseEntity<String>("장바구니 상품 삭제 완료.", headers,
	 * HttpStatus.OK); }
	 */
	
	
	//장바구니 정보 출력
	@PreAuthorize("hasAnyRole({'ROLE_ADMIN', 'ROLE_MEMBER'})")
	@Transactional
	@PostMapping(value="/update", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<BasketDTO>> basketInfoPost(BasketDTO basketDto) {
		
		log.info("==================== restController basketInfoPost ====================");
		System.out.println(basketDto);
		 basketService.updateBasket(basketDto);
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html;charset=UTF-8");
		
		List<BasketDTO> basketInfo = basketService.selectBasketList(basketDto);
		System.out.println(basketInfo);
		
		//실패시
		if(basketInfo == null ) {
			
			return new ResponseEntity<List<BasketDTO>>(basketInfo, headers,HttpStatus.NOT_FOUND);
		}
		
		//성공시
		return new ResponseEntity<List<BasketDTO>>(basketInfo, headers, HttpStatus.OK);
	}

	
}




















