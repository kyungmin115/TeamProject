package kr.ac.kopo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.kopo.model.BoardVO;
import kr.ac.kopo.model.SearchInfo;

@Mapper
public interface BoardDao {
	
	List<BoardVO> selectBoardList();

	int insertBoard(BoardVO vo);

	int delBoard(int boardNo);

	BoardVO selectBoard(int boardNo);

	int updateBoard(BoardVO vo);
	
}
