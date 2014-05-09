package kr.co.moebius.movie;

import java.util.List;

public interface MovieMapper {

	void insertAction(MovieVO movieVO);

	List<MovieVO> plan(String today);

	List<MovieVO> search();

}
