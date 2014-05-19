package kr.co.moebius.schedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private ScheduleMapper scheduleMapper;
	
	@Override
	public void insertSchedule(ScheduleVO scheduleVO) {
		scheduleMapper.insertSchedule(scheduleVO);
		
	}

}
