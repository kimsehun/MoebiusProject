package kr.co.moebius.user;

import java.util.List;

import kr.co.moebius.reserve.ReserveVO;
import kr.co.moebius.seat.SitVO;

public interface UserMapper {

	void registUser(UserVO userVO) throws Exception;

	List<ZipcodeVO> searchZipcode(String area) throws Exception;

	UserVO getUser(UserVO userVO) throws Exception;

	int deleteUser(UserVO userVO) throws Exception;

	int idCheck(String user_id) throws Exception;

	int Check(UserVO userVO) throws Exception;

	UserVO getUserInfo(UserVO userVO) throws Exception;

	UserVO searchId(UserVO userVO) throws Exception;

	UserVO searchPwd(UserVO userVO) throws Exception;

	UserVO emailaddr(String user_id) throws Exception;

	int updateUser(UserVO userVO) throws Exception;

	int changePwd(InfoVO infoVO) throws Exception;

	//포인트 증가
	void pointUp(String user_id);

	List<UserInfoVO> getReserveInfo(UserInfoVO uifVO) throws Exception;

	void deleteInfo(UserInfoVO uifVO) throws Exception;

	int getPoint(String user_id) throws Exception;

	void usePoint(SitVO sitVO) throws Exception;

	int getUserPoint(String user_id) throws Exception;

	int getAge(String user_id) throws Exception;
	
	//예약 취소로 인한 포인트 반환
	void rePoint(ReserveVO vo);

}
