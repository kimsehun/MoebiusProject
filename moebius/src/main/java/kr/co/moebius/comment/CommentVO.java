package kr.co.moebius.comment;

import java.io.Serializable;

public class CommentVO implements Serializable{
	private String user_id;
	private double comment_star;
	private String comment_review; 
	private int movie_no;
	private double comment_avgstar;
	private int comment_no;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public double getComment_star() {
		return comment_star;
	}
	public void setComment_star(double comment_star) {
		this.comment_star = comment_star;
	}
	public String getComment_review() {
		return comment_review;
	}
	public void setComment_review(String comment_review) {
		this.comment_review = comment_review;
	}
	public int getMovie_no() {
		return movie_no;
	}
	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}
	public double getComment_avgstar() {
		return comment_avgstar;
	}
	public void setComment_avgstar(double comment_avgstar) {
		this.comment_avgstar = comment_avgstar;
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	
	@Override
	public String toString() {
		return "CommentVO [user_id=" + user_id + ", comment_star="
				+ comment_star + ", comment_review=" + comment_review
				+ ", movie_no=" + movie_no + ", comment_avgstar="
				+ comment_avgstar + ", comment_no=" + comment_no + "]";
	}
}
