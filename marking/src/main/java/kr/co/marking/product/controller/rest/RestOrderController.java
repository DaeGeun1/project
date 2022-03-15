package kr.co.marking.product.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.marking.product.domain.OrderDTO;
import kr.co.marking.product.service.IOrderService;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/order")
@Log4j
public class RestOrderController {

	@Autowired
	private IOrderService orderService;
	
	//주문정보 등록
	@PreAuthorize("hasAnyRole({'ROLE_ADMIN', 'ROLE_MEMBER'})")
	@PostMapping(value="/add")
	public ResponseEntity<String> basketAddPost(OrderDTO oDto) {
		
		log.info("==================== restController basketAddPost ====================");
		
		System.out.println("들어는 오니");
		String order_no = orderService.insertOrder(oDto);
		System.out.println("나왔냐");
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html;charset=UTF-8");
		
		
		//등록성공 후 주문번호 출력
		return new ResponseEntity<String>(order_no, headers, HttpStatus.OK);
	}
	
	
	//장바구니 삭제
	@PreAuthorize("hasAnyRole({'ROLE_ADMIN', 'ROLE_MEMBER'})")
	@PostMapping(value="/delete")
	public ResponseEntity<String> basketDeletePost(String order_no) {
			
		log.info("==================== restController basketDeletePost ====================");

		boolean result = orderService.deleteOrder(order_no);
			
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html;charset=UTF-8");
		
		
		if(!result) {
			return new ResponseEntity<String>("주문정보 삭제 실패 오류 발생", headers, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		//등록성공 후 주문번호 출력
		return new ResponseEntity<String>("삭제 성공", headers, HttpStatus.OK);
	}
		
	

	
}




















