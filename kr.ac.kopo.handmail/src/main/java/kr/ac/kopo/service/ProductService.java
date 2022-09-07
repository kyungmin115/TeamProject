package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.ProductVO;

public interface ProductService {

	int insertProd(ProductVO vo);

	void delete();
	
	List<ProductVO> selectList();
	
}
