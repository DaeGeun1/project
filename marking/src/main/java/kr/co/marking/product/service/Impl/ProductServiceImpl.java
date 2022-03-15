package kr.co.marking.product.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.marking.product.domain.ProductDTO;
import kr.co.marking.product.mapper.ProductFileMapper;
import kr.co.marking.product.mapper.ProductMapper;
import kr.co.marking.product.service.IProductService;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImpl implements IProductService {
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private ProductFileMapper productFileMapper;
	
	//==========================================================================
	//관리자단  
	
	// 상품 추가 기능
	@Transactional
	@Override
	public boolean insertProduct(ProductDTO pDto) {
		
		log.info("==================== service insertProduct ====================");
		System.out.println(pDto);
		
		
		int result = productMapper.insertProduct(pDto);
		
		String product_no = productMapper.selectProductRecentNo();  // 글 등록된 파일의 product_no값 가져오기
		
		//메인과 서브사진 둘다 올리지 않는 경우
		if ((pDto.getProductMainFileList() == null || pDto.getProductMainFileList().size() <= 0) 
			&& (pDto.getProductSubFileList() == null || pDto.getProductSubFileList().size() <= 0)) {
			return false;
		}
		
		//메인사진만 올린경우
		if (!(pDto.getProductMainFileList() == null || pDto.getProductMainFileList().size() <= 0) 
			&& (pDto.getProductSubFileList() == null || pDto.getProductSubFileList().size() <= 0)) {
			
			//메인 사진 올리기
			pDto.getProductMainFileList().forEach(attach -> {
				attach.setProduct_no(product_no);
				System.out.println(attach);
				productFileMapper.insertProductFile(attach);
			});
		}
		
		//서브사진만 올린경우
		if ((pDto.getProductMainFileList() == null || pDto.getProductMainFileList().size() <= 0) 
			&& !(pDto.getProductSubFileList() == null || pDto.getProductSubFileList().size() <= 0)) {
			
			//서브 사진 올리기
			pDto.getProductSubFileList().forEach(attach -> {
				attach.setProduct_no(product_no);
				System.out.println(attach);
				productFileMapper.insertProductFile(attach);
			});
		}
		
		
		//메인과 서브사진 둘다 올린경우
		if (!(pDto.getProductMainFileList() == null || pDto.getProductMainFileList().size() <= 0) 
			&& !(pDto.getProductSubFileList() == null || pDto.getProductSubFileList().size() <= 0)) {
			
			//메인 사진 올리기
			pDto.getProductMainFileList().forEach(attach -> {
				attach.setProduct_no(product_no);
				System.out.println(attach);
				productFileMapper.insertProductFile(attach);
			});
			
			//서브사진 올리기
			pDto.getProductSubFileList().forEach(attach -> {
				attach.setProduct_no(product_no);
				System.out.println(attach);
				productFileMapper.insertProductFile(attach);
			});
		
		
		}
		
		
		
		return result == 1 ? true : false;
	}
	
	//상품 가장 최신 product_no뽑아오기
	@Override
	public String selectProductRecentNo() {
		
		log.info("==================== service selectProductMaxNo ====================");
		
		return productMapper.selectProductRecentNo();
	}
	
	// 관리자단 상품리스트 출력
	@Override
	public List<ProductDTO> selectProductListAdminPage() {

		log.info("==================== service selectProductListAdminPage ====================");
		
		return productMapper.selectProductListAdminPage();
	}
	
	//상품 삭제
	@Override
	public boolean deleteProduct(String product_no) {
		
		log.info("==================== service deleteProduct ====================");
		
		return productMapper.deleteProduct(product_no) == 1 ? true : false;  //맞으면 true
	}
	
	
	
	//==========================================================================
	//회원단 
	
	//회원단 상품 리스트 출력
	@Override
	public List<ProductDTO> selectProductListUserPage(Map<String, Object> map) {
		
		log.info("==================== service selectProductListUserPage ====================");
		System.out.println(map.values());
		return productMapper.selectProductListUserPage(map);
	}
	
	//회원단 상품 리스트 총 갯수 출력  페이징시 필요
	@Override
	public int selectProductTotalCount(Map<String, Object> map) {
		
		log.info("==================== service selectProductTotalCount ====================");
		System.out.println(map.values());
		return productMapper.selectProductTotalCount(map);
	}
	
	//상품 상세 출력
	@Override
	public ProductDTO selectProductInfo(String product_no) {

		log.info("==================== service selectProductInfo ====================");
		
		return productMapper.selectProductInfo(product_no);
	}
	
	//상품 클릭시 조회수 +1
	@Override
	public boolean updateProductViewCount(String product_no) {
		
		log.info("==================== service updateProductViewCount ====================");
		
		return productMapper.updateProductViewCount(product_no) == 1 ? true : false;
	}
	
	
	//주문시 상품 주문수량 판매량 업데이트
	@Override
	public boolean updateProductOrderCount(String product_no, String num, String amount) {

		log.info("==================== service updateProductOrderCount ====================");
		
		
		return productMapper.updateProductOrderCount(product_no, num, amount) == 1 ? true : false;
	}
	
	//메인 화면 베스트 상품 4개 출력
	@Override
	public List<ProductDTO> selectBestProductList() {
		
		log.info("==================== service selectBestProductList ====================");
		
		return productMapper.selectBestProductList();
	}
	
	//메인 화면 신상품 상품 4개 출력
	@Override
	public List<ProductDTO> selectNewtProductList() {
		
		log.info("==================== service selectNewtProductList ====================");
		
		return productMapper.selectNewtProductList();
	}
	
	//메인 화면 세일 상품 4개 출력
	@Override
	public List<ProductDTO> selectSaleProductList() {
		
		log.info("==================== service selectSaleProductList ====================");
		
		return productMapper.selectSaleProductList();
	}

}
