package kr.co.moebius.location;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LocationServiceImpl implements LocationService {
	
	private static final Logger logger = LoggerFactory.getLogger(LocationController.class);
	
	@Autowired
	private LocationMapper locationMapper;
	
	@Override
	public LocationVO getSelect(int location_no) throws Exception {

		return locationMapper.getLocationList(location_no);
	}
	
	@Override
	public List<LocationVO> selectLocation() throws Exception {
		return locationMapper.selectLocation();
	}
}
