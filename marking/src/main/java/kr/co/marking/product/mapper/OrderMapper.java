package kr.co.marking.product.mapper;

import java.util.List;

import kr.co.marking.product.domain.OrderDTO;

public interface OrderMapper {
	
	public int insertOrder(OrderDTO oDto);            // 기본 주문 테이블 추가
	
	public int insertOrderDetail(OrderDTO oDto);      // 주문 상세테이블 추가

	public int deleteOrder(String order_no);         // 기본 주문 테이블 삭제
	
	public int deleteOrderDetail(String order_no);    //상세 주문테이블 삭제
	
	public List<OrderDTO> selectOrderList (String member_id);  // 해당 회원의 주문 내역 출력
	
}
