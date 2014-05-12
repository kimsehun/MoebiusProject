package kr.co.moebius.user;

import java.util.List;

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
	public void deleteUser(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		userMapper.deleteUser(userVO);
	}
	
	@Override
	public int idCheck(String user_id) throws Exception {
		return userMapper.idCheck(user_id);
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
}
