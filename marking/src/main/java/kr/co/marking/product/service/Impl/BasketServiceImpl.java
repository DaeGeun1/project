package kr.co.marking.product.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.marking.product.domain.BasketDTO;
import kr.co.marking.product.domain.ProductDTO;
import kr.co.marking.product.mapper.BasketMapper;
import kr.co.marking.product.mapper.ProductFileMapper;
import kr.co.marking.product.mapper.ProductMapper;
import kr.co.marking.product.service.IBasketService;
import kr.co.marking.product.service.IProductService;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BasketServiceImpl implements IBasketService {
	
	@Autowired
	BasketMapper basketMapper;
	
	
	//장바구니 상품등록
	@Override
	public boolean insertBasket(BasketDTO basketDto) {
		
		log.info("==================== service insertBasket ====================");
		System.out.println(basketDto);
		
		return basketMapper.insertBasket(basketDto) == 1 ? true : false;
	}
	
	
	//해당 회원의 장바구니 내역 출력
	@Override
	public List<BasketDTO> selectBasketList(BasketDTO basketDto) {
		
		log.info("==================== service selectBasket ====================");
		
		return basketMapper.selectBasketList(basketDto);
	}
	
	
	
	
	//해당 장바구니 내역 삭제
	@Override
	public boolean deleteBasket(String basket_no) {
		
		log.info("==================== service deleteBasket ====================");
		
		return basketMapper.deleteBasket(basket_no) == 1 ? true : false;
	}

	//해당 장바구니 수량 변경
	@Override
	public boolean updateBasket(BasketDTO basketDto) {

		log.info("==================== service updateBasket ====================");
		
		return basketMapper.updateBasket(basketDto) == 1 ? true : false;
	}


	
	
	
	

}
