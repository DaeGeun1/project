package kr.co.marking.product.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.marking.product.domain.OrderDTO;
import kr.co.marking.product.mapper.OrderMapper;
import kr.co.marking.product.service.IOrderService;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class OrderServiceImpl implements IOrderService {
	
	@Autowired
	OrderMapper orderMapper;
	
	//주문 테이블 추가( 상세 추가 후 기본 추가)
	@Transactional
	@Override
	public String insertOrder(OrderDTO oDto) {
		
		log.info("==================== service insertOrder ====================");
		
		System.out.println(oDto);
		System.out.println("서비스 진입성공");
		
		orderMapper.insertOrderDetail(oDto);
		System.out.println("ssssssssssssssdadasssssssssssssss");
		String[] noArr = oDto.getProduct_no().split(",");
		String[] amountArr = oDto.getProduct_amount().split(",");
		
		for (int i = 0; i < noArr.length; i++) {
			oDto.setProduct_no(noArr[i]);
			oDto.setProduct_amount(amountArr[i]);
			System.out.println("sssssssssssssssssssssssssss");
			orderMapper.insertOrder(oDto);
			
		}
		
		return oDto.getOrder_no();  //order_no 출력
	}
	
	
	//주문 테이블 삭제
	@Override
	public boolean deleteOrder(String order_no) {
		
		log.info("==================== service deleteOrder ====================");
		System.out.println(order_no);
		orderMapper.deleteOrder(order_no);       //기본 테이블 삭제 fk
		int result = orderMapper.deleteOrderDetail(order_no); //상세 테이블 삭제
		
		return result == 1 ? true : false;       //true : 성공   false : 실패
	}

	//해당 회원의 주문 내역 출력
	@Override
	public List<OrderDTO> selectOrderList(String member_id) {
		
		log.info("==================== service selectOrderList ====================");
		
		return orderMapper.selectOrderList(member_id);
	}
	
	
	
	
	
	
	

}
