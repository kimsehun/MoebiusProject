package kr.co.moebius.screen;

import java.util.List;

public interface ScreenMapper {

	void insertAction(ScreenVO screenVO);

	int selectNo(ScreenVO screenVO);

	List<ScreenVO> selectReserveScreen(int movie_no);

	int countInsert(ScreenVO screenVO);

}
