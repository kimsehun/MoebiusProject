package kr.co.moebius.reserve;

import java.util.List;

import kr.co.moebius.seat.SitVO;

public interface ReserveMapper {


	String getScreenName(int screen_no) throws Exception;

	int getSeatno(SitVO sitVO) throws Exception;

	void insertReserve(SitVO sitVO) throws Exception;

	int count(SitVO sitVO);

	void updateReserveCount(int movie_no) throws Exception;

	void updateStatus(String user_id) throws Exception;

	List<String> getReservedSeat(SitVO sitVO) throws Exception;

	void insertEleven(SitVO sitVO) throws Exception;

	int countEleven(SitVO sitVO) throws Exception;


}
