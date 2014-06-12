package kr.co.moebius.reserve;

import kr.co.moebius.user.UserMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReserveServiceImpl implements ReserveService {

	@Autowired
	private ReserveMapper reserveMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public void cancel(ReserveVO vo) {
		reserveMapper.cancel(vo);
		userMapper.rePoint(vo);
	}
}
