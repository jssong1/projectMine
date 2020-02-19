package ssm.mi.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssm.mi.member.dao.ReserveDao;
import ssm.mi.member.vo.ReservationVO;

@Transactional
@Service
public class ReserveServiceImpl implements ReserveService{

	
	@Autowired
	private ReserveDao reserveDao;
	

	
	@Override
	public List<ReservationVO> resSelectDate(String res_date) {
		System.out.println("Sevice_res_date >>> : " +res_date);
		List<ReservationVO> list = reserveDao.resSelectDate(res_date.trim());
		System.out.println("list >>> : " +list);
		return list;
	}



	@Override
	public int time_check(ReservationVO param) {
		System.out.println("time_check service START");
		System.out.println("time >>> : " + param.getRes_time());
		System.out.println("date >>> : " + param.getRes_date());
		int result = reserveDao.time_check(param);
		System.out.println("result>>> : " +result);
		return result;
	}







}
