package kr.co.moebius.location;

import java.util.List;

public interface LocationService {
	
	LocationVO getSelect(int location_no) throws Exception;

	List<LocationVO> selectLocation() throws Exception;

}
