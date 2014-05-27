package kr.co.moebius.schedule;

import java.util.List;

public interface ScheduleMapper {
	
	void insertSchedule(ScheduleVO scheduleVO);

	List<ScheduleVO> selectTime(ScheduleVO scheduleVO);
	
	void deleteschedule(int screen_no) throws Exception;

}
