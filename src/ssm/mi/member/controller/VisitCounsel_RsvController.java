package ssm.mi.member.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ssm.mi.member.service.VisitCounsel_RsvService;
import ssm.mi.member.vo.VisitCounsel_RsvVO;


@Controller
@RequestMapping(value="/visitCounsel")
public class VisitCounsel_RsvController {

	Logger logger = Logger.getLogger(VisitCounsel_RsvController.class);
	
	@Autowired
	private VisitCounsel_RsvService visitCounsel_RsvService;
	 
	
	// 일정 보기
	@RequestMapping(value = "/vcScheduleList", method=RequestMethod.GET)
	public String vcRsvList(@ModelAttribute VisitCounsel_RsvVO vcRvo, Model model){
		logger.info("(log)Controller.vcRsvList() start >>>");
		
		List<VisitCounsel_RsvVO> timeList = visitCounsel_RsvService.vcRsvList(vcRvo);
		
		System.out.println(timeList);
		model.addAttribute("timeList", timeList);
		
		logger.info("(log)Controller.vcRsvList() end >>>");
		
		return "/cg/visit/vcSchedule";
		//return "/cg/visit/vcList";
	}
} // VisitCounsel_ScheduleController
