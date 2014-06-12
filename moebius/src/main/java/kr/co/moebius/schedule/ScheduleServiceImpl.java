package kr.co.moebius.schedule;

import java.util.List;

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
	
	@Override
	public List<ScheduleVO> selectTime(ScheduleVO scheduleVO) {
		return scheduleMapper.selectTime(scheduleVO);
	}
	
	@Override
	public void deleteschedule(int screen_no) throws Exception {
		scheduleMapper.deleteschedule(screen_no);
	}
	
	@Override
	public ScheduleVO selectTime1(int schedule_no) {
		// TODO Auto-generated method stub
		return scheduleMapper.selectTime1(schedule_no);
	}

}
