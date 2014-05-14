package kr.co.moebius.user;

import java.io.Serializable;

public class InfoVO implements Serializable {
	private String user_id;
	private String user_inpwd;
	private String new_pwd;
	private String new_pwd_ok;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_inpwd() {
		return user_inpwd;
	}
	public void setUser_inpwd(String user_inpwd) {
		this.user_inpwd = user_inpwd;
	}
	public String getNew_pwd() {
		return new_pwd;
	}
	public void setNew_pwd(String new_pwd) {
		this.new_pwd = new_pwd;
	}
	public String getNew_pwd_ok() {
		return new_pwd_ok;
	}
	public void setNew_pwd_ok(String new_pwd_ok) {
		this.new_pwd_ok = new_pwd_ok;
	}
	@Override
	public String toString() {
		return "InfoVO [user_id=" + user_id + ", user_inpwd=" + user_inpwd
				+ ", new_pwd=" + new_pwd + ", new_pwd_ok=" + new_pwd_ok + "]";
	}
}
