package kr.co.marking.product.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductFileDTO {

	private String product_file_name;           // 상품 파일 이름
	private String product_file_uploadpath;     // 상품 파일 경로
	private String product_file_uuid;           // 상품 파일 uuid
	private String product_file_main;           // 상품 파일 메인유무
	private String product_no;                  // 상품 번호 FK
}
