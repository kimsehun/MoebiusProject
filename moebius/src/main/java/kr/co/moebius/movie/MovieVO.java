package kr.co.moebius.movie;

import java.io.Serializable;

import org.eclipse.jetty.jndi.local.localContextRoot;

import kr.co.moebius.user.UserVO;


public class MovieVO implements Serializable{

	private int movie_no;
	private String movie_title;
	private String movie_directer;
	private String movie_genre;
	private String movie_nation;
	private int movie_runningtime;
	private String movie_actor;
	private String movie_story;
	private String movie_poster;
	private int movie_count;
	private String movie_video;
	private String movie_sdate;
	private String movie_grade;
	private String movie_point;
	private String movie_edate;
	private int dday;
	private UserVO userVO;
	
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
	public String getMovie_genre() {
		return movie_genre;
	}
	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}
	public String getMovie_nation() {
		return movie_nation;
	}
	public void setMovie_nation(String movie_nation) {
		this.movie_nation = movie_nation;
	}
	public int getMovie_runningtime() {
		return movie_runningtime;
	}
	public void setMovie_runningtime(int movie_runningtime) {
		this.movie_runningtime = movie_runningtime;
	}
	public String getMovie_actor() {
		return movie_actor;
	}
	public void setMovie_actor(String movie_actor) {
		this.movie_actor = movie_actor;
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
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	public int getDday() {
		return dday;
	}
	public void setDday(int dday) {
		this.dday = dday;
	}
	public String getMovie_video() {
		return movie_video;
	}
	public void setMovie_video(String movie_video) {
		this.movie_video = movie_video;
	}
	
	@Override
	public String toString() {
		return "MovieVO [movie_no=" + movie_no + ", movie_title=" + movie_title
				+ ", movie_directer=" + movie_directer + ", movie_genre="
				+ movie_genre + ", movie_nation=" + movie_nation
				+ ", movie_runningtime=" + movie_runningtime + ", movie_actor="
				+ movie_actor + ", movie_story=" + movie_story
				+ ", movie_poster=" + movie_poster + ", movie_count="
				+ movie_count + ", movie_video=" + movie_video
				+ ", movie_sdate=" + movie_sdate + ", movie_grade="
				+ movie_grade + ", movie_point=" + movie_point
				+ ", movie_edate=" + movie_edate + ", dday=" + dday
				+ ", userVO=" + userVO + "]";
	}
}