package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.Criteria;
import kr.ac.kopo.model.ProductVO;
import kr.ac.kopo.model.SearchCriteria;

public interface ProductService {

	int insertProd(ProductVO vo);

	void delete();
	
	List<ProductVO> selectList(SearchCriteria scri);
	
	public int listCount(SearchCriteria scri);
	
	List<ProductVO> selectEvent(SearchCriteria scri);
	
}
