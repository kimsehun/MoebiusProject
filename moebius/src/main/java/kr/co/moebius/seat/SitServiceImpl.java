package kr.co.moebius.seat;

import java.util.List;

import kr.co.moebius.reserve.ReserveMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SitServiceImpl implements SitService{

	@Autowired
	private ReserveMapper reserveMapper;
	

	
	@Override
	public String getScreenName(int screen_no) throws Exception {
		// TODO Auto-generated method stub
		return reserveMapper.getScreenName(screen_no);
	}

	@Override
	public int getSeatno(String seatName) throws Exception {
		// TODO Auto-generated method stub
		return reserveMapper.getSeatno(seatName);
	}

	@Override
	public void insertReserve(SitVO sitVO) throws Exception {
		// TODO Auto-generated method stub
		if(reserveMapper.count(sitVO) == 0) {
			reserveMapper.insertReserve(sitVO);
		} else {
			throw new RuntimeException("중복됩니다.");
		}
	}
	
	@Override
	public void updateReserveCount(int movie_no) throws Exception {
		// TODO Auto-generated method stub
		reserveMapper.updateReserveCount(movie_no);
	}
	
	@Override
	public void updateStatus(String user_id) throws Exception {
		// TODO Auto-generated method stub
		reserveMapper.updateStatus(user_id);
	}

	
	@Override
	public List<String> getReservedSeat(int screen_no) throws Exception {
		// TODO Auto-generated method stub
		return reserveMapper.getReservedSeat(screen_no);
	}
	
	
	
}
