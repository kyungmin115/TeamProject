package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.BoardVO;

public interface BoardService {

	List<BoardVO> selectList();

	int insertBoard(BoardVO vo);

	int delBoard(int boardNo);

	BoardVO selectBoard(BoardVO vo);

	int updateBoard(BoardVO vo);


}
