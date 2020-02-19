package ssm.mi.member.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.mi.member.dao.VisitCounsel_RsvMapper;
import ssm.mi.member.vo.VisitCounsel_RsvVO;



@Service
public class VisitCounsel_RsvServiceImpl implements VisitCounsel_RsvService {

	
	Logger logger = Logger.getLogger(VisitCounsel_RsvService.class);
	
	@Autowired
	private VisitCounsel_RsvMapper visitCounsel_RsvMapper;
	
	@Override
	public List vcRsvList(VisitCounsel_RsvVO vcRvo) {
		
		logger.info("(log)Service.vcRsvList() start >>>");
		
		List<VisitCounsel_RsvVO> timeList = visitCounsel_RsvMapper.vcRsvList(vcRvo);
		
		logger.info("(log)Service.vcRsvList() end <<<");
		// TODO Auto-generated method stub
		return timeList;
	}

} // VisitCounsel_RsvSerivceImpl
