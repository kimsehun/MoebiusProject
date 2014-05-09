package kr.co.moebius.user;

import java.util.List;

public interface UserMapper {

	void registUser(UserVO userVO) throws Exception;

	List<ZipcodeVO> searchZipcode(String area) throws Exception;

	int searchId(UserVO userVO) throws Exception;

	UserVO getUser(UserVO userVO) throws Exception;

	void deleteUser(UserVO userVO) throws Exception;

	int idCheck(String user_id) throws Exception;

	UserVO getUserInfo(UserVO userVO) throws Exception;

}
