package kr.co.moebius.user;

import java.util.List;

import kr.co.moebius.seat.SitVO;

public interface UserService {

	void registUser(UserVO userVO) throws Exception;

	List<ZipcodeVO> searchZipcode(String area) throws Exception;

	UserVO getUser(UserVO userVO) throws Exception;

	void deleteUser(UserVO userVO) throws Exception;

	int idCheck(String user_id) throws Exception;

	int Check(UserVO userVO) throws Exception;

	UserVO getUserInfo(UserVO userVO) throws Exception;

	UserVO emailaddr(String user_id) throws Exception;
	
	UserVO searchId(UserVO userVO) throws Exception;

	UserVO searchPwd(UserVO userVO) throws Exception;

	void updateUser(UserVO userVO) throws Exception;

	int changePwd(InfoVO infoVO) throws Exception;

	List<UserInfoVO> getReserveInfo(UserInfoVO uifVO) throws Exception;

	
}
