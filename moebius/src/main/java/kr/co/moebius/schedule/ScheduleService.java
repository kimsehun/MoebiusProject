package kr.co.moebius.schedule;

import java.util.List;

public interface ScheduleService {

	
	void insertSchedule(ScheduleVO scheduleVO);

	List<ScheduleVO> selectTime(ScheduleVO scheduleVO);

}
