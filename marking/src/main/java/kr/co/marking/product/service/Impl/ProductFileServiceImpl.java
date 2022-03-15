package kr.co.marking.product.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marking.product.domain.ProductDTO;
import kr.co.marking.product.domain.ProductFileDTO;
import kr.co.marking.product.mapper.ProductFileMapper;
import kr.co.marking.product.service.IProductFileService;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductFileServiceImpl implements IProductFileService {
	
	@Autowired
	private ProductFileMapper productFileMapper;

	//해당 상품 파일 추가 
	@Override
	public boolean insertProductFile(ProductFileDTO pFDto) {
		
		log.info("==================== service insertProductFile ====================");
		
		
		return productFileMapper.insertProductFile(pFDto) == 1 ? true : false;   // true면 값 넣기 성공
	}
	
	// 상품 파일 리스트 출력 (메인 , 서브, 전부)
	@Override
	public List<ProductFileDTO> selectProductFileList(ProductFileDTO pFDto) {
		
		log.info("==================== service selectProductFileList ====================");
		System.out.println(pFDto);
		return productFileMapper.selectProductFileList(pFDto);
	}
	
	//해당 상품 파일 모두 삭제
	@Override
	public boolean deleteProductFile(String product_no) {
		
		log.info("==================== service deleteProductFile ====================");
		
		return productFileMapper.deleteProductFile(product_no) == 1 ? true : false;
	}
	
	
}
