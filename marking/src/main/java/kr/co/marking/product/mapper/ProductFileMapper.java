package kr.co.marking.product.mapper;

import java.util.List;

import kr.co.marking.product.domain.ProductDTO;
import kr.co.marking.product.domain.ProductFileDTO;

public interface ProductFileMapper {
	
	public int insertProductFile(ProductFileDTO pFDto);   					  // 파일 업로드
	
	public List<ProductFileDTO> selectProductFileList(ProductFileDTO pFDto);       // 해당 상품의 첨부파일 출력(메인 / 서브 / 전부)
	
	public int deleteProductFile(String product_no);                          // 해당 상품의 첨부파일 모두 삭제
	
}
