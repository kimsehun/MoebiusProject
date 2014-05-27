package kr.co.moebius.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MovieServiceImpl implements MovieService{

	@Autowired
	private MovieMapper movieMapper;

	@Override
	public void insertAction(MovieVO movieVO) throws Exception {
		movieMapper.insertAction(movieVO);
		
	}

	@Override
	public List<MovieVO> plan(String today) throws Exception  {
		return movieMapper.plan(today);
	}
	
	@Override
	public List<MovieVO> search() throws Exception  {
		return movieMapper.search();
	}
	
	@Override
	public MovieVO detail(int movie_no) throws Exception  {
		return movieMapper.detail(movie_no);
	}
	
	@Override
	public List<MovieVO> ranking() throws Exception  {
		return movieMapper.ranking();
	}

	@Override
	public List<MovieVO> selectMovie() throws Exception  {
		return movieMapper.selectMovie();
	}
	
	@Override
	public MovieVO selectDate(int movie_no) throws Exception  {
		return movieMapper.selectDate(movie_no);
	}

	@Override
	public List<MovieVO> getMovieList() throws Exception {
		return movieMapper.getMovieList();
	}

	@Override
	public void deleteMovie(int movie_no) throws Exception {
		movieMapper.deleteMovie(movie_no);
		
	}
}
