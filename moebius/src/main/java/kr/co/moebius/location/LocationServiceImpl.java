package kr.co.moebius.location;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LocationServiceImpl implements LocationService {
	
	@Autowired
	private LocationMapper locationMapper;
	
	@Override
	public LocationVO getSelect(LocationVO locationVO) throws Exception {
		return locationMapper.getLocationList(locationVO);
	}
	
}
