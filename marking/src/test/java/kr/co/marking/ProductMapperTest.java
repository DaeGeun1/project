package kr.co.marking;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.marking.product.domain.ProductDTO;
import kr.co.marking.product.mapper.ProductMapper;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"
	,"file:src/main/webapp/WEB-INF/spring/**/security-context.xml"})
@Log4j
public class ProductMapperTest {
	
	@Autowired
	private ProductMapper productMapper;
	
	@Test
	public void insertProductTest() {
		ProductDTO pDto = new ProductDTO();
		
		pDto.setProduct_title("나이키");
		pDto.setProduct_contents("나이키 상품 내용입니다.");
		pDto.setProduct_saleprice("10000");
		pDto.setProduct_dispercent("50");
		pDto.setProduct_costprice("2000");
		pDto.setProduct_realprice("2000");
		pDto.setProduct_profit("2000");
		pDto.setProduct_stock("10");
		
		productMapper.insertProduct(pDto);
		
		
	}

}
