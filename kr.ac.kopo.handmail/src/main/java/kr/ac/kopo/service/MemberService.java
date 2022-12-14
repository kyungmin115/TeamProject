package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.MemberVO;

public interface MemberService {

	List<MemberVO> selectMemList();
	
	int insertMem(MemberVO vo);
	
	int delMem(MemberVO vo);
		
	MemberVO login(MemberVO vo) throws Exception;
	
	int updateMem(MemberVO vo);

	MemberVO selectMem(String memId);

	MemberVO fix(String memId);

	MemberVO find(String memId);
	
}
