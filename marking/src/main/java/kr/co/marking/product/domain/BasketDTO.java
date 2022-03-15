package kr.co.marking.product.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BasketDTO {

	private String basket_no;               // 장바구니 번호  PK 단순 seq
	private String member_id;			    // 회원 아이디    FK
	private Timestamp basket_registdate;		// 상품 등록일
	private String product_no;              // 상품 번호     KF
	private String product_amount;          // 상품 수량
	private String product_title;           // 상품 제목
	private String product_realprice;       // 상품 실제 판매가
	private String product_stock;       // 상품 실제 판매가
}


