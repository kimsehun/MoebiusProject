package kr.co.moebius.reserve;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReserveServiceImpl implements ReserveService {

	@Autowired
	private ReserveMapper reserveMapper;
}
