package kr.co.moebius.movie;

import java.util.List;
import java.util.Map;

public interface MovieMapper {

	//영화 등록
	void insertAction(MovieVO movieVO);

	//상영예정작을 가져온다.
	List<MovieVO> plan(String today);

	//영화
	List<MovieVO> search();

	//영화의 상세보기
	MovieVO detail(int movie_no);

	//상영작을 예매순으로 리스트형식으로 가져온다.
	List<MovieVO> ranking();

	List<MovieVO> selectMovie();

	MovieVO selectDate(int movie_no);


}
