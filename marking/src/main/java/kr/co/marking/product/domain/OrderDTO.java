package kr.co.marking.product.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class OrderDTO {

	// tbl_order
	private String member_id; 				// 회원 아이디
	private String product_no; 				// 상품 번호
	private String order_no; 				// 주문 번호
	private String product_amount; 			// 상품 수량
	
	
	//조인
	// tbl_order_detail
	// private Stirng order_no;
	private String order_recipient;         // 배송 수령인
	private String order_post;              // 주문 우편번호
	private String order_basic_address;     // 주문 기본주소
	private String order_detail_address;    // 주문 상세주소
	private String order_tel;               // 배송 전화번호	
	private String order_message;           // 주문 메시지
	private String order_delivery_fee;      // 주문 배송비
	private String order_total_price;       // 주문 총 금액
	private Timestamp order_date;              // 주문 일자
	private String order_state;             // 주문 상태  입금대기중, 입금완료 , 배송준비중 등등..
	
	//조인문
	// tbl_product
	// private String product_no;
	private String product_title;            // 상품 이름
	private String product_realprice;        // 상품 가격
	
}

