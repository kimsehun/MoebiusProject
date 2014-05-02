package kr.co.moebius.board;

public class BoardInfoVO {

	private int bno;
	private String bname;
	private UserVO user_id;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public UserVO getUser_id() {
		return user_id;
	}
	public void setUser_id(UserVO user_id) {
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "BoardInfoVO [bno=" + bno + ", bname=" + bname + ", user_id="
				+ user_id + "]";
	}
	
	
	
}
