package kr.co.marking.product.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.marking.product.domain.CategoryDTO;
import kr.co.marking.product.mapper.CategoryMapper;
import kr.co.marking.product.service.ICategoryService;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CategoryServiceImpl implements ICategoryService {
	
	@Autowired
	private CategoryMapper categoryMapper;
	
	
	//해당하는 분류값 출력하기
	@Override
	public List<CategoryDTO> selectCategory(CategoryDTO cDto) {
		
		log.info("==================== service selectCategory ====================");
		
		return categoryMapper.selectCategory(cDto);
	}

	
	
	
}
