package kr.co.moebius.screen;

public class ScreenVO {

	private int screen_no;
	private String screen_name;
	private int movie_no;
	private int location_no;
	public int getScreen_no() {
		return screen_no;
	}
	public void setScreen_no(int screen_no) {
		this.screen_no = screen_no;
	}
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
	}
	public int getMovie_no() {
		return movie_no;
	}
	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}
	public int getLocation_no() {
		return location_no;
	}
	public void setLocation_no(int location_no) {
		this.location_no = location_no;
	}
	
	@Override
	public String toString() {
		return "ScreenVO [screen_no=" + screen_no + ", screen_name="
				+ screen_name + ", movie_no=" + movie_no + ", location_no="
				+ location_no + "]";
	}
}