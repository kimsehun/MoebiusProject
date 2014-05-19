package kr.co.moebius.movie;

import java.util.List;
import java.util.Map;

public interface MovieService {

	void insertAction(MovieVO movieVO);

	List<MovieVO> plan(String today);

	List<MovieVO> search();

	MovieVO detail(int movie_no);

	List<MovieVO> ranking();

	List<MovieVO> selectMovie();

	MovieVO selectDate(int movie_no);

}
