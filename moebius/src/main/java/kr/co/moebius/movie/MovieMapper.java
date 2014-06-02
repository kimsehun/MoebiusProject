package kr.co.moebius.movie;

import java.util.List;


public interface MovieMapper {

	//영화 등록
	void insertAction(MovieVO movieVO) throws Exception;

	//상영예정작을 가져온다.
	List<MovieVO> plan(String today) throws Exception;

	//영화
	List<MovieVO> search() throws Exception;

	//영화의 상세보기
	MovieVO detail(int movie_no) throws Exception;

	//상영작을 예매순으로 리스트형식으로 가져온다.
	List<MovieVO> ranking() throws Exception;

	List<MovieVO> selectMovie() throws Exception;

	MovieVO selectDate(int movie_no) throws Exception;

	List<MovieVO> getMovieList() throws Exception;

	void deleteMovie(int movie_no) throws Exception;

	int getMoviePoint(int movie_no) throws Exception;

	int getGrade(int movie_no) throws Exception;

}
