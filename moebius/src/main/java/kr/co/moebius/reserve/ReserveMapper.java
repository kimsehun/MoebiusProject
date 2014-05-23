package kr.co.moebius.reserve;

import kr.co.moebius.seat.SitVO;

public interface ReserveMapper {


	String getScreenName(int screen_no) throws Exception;

	int getSeatno(String seatName) throws Exception;

	void insertReserve(SitVO sitVO) throws Exception;

	int count(SitVO sitVO);
}
