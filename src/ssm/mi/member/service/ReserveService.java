package ssm.mi.member.service;

import java.util.List;

import ssm.mi.member.vo.ReservationVO;

public interface ReserveService {

	List<ReservationVO> resSelectDate(String res_date);

	int time_check(ReservationVO rvo);





}
