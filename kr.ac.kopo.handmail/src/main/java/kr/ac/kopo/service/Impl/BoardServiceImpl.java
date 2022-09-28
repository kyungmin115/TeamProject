package kr.ac.kopo.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.BoardDao;
import kr.ac.kopo.model.BoardVO;
import kr.ac.kopo.model.SearchCriteria;
import kr.ac.kopo.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {


	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<BoardVO> selectList() {
		
		return boardDao.selectBoardList();
	}


	@Override
	public int insertBoard(BoardVO vo) {
		
		return boardDao.insertBoard(vo);
	}

	@Override
	public int delBoard(int boardNo) {
		
	
		return boardDao.delBoard(boardNo);
	}

	@Override
	public BoardVO selectBoard(int boardNo) {
		
		return boardDao.selectBoard(boardNo);
	}

	@Override
	public int updateBoard(BoardVO vo) {
		
		return boardDao.updateBoard(vo);
	}



}
