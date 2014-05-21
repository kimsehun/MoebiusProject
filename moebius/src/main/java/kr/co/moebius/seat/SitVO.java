package kr.co.moebius.seat;

public class SitVO {
	private int location_no;
	private int movie_no;
	private int year;
	private String month;
	private int day;
	private int schedule_no;
	public int getLocation_no() {
		return location_no;
	}
	public void setLocation_no(int location_no) {
		this.location_no = location_no;
	}
	public int getMovie_no() {
		return movie_no;
	}
	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}
	
	@Override
	public String toString() {
		return "SitVO [location_no=" + location_no + ", movie_no=" + movie_no
				+ ", year=" + year + ", month=" + month + ", day=" + day
				+ ", schedule_no=" + schedule_no + "]";
	}
}
