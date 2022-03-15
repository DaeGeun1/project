package kr.co.marking.product.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductDTO {

	private String product_no;            	 // 상품 번호
	private String product_title;         	 // 상품 제목
	private String product_contents;       	 // 상품 내용
	private Timestamp product_registdate;    // 상품 등록일
	private String product_saleprice;     	 // 상품 원 판매가
	private String product_dispercent;     	 // 상품 할인율
	private String product_costprice;       // 상품 원가
	private String product_realprice;      	// 상품 실제 판매가
	private String product_profit;         	// 상품 이익
	private String product_stock;       	// 상품 재고량
	private String product_salestate;      // 상품 판매유무
	private String product_best;           // 상품 베스트 상품 유무
	private String product_sale;           // 상품 할인 상품 유무
	private String product_new;            // 상품 신상품 유무
	private String product_delete;         // 상품 삭제 유무
	private String product_order;          // 상품 주문량
	private String product_viewcount;      // 상품 조회수
	private String product_salesamount;      // 상품 판매량
	
	// 같은 div안에 넣을 수 없어서 분리
	private List<ProductFileDTO> productMainFileList;   // 메인사진용
	private List<ProductFileDTO> productSubFileList;    // 서브사진용
	
	
	private String product_rno;             // 상품 게시판 정렬 용도 db값 없음 rownum임
}
