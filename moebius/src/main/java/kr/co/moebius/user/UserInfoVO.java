package kr.co.moebius.user;

import java.io.Serializable;

public class UserInfoVO implements Serializable {
	private String user_id;
	private String user_name;
	private int movie_point;
	private int user_status;
	private String location_name;
	private String screen_name;
	private String movie_title;
	private String seat_name;
	private int schedule_no;
	private int movie_no;
	private int seat_no;
	private int screen_no;
	private String schedule_time;
	private String schedule_date;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getMovie_point() {
		return movie_point;
	}
	public void setMovie_point(int movie_point) {
		this.movie_point = movie_point;
	}
	public int getUser_status() {
		return user_status;
	}
	public void setUser_status(int user_status) {
		this.user_status = user_status;
	}
	public String getLocation_name() {
		return location_name;
	}
	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getSeat_name() {
		return seat_name;
	}
	public void setSeat_name(String seat_name) {
		this.seat_name = seat_name;
	}
	public int getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}
	public String getSchedule_time() {
		return schedule_time;
	}
	public void setSchedule_time(String schedule_time) {
		this.schedule_time = schedule_time;
	}
	public String getSchedule_date() {
		return schedule_date;
	}
	public void setSchedule_date(String schedule_date) {
		this.schedule_date = schedule_date;
	}
	
	public int getMovie_no() {
		return movie_no;
	}
	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}
	public int getSeat_no() {
		return seat_no;
	}
	public void setSeat_no(int seat_no) {
		this.seat_no = seat_no;
	}
	public int getScreen_no() {
		return screen_no;
	}
	public void setScreen_no(int screen_no) {
		this.screen_no = screen_no;
	}
	@Override
	public String toString() {
		return "UserInfoVO [user_id=" + user_id + ", user_name=" + user_name
				+ ", movie_point=" + movie_point + ", user_status="
				+ user_status + ", location_name=" + location_name
				+ ", screen_name=" + screen_name + ", movie_title="
				+ movie_title + ", seat_name=" + seat_name + ", schedule_no="
				+ schedule_no + ", movie_no=" + movie_no + ", seat_no="
				+ seat_no + ", screen_no=" + screen_no + ", schedule_time="
				+ schedule_time + ", schedule_date=" + schedule_date + "]";
	}
}
