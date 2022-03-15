package kr.co.marking.product.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CategoryDTO {
	  
	private String category_id;      // 그냥 카테고리 pk  시퀀스값
	private String category_name;    // 카테고리 이름
	private String category_level;   // 카테고리 분류  대분류 : 1 중분류 : 2 소분류 : 3  
	private String category_step;    // 카테고리 스텝  중분류에 소분류 자식 구별하는 용도 .... 마음에 안듬... 
	private String category_kind;    // 카테고리종류 같은종류끼리 같은 숫자 
	private String category_number;  // 카테고리 번호 01 02....
}
