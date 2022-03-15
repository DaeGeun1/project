package kr.co.marking.product.service;

import java.util.List;

import kr.co.marking.product.domain.CategoryDTO;

public interface ICategoryService {
	
	public List<CategoryDTO> selectCategory(CategoryDTO cDto);  // 해당되는 분류 값 가져오기
	
}
