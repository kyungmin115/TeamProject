package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.MemberVO;

public interface MemberService {

	List<MemberVO> selectMemList();
	
	int insertMem(MemberVO vo);
	
	int delMem(MemberVO vo);
	
	MemberVO selectMem(String MemId);
	
	MemberVO login(MemberVO vo) throws Exception;
	
	int updateMem(MemberVO vo);
}
