package kr.co.moebius.screen;

import java.util.List;

public interface ScreenService {

	void insertAction(ScreenVO screenVO) throws Exception;

	int selectNo(ScreenVO screenVO);

	List<ScreenVO> selectReserveScreen(int movie_no);

	List<ScreenVO> selectReserveMovie(int location_no);

}
