package kr.co.moebius.schedule;

import java.io.Serializable;


public class ScheduleVO implements Serializable{

	private int schedule_no;
	private String schedule_date;
	private String schedule_time;
	private int screen_no;
	
	public int getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}
	public String getSchedule_date() {
		return schedule_date;
	}
	public void setSchedule_date(String schedule_date) {
		this.schedule_date = schedule_date;
	}
	public String getSchedule_time() {
		return schedule_time;
	}
	public void setSchedule_time(String schedule_time) {
		this.schedule_time = schedule_time;
	}
	public int getScreen_no() {
		return screen_no;
	}
	public void setScreen_no(int screen_no) {
		this.screen_no = screen_no;
	}
	
	@Override
	public String toString() {
		return "ScheduleVO [schedule_no=" + schedule_no + ", schedule_date="
				+ schedule_date + ", schedule_time=" + schedule_time
				+ ", screen_no=" + screen_no + "]";
	}
}
