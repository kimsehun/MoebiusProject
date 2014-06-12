package kr.co.moebius.reserve;

import java.io.Serializable;

public class ReserveVO implements Serializable{
	
	private String user_id;
	private int screen_no;
	private int seat_no;
	private int schedule_no;
	private int movie_no;
	private int movie_point;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getScreen_no() {
		return screen_no;
	}
	public void setScreen_no(int screen_no) {
		this.screen_no = screen_no;
	}
	public int getSeat_no() {
		return seat_no;
	}
	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}
	public int getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}
	public int getMovie_no() {
		return movie_no;
	}
	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}
	
	public int getMovie_point() {
		return movie_point;
	}
	public void setMovie_point(int movie_point) {
		this.movie_point = movie_point;
	}
	@Override
	public String toString() {
		return "ReserveVO [user_id=" + user_id + ", screen_no=" + screen_no
				+ ", seat_no=" + seat_no + ", schedule_no=" + schedule_no
				+ ", movie_no=" + movie_no + "]";
	}
	
}
