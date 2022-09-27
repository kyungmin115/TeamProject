package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.BoardVO;
import kr.ac.kopo.model.SearchCriteria;

public interface RecipeService {

	List<BoardVO> selectList();

	int insertBoard(BoardVO vo);

	int delBoard(int boardNo);

	BoardVO selectBoard(int boardNo);

	int updateBoard(BoardVO vo);

	
}
