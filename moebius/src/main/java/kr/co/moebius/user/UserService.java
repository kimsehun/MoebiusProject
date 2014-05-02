package kr.co.moebius.user;

import java.util.List;

public interface UserService {

	void registUser(UserVO userVO) throws Exception;

	List<ZipcodeVO> searchZipcode(String area) throws Exception;

	List<UserVO> searchId(String user_id) throws Exception;

}
