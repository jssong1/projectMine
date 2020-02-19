package ssm.mi.member.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.mi.member.dao.TMemberMapper;
import ssm.mi.member.vo.TMemberVO;


@Service
@Transactional
public class TMemberServiceImpl implements TMemberService{

	
	@Autowired
	private TMemberMapper tMemberMapper;
	
	@Override
	public List<TMemberVO> listTMemberN(TMemberVO param) {
		
		List<TMemberVO> list = new ArrayList<TMemberVO>();
		list = tMemberMapper.listTMemberN(param);
		return list;
	}

	@Override
	public TMemberVO selectChaebun(String tvo) {
		System.out.println("ServiceImpl_Chaebun START");
		TMemberVO ttvo = tMemberMapper.selectChaebun(tvo);
		System.out.println(">>> chaebun >>>>: " +ttvo);
		System.out.println("ServiceImpl_Chaebun END");
		return ttvo;
	}

	@Override
	public int tMemberInsert(TMemberVO tvo) {
		System.out.println("ServiceImpl_tMemberInsert START");
		System.out.println("ServiceImpl_tMemberInsert param>> : " +tvo.getTtNo());
		System.out.println("ServiceImpl_tMemberInsert param>> : " +tvo.getTtName());
		int i = tMemberMapper.tMemberInsert(tvo);
		System.out.println("ServiceImpl_tmemberMapper.tMemberInsert(tvo) >>>> " + i);
		System.out.println("ServiceImpl_tMemberInsert END");
		return i;
	}

	@Override
	public int joinTMember(TMemberVO param) {
		System.out.println("ServiceImpl_joinTMember START");
		int i = tMemberMapper.joinTMember(param);
		System.out.println("ServiceImpl_joinTMember i>>> :" +i);
		System.out.println("ServiceImpl_joinTMember END");
		return i;
	}

	@Override
	public TMemberVO joinTMemberCheck(TMemberVO param) {
		System.out.println("joinTMCheck Service");
		System.out.println("Service param>>> :" +param);
		System.out.println("Service param.getTtName()>>> :" +param.getTtName());
		TMemberVO tmvo = tMemberMapper.joinTMemberCheck(param);
		System.out.println("Service tmvo>>> :" +tmvo);
		return tmvo;
	}

	@Override
	public List<TMemberVO> listTMemberY(TMemberVO param) {
		List<TMemberVO> list = new ArrayList<TMemberVO>();
		list = tMemberMapper.listTMemberY(param);
		return list;
	}

}
