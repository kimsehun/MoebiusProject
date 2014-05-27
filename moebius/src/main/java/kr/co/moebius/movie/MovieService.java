package kr.co.moebius.movie;

import java.util.List;


public interface MovieService {

	void insertAction(MovieVO movieVO) throws Exception;

	List<MovieVO> plan(String today) throws Exception;

	List<MovieVO> search() throws Exception;

	MovieVO detail(int movie_no) throws Exception;

	List<MovieVO> ranking() throws Exception;

	List<MovieVO> selectMovie() throws Exception;

	MovieVO selectDate(int movie_no) throws Exception;

	List<MovieVO> getMovieList() throws Exception;

	void deleteMovie(int movie_no) throws Exception;

}
