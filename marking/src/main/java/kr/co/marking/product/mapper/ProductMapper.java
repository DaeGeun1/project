package kr.co.marking.product.mapper;

import java.util.List;
import java.util.Map;

import kr.co.marking.product.domain.ProductDTO;

public interface ProductMapper {
	
	public int insertProduct(ProductDTO pDto);           		    			 		 // 상품 추가 기능
		
	public String selectProductRecentNo();                              		 		 // 상품 가장 최근에 등록된 product_no 출력
	
	public List<ProductDTO> selectProductListAdminPage();  								 //상품 리스트 출력 관리자쪽
	
	public List<ProductDTO> selectProductListUserPage(Map<String, Object> map);  		 //상품 리스트 출력 회원쪽
	
	public ProductDTO selectProductInfo(String product_no);								 //상품 상세 출력 

	public int updateProductViewCount(String product_no);						 		 //상품 클릭시 조회수 +1 
	
	public int selectProductTotalCount(Map<String, Object> map);  						 //상품 총 갯수 출력
	
	public int deleteProduct(String product_no);                       			 		 //상품 삭제
	
	public List<ProductDTO> selectBestProductList();                                     //메인화면 베스트 상품 4개 출력
	
	public List<ProductDTO> selectNewtProductList();                                     //메인화면 신상품 상품 4개 출력
	
	public List<ProductDTO> selectSaleProductList();                                     //메인화면 세일 상품 4개 출력
	
	
	//--------------------------------------
	
	public int updateProductOrderCount(String product_no, String num, String amount);    //주문시 상품 주문수량 판매량 업데이트
}
