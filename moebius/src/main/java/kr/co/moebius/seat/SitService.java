package kr.co.moebius.seat;

import java.util.List;

public interface SitService {

	String getScreenName(int screen_no) throws Exception;

	int getSeatno(String seatName) throws Exception;

	void insertReserve(SitVO sitVO) throws Exception;

	void updateReserveCount(int movie_no) throws Exception;

	void updateStatus(String user_id) throws Exception;

	List<String> getReservedSeat(SitVO sitVO) throws Exception;

	void insertEleven(SitVO sitVO) throws Exception;






}
