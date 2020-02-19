package ssm.mi.member.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import ssm.mi.member.vo.ReservationVO;


public interface ReserveDao {

	List<ReservationVO> resSelectDate(String res_date);

//	int time_check(String res_date, String res_time);

	int time_check(ReservationVO param);

}
