package kr.co.moebius.location;

import java.io.Serializable;

public class LocationVO implements Serializable {
	private int location_no;
	private String location_name;
	private String location_addr;
	private String location_addx;
	private String location_addy;
	private String location_phone;
	
	public int getLocation_no() {
		return location_no;
	}
	public void setLocation_no(int location_no) {
		this.location_no = location_no;
	}
	public String getLocation_name() {
		return location_name;
	}
	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}
	public String getLocation_addr() {
		return location_addr;
	}
	public void setLocation_addr(String location_addr) {
		this.location_addr = location_addr;
	}
	public String getLocation_addx() {
		return location_addx;
	}
	public void setLocation_addx(String location_addx) {
		this.location_addx = location_addx;
	}
	public String getLocation_addy() {
		return location_addy;
	}
	public void setLocation_addy(String location_addy) {
		this.location_addy = location_addy;
	}
	public String getLocation_phone() {
		return location_phone;
	}
	public void setLocation_phone(String location_phone) {
		this.location_phone = location_phone;
	}
	
	
	@Override
	public String toString() {
		return "LocationVO [location_no=" + location_no + ", location_name="
				+ location_name + ", location_addr=" + location_addr
				+ ", location_addx=" + location_addx + ", location_addy="
				+ location_addy + ", location_phone=" + location_phone + "]";
	}
}
