package kr.co.marking.product.mapper;

import java.util.List;

import kr.co.marking.product.domain.BasketDTO;

public interface BasketMapper {
	
	public int insertBasket(BasketDTO basketDto);       				//장바구니 추가

	public List<BasketDTO> selectBasketList(BasketDTO basketDto);       //해당 회원의 장바구니 출력
	
	public int deleteBasket(String basket_no);       					//장바구니 삭제

	public int updateBasket(BasketDTO basketDto);       				//장바구니 수량 변경
	
	
}
