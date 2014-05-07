package kr.co.moebius.movie;

import kr.co.moebius.user.UserVO;

public class MovieVO {

	private int movie_no;
	private String movie_title;
	private String movie_directer;
	private String movie_story;
	private String movie_poster;
	private int movie_count;
	private String movie_sdate;
	private String movie_grade;
	private String movie_point;
	private String movie_edate;
	private UserVO user_id;
	
	public int getMovie_no() {
		return movie_no;
	}
	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getMovie_directer() {
		return movie_directer;
	}
	public void setMovie_directer(String movie_directer) {
		this.movie_directer = movie_directer;
	}
	public String getMovie_story() {
		return movie_story;
	}
	public void setMovie_story(String movie_story) {
		this.movie_story = movie_story;
	}
	public String getMovie_poster() {
		return movie_poster;
	}
	public void setMovie_poster(String movie_poster) {
		this.movie_poster = movie_poster;
	}
	public int getMovie_count() {
		return movie_count;
	}
	public void setMovie_count(int movie_count) {
		this.movie_count = movie_count;
	}
	public String getMovie_sdate() {
		return movie_sdate;
	}
	public void setMovie_sdate(String movie_sdate) {
		this.movie_sdate = movie_sdate;
	}
	public String getMovie_grade() {
		return movie_grade;
	}
	public void setMovie_grade(String movie_grade) {
		this.movie_grade = movie_grade;
	}
	public String getMovie_point() {
		return movie_point;
	}
	public void setMovie_point(String movie_point) {
		this.movie_point = movie_point;
	}
	public String getMovie_edate() {
		return movie_edate;
	}
	public void setMovie_edate(String movie_edate) {
		this.movie_edate = movie_edate;
	}
	public UserVO getUser_id() {
		return user_id;
	}
	public void setUser_id(UserVO user_id) {
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "MovieVO [movie_no=" + movie_no + ", movie_title=" + movie_title
				+ ", movie_directer=" + movie_directer + ", movie_story="
				+ movie_story + ", movie_poster=" + movie_poster
				+ ", movie_count=" + movie_count + ", movie_sdate="
				+ movie_sdate + ", movie_grade=" + movie_grade
				+ ", movie_point=" + movie_point + ", movie_edate="
				+ movie_edate + ", user_id=" + user_id + "]";
	}
}