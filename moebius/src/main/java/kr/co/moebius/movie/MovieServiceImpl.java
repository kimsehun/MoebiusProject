package kr.co.moebius.movie;

import java.util.List;
import java.util.Map;

import kr.co.moebius.movie.MovieVO;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MovieServiceImpl implements MovieService{

	@Autowired
	private MovieMapper movieMapper;

	@Override
	public void insertAction(MovieVO movieVO) {
		movieMapper.insertAction(movieVO);
		
	}

	@Override
	public List<MovieVO> plan(String today) {
		return movieMapper.plan(today);
	}
	
	@Override
	public List<MovieVO> search() {
		return movieMapper.search();
	}
	
	@Override
	public MovieVO detail(int movie_no) {
		return movieMapper.detail(movie_no);
	}
	
	@Override
	public List<MovieVO> ranking() {
		return movieMapper.ranking();
	}

	@Override
	public List<MovieVO> selectMovie() {
		return movieMapper.selectMovie();
	}
	
	@Override
	public MovieVO selectDate(int movie_no) {
		return movieMapper.selectDate(movie_no);
	}
}
