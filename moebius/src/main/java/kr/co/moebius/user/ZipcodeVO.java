package kr.co.moebius.user;

import java.io.Serializable;

public class ZipcodeVO implements Serializable{
	private String zipcode1;
	private String zipcode2;
	private String addr1;
	
	public String getZipcode1() {
		return zipcode1;
	}
	public void setZipcode1(String zipcode1) {
		this.zipcode1 = zipcode1;
	}
	public String getZipcode2() {
		return zipcode2;
	}
	public void setZipcode2(String zipcode2) {
		this.zipcode2 = zipcode2;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	@Override
	public String toString() {
		return "ZipcodeVO [zipcode1=" + zipcode1 + ", zipcode2=" + zipcode2
				+ ", addr1=" + addr1 + "]";
	}
}
