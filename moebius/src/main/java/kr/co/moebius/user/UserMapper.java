package kr.co.moebius.user;

import java.util.List;

public interface UserMapper {

	void registUser(UserVO userVO) throws Exception;

	List<ZipcodeVO> searchZipcode(String area) throws Exception;

	int searchId(String user_id) throws Exception;

	UserVO getUser(UserVO userVO) throws Exception;

}
