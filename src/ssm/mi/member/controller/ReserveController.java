package ssm.mi.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;

import ssm.mi.member.service.ReserveService;
import ssm.mi.member.vo.ReservationVO;

@Controller //��Ʈ�ѷ� ������̼�
@RequestMapping("/reserve") //reserve ���� ��Ʈ�ѷ�
public class ReserveController {
	
	@Autowired
	ReserveService service; //Service�� ����� Ŭ������ Autowired�� ����

		
    //index.jsp���� ����ý����� �̿��Ϸ��� �� ��θ� ���ľ���
	@RequestMapping("/reserveDateForm") //��û ����
	public ModelAndView reserveSystem() { 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/reserve/reserveDateForm");
		return mav;
	}
	
	@RequestMapping("/reserveDateOk")
	public String resDate(@ModelAttribute ReservationVO reserveVO, HttpServletRequest request, Model model) {
		
	
		HttpSession session = request.getSession();
		session.setAttribute("res_date", reserveVO.getRes_date());
		
		List<ReservationVO> list =  service.resSelectDate(reserveVO.getRes_date());
		
		String url="reserve/reserveTimeForm";
		
		return url;
	}
	
	@RequestMapping(value="/time_check")
	@ResponseBody
	public int time_check(@ModelAttribute ReservationVO param,HttpServletRequest request) {
		System.out.println("time_check controller START");
		String res_date = request.getParameter("date");
		String res_time = request.getParameter("time");
		System.out.println("time >>> : " +  res_date);
		System.out.println("date >>> : " +res_time);
		ReservationVO rvo = new ReservationVO();
		rvo.setRes_date(res_date);
		rvo.setRes_time(res_time);
		
		int result = service.time_check(rvo);
	
		return result;
	}

}
	
