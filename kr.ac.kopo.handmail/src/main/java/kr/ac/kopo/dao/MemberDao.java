package kr.ac.kopo.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import kr.ac.kopo.model.MemberVO;

@Mapper
public interface MemberDao {

	List<MemberVO> selectMemList();
	
	int insertMem(MemberVO vo);
	
	public MemberVO login(MemberVO vo) throws Exception;
	
	int delMem(MemberVO vo);
	
	MemberVO selectMem(MemberVO vo);
	
	int updateMem(MemberVO vo);
	
}
