package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.kopo.model.ProductVO;
import kr.ac.kopo.model.SearchCriteria;

@Mapper
public interface ProductDao {

	public int insertProd(ProductVO vo);

	public void delete();

	public List<ProductVO> selectList(SearchCriteria scri);

	public int listCount(SearchCriteria scri);

	public List<ProductVO> selectEvent(SearchCriteria scri);

	public List<ProductVO> category(SearchCriteria scri);

	public List<ProductVO> selectList1(SearchCriteria scri);

	public List<ProductVO> selectList2(SearchCriteria scri);
	
}
