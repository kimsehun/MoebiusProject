package kr.co.moebius.screen;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ScreenServiceImpl implements ScreenService{

	@Autowired
	private ScreenMapper screenMapper;
	
	@Override
	public void insertAction(ScreenVO screenVO) {
		 screenMapper.insertAction(screenVO);
	}
	
	@Override
	public int selectNo(ScreenVO screenVO) {
		return screenMapper.selectNo(screenVO);
	}
}
