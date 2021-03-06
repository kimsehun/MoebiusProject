package kr.co.moebius.user;

import java.util.List;

import kr.co.moebius.seat.SitVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public void registUser(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		userMapper.registUser(userVO);
	}
	
	@Override
	public List<ZipcodeVO> searchZipcode(String area) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.searchZipcode(area);
	}
	
	@Override
	public UserVO getUser(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getUser(userVO);
	}
	
	@Override
	public int deleteUser(UserVO userVO) throws Exception {
		return userMapper.deleteUser(userVO);
			
	}
	
	@Override
	public int idCheck(String user_id) throws Exception {
		return userMapper.idCheck(user_id);
	}
	
	@Override
	public int Check(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.Check(userVO);
	}
	
	@Override
	public UserVO getUserInfo(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getUserInfo(userVO);
	}
	
	@Override
	public UserVO emailaddr(String user_id) throws Exception {
		return userMapper.emailaddr(user_id);
	}
	
	@Override
	public UserVO searchId(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.searchId(userVO);
	}
	
	@Override
	public UserVO searchPwd(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.searchPwd(userVO);
	}
	
	@Override
	public void updateUser(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		if(userMapper.updateUser(userVO) == 0 ) {
			throw new RuntimeException("정보를 수정할 수 없습니다.");
		}
	}
	
	@Override
	public int changePwd(InfoVO infoVO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.changePwd(infoVO);
	}
	
	@Override
	public List<UserInfoVO> getReserveInfo(UserInfoVO uifVO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getReserveInfo(uifVO);
	}
	
	@Override
	public void deleteInfo(UserInfoVO uifVO) throws Exception {
		// TODO Auto-generated method stub
		userMapper.deleteInfo(uifVO);
	}
	
	@Override
	public int getPoint(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getPoint(user_id);
	}
	
	@Override
	public void usePoint(SitVO sitVO) throws Exception {
		// TODO Auto-generated method stub
		userMapper.usePoint(sitVO);
	}
	
	@Override
	public int getUserPoint(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getUserPoint(user_id);
	}
	
	@Override
	public int getAge(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getAge(user_id);
	}
}
