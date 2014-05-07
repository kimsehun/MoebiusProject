package kr.co.moebius.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MovieServiceImpl implements MovieService{

	@Autowired
	private MovieMapper movieMapper;
}
