package kr.co.moebius.seat;

import java.io.Serializable;

public class SitVO implements Serializable {
	private int location_no;
	private int schedule_no;
	private String seat_name;
	private int seat_no;
	private String screen_name;
	private int screen_no;
	private String user_id;
	private int movie_no;
	private int movie_point;
	private int user_point;
	
	public int getLocation_no() {
		return location_no;
	}
	public void setLocation_no(int location_no) {
		this.location_no = location_no;
	}
	public int getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}
	public String getSeat_name() {
		return seat_name;
	}
	public void setSeat_name(String seat_name) {
		this.seat_name = seat_name;
	}
	public int getSeat_no() {
		return seat_no;
	}
	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
	}
	public int getScreen_no() {
		return screen_no;
	}
	public void setScreen_no(int screen_no) {
		this.screen_no = screen_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public int getUser_point() {
		return user_point;
	}
	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}
	@Override
	public String toString() {
		return "SitVO [location_no=" + location_no + ", schedule_no="
				+ schedule_no + ", seat_name=" + seat_name + ", seat_no="
				+ seat_no + ", screen_name=" + screen_name + ", screen_no="
				+ screen_no + ", user_id=" + user_id + ", movie_no=" + movie_no
				+ ", movie_point=" + movie_point + ", user_point=" + user_point
				+ "]";
	}
	
}
