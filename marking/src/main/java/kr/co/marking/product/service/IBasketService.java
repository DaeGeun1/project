package kr.co.marking.product.service;

import java.util.List;

import kr.co.marking.product.domain.BasketDTO;

public interface IBasketService {
	
	public boolean insertBasket(BasketDTO basketDto);       				//장바구니 추가

	public List<BasketDTO> selectBasketList(BasketDTO basketDto);       	//해당 회원의 장바구니 출력
	
	public boolean deleteBasket(String basket_no);       					//장바구니 추가
	
	public boolean updateBasket(BasketDTO basketDto);       				//장바구니 수량 변경
	
}
