package ssm.mi.member.service;

import java.util.List;

import ssm.mi.member.vo.TMemberVO;

public interface TMemberService {

	public List<TMemberVO> listTMemberN(TMemberVO param);
	public List<TMemberVO> listTMemberY(TMemberVO param);
	public TMemberVO selectChaebun(String tvo);
	public int tMemberInsert(TMemberVO tvo);
	public int joinTMember(TMemberVO param);
	public TMemberVO joinTMemberCheck(TMemberVO param);

}
