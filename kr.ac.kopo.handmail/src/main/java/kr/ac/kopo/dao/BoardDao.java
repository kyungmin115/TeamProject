package kr.ac.kopo.dao;

import java.util.List;

import kr.ac.kopo.model.BoardVO;
import kr.ac.kopo.model.SearchInfo;

public interface BoardDao {
	
	List<BoardVO> selectBoardList(SearchInfo info);

	int insertBoard(BoardVO vo);

	int delBoard(int bbsNo);

	BoardVO selectBoard(int bbsNo);

	int updateBoard(BoardVO vo);
	
}
