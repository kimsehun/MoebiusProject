package kr.co.moebius.seat;

public interface SitService {

	String getScreenName(int screen_no) throws Exception;

	int getSeatno(String seatName) throws Exception;

	void insertReserve(SitVO sitVO) throws Exception;



}
