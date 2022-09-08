package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.kopo.model.Criteria;
import kr.ac.kopo.model.ProductVO;

@Mapper
public interface ProductDao {

	

	public int insertProd(ProductVO vo);

	public void delete();

	public List<ProductVO> selectList(Criteria cri);

	public int listCount();
}
