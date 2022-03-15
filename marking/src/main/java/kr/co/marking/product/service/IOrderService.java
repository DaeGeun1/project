package kr.co.marking.product.service;

import java.util.List;

import kr.co.marking.product.domain.OrderDTO;

public interface IOrderService {
	
	public String insertOrder(OrderDTO oDto);            // 주문 테이블 추가  ( 상세 테이블 추가 후 기본 테이블 추가) //등록후 order_no 출력
	
	public boolean deleteOrder(String order_no);         // 주문 테이블 삭제
	
	public List<OrderDTO> selectOrderList (String member_id);  // 해당 회원의 주문 내역 출력
	
}
