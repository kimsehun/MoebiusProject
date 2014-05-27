package kr.co.moebius.screen;

import java.util.List;

public interface ScreenService {

	void insertAction(ScreenVO screenVO) throws Exception;

	int selectNo(ScreenVO screenVO) throws Exception;

	List<ScreenVO> selectReserveScreen(int movie_no) throws Exception;

	List<ScreenVO> selectReserveMovie(int location_no) throws Exception;

	void deleteScreen(int movie_no) throws Exception;

	List<ScreenVO> selectScreen(int movie_no) throws Exception;

}
