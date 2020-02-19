package ssm.mi.member.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ssm.mi.member.vo.ReservationVO;

@Repository
public class ReserveDaoImpl implements ReserveDao {

	@Autowired
	SqlSession sqlSession;
	

	@Override
	public List<ReservationVO> resSelectDate(String res_date) {
	
		List<ReservationVO> list = sqlSession.selectList("resSelectDate");
		//SqlSession�� �������� ����("Mapper��(.) Ư���޼���", �Ķ���Ͱ�)
		return list;
	}


	@Override
	public int time_check(ReservationVO param) {
		int result = sqlSession.selectOne("time_check");
		return result;
	}


//	@Override
//	public int time_check(String res_date, String res_time) {
//
//		HashMap<String, String> hm = new HashMap<String, String>();
//		hm.put("res_date", res_date);
//		hm.put("res_time", res_time);
//		
//		int result = sqlSession.selectOne("ssm.mi.member.dao.ReserveDao.time_check", hm);
//		return result;
//	}
}
