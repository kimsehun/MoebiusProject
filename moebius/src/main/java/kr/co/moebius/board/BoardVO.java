package kr.co.moebius.board;

public class BoardVO{
	private int board_no;
	private String board_title;
	private String board_content;
	private String board_regdate;
	private int board_count;
	private UserVO user_id;
	private int bno;
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_regdate() {
		return board_regdate;
	}
	public void setBoard_regdate(String board_regdate) {
		this.board_regdate = board_regdate;
	}
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	public UserVO getUser_id() {
		return user_id;
	}
	public void setUser_id(UserVO user_id) {
		this.user_id = user_id;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	
	@Override
	public String toString() {
		return "BoardVO [board_no=" + board_no + ", board_title=" + board_title
				+ ", board_content=" + board_content + ", board_regdate="
				+ board_regdate + ", board_count=" + board_count + ", user_id="
				+ user_id + ", bno=" + bno + "]";
	}
	
	
	
}
