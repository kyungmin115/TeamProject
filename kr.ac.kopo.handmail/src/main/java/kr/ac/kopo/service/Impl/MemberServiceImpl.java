package kr.ac.kopo.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.MemberDao;
import kr.ac.kopo.model.MemberVO;
import kr.ac.kopo.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public List<MemberVO> selectMemList() {
		
		return memberDao.selectMemList();
	}

	@Override
	public int insertMem(MemberVO vo) {
		
		return memberDao.insertMem(vo);
	}

	@Override
	public int delMem(MemberVO vo) {
		
		return memberDao.delMem(vo);
	}

	@Override
	public MemberVO selectMem(String MemId) {
		
		return memberDao.selectMem(MemId);
	}

	@Override
	public int updateMem(MemberVO vo) {
		
		return memberDao.updateMem(vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		
		return memberDao.login(vo);
	}

}
