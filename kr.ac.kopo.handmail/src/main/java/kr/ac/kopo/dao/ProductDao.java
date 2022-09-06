package kr.ac.kopo.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.kopo.model.ProductVO;

@Mapper
public interface ProductDao {

	public int insertProd(ProductVO vo);
}
