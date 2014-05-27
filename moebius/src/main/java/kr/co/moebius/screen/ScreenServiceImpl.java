package kr.co.moebius.screen;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScreenServiceImpl implements ScreenService{

	@Autowired
	private ScreenMapper screenMapper;
	
	@Override
	public void insertAction(ScreenVO screenVO) throws Exception{
		if(screenMapper.countInsert(screenVO) == 0) {
		 screenMapper.insertAction(screenVO);
		} else { 
			throw new RuntimeException();
		}
	}
	
	@Override
	public int selectNo(ScreenVO screenVO) throws Exception {
		return screenMapper.selectNo(screenVO);
	}
	
	@Override
	public List<ScreenVO> selectReserveScreen(int movie_no) throws Exception {
		return screenMapper.selectReserveScreen(movie_no);
	}
	
	@Override
	public List<ScreenVO> selectReserveMovie(int location_no) throws Exception {
		return screenMapper.selectReserveMovie(location_no);
	}
	
	@Override
	public void deleteScreen(int movie_no) throws Exception {
		screenMapper.deleteScreen(movie_no);
	}

	@Override
	public List<ScreenVO> selectScreen(int movie_no) throws Exception {
		return screenMapper.selectScreen(movie_no);
	}
	
	
}
