package kr.co.moebius.location;

import java.util.List;

public interface LocationMapper {

	LocationVO getLocationList(int location_no) throws Exception;

	List<LocationVO> selectLocation() throws Exception;
	
}
