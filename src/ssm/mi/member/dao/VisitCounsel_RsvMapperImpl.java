package ssm.mi.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.mi.member.vo.VisitCounsel_RsvVO;


@Repository
public class VisitCounsel_RsvMapperImpl implements VisitCounsel_RsvMapper {

	@Autowired
	private SqlSession session;
	
	@Override
	public List vcRsvList(VisitCounsel_RsvVO vcRvo) {
		// TODO Auto-generated method stub
		return session.selectList("vcRsvList");
	}
	
}
