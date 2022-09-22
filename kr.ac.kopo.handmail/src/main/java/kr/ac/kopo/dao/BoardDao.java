package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.kopo.model.BoardVO;
import kr.ac.kopo.model.SearchInfo;

@Mapper
public interface BoardDao {
	
	List<BoardVO> selectBoardList();

	int insertBoard(BoardVO vo);

	int delBoard(int bbsNo);

	BoardVO selectBoard(int bbsNo);

	int updateBoard(BoardVO vo);
	
}
